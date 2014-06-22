package com.linksharing

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class TopicController {
    TopicService topicService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        println params
        params.max = Math.min(max ?: 10, 100)
        User user = springSecurityService.getCurrentUser()
        List<Topic> topics = Topic.findAllByVisibilityOrUser('public', session.getAttribute('user'), params)

        respond topics, model: [topicInstanceCount: Topic.count(), topic: topics,user:user]

    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def show(Topic topicInstance) {
        println params
        println 'from show of Topic Controller'
        Map map = topicService.show(topicInstance)
        respond topicInstance, model: map
    }

    def create() {
        User user = springSecurityService.getCurrentUser()
        respond new Topic(params),model: [user:user]
    }

    @Transactional
    def save(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view: 'create'
            return
        }
        params.interestLevel = 'active'
        params.createdDate = new Date()
        topicInstance.addToSubscribers(new Subscribed(params))

        println topicInstance.validate()
        println topicInstance.errors.allErrors
        topicInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        User user=springSecurityService.getCurrentUser()
        params.userId=user?.id
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view: 'edit'
            return
        }

        topicInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }
        //topicService.deleteTopicResource(topicInstance)
        topicInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    public getAuthorsHotTopics() {

        List topics = Topic.getAuthorsHotTopics(params.id)
    }

    def userRecentTopics() {
        println 'from userRecentTopics'
        println params
        List<Topic> userRecentTopic
        User user = User.get(params.userId)
        println user
        if (user) {
            userRecentTopic = Topic.findAllByUser(user, [max:3, sort: "dateCreated"])
            render(view: 'userRecentTopics', model: [userRecentTopic: userRecentTopic])
        } else {
            render 'Some Error Occur'
        }

    }

    def topicDetails(){
        User user=springSecurityService.getCurrentUser()
        Topic topicInstance = Topic.get(params.id)
       if(topicInstance)
        render view: 'topicDetails',model: [topicTitle:topicInstance.name,topicCreatedDate:topicInstance.dateCreated,topicSummery:topicInstance.summery,user:user]
       return;
    }

    def topicSearch(){
       User user=springSecurityService.getCurrentUser()
        Integer offset = 0
        if(params.offset)
            offset = Integer.parseInt(params.offset)
        println 'from TopicCon topicSearch1111111...'+params.searchKey
        List<Topic> topics = Topic.topicSearch(params.searchKey,offset)
        println params.searchKey
        println '<<<<<<<<<'
        println user
        render(view: 'topicSearch',model: [topics:topics,searchKey:params.searchKey,user:user])
    }
}
