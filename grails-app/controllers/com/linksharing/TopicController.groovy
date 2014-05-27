package com.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {
    TopicService topicService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)

        println params
       //List topic=Topic.list(params)
       List topic=Topic.findAllByVisibilityOrNewUsers('public',session.getAttribute('user'),params)
       // Topic.findAllWhere([id: session.getAttribute('user').id])
       // println 'topic'+topic

       // int size=topic.size();
        //int size1=Topic.count()
        //println topic+':'+size+':'+size1
        //respond topic,model:[topicInstanceCount:size,topicList:topic]
       respond topic, model:[topicInstanceCount: Topic.count(),topic:topic]
       // render(view: 'index', model:[topic:topic,topicInstanceCount:topic.size()] )
    }

    def show(Topic topicInstance) {
       Map map=topicService.show(topicInstance,session.getAttribute('userid'))
        String buttonVisibility='buttons'
        boolean flag= session.getAttribute('user').id==topicInstance.newUsers.id
        if(!flag){
            buttonVisibility='buttonsHide'
        }

        respond topicInstance,model: map//[TopicDeleteEditFlag:buttonVisibility,flag:flag]
    }

    def create() {
        respond new Topic(params)
    }

    @Transactional
    def save(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'create'
            return
        }
        params.interestLevel='active'
        params.createdDate=new Date()
        topicInstance.addToSubscribers(new Subscribed(params))
        println topicInstance.validate()
        println topicInstance.errors.allErrors
        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
               redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'edit'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*'{ respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
