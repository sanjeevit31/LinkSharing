package com.linksharing

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//
//@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ResourceController {
    def springSecurityService
    ResourceImplService resourceImplService;
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Resource.list(params), model: [resourceInstanceCount: Resource.count()]
    }

    def show(Resource resourceInstance) {
        respond resourceInstance
    }

    def create() {
        User user = springSecurityService.getCurrentUser()
        Map map = [:]
        respond new Resource(params),model: [user:user]
    }

    @Transactional
    def save(Resource resourceInstance) {
        println 'from save' + params
        String type = params.type

        if (type != null && !type.equals('')) {
            if (type.equals('Document')) {
                String filePath =   resourceImplService.upload(servletContext, request, type, params?.topic?.id)
                params.file_path= filePath
                resourceInstance.properties = params;

            }

        }

        if (resourceInstance == null) {
            notFound()
            return
        }

        if (resourceInstance.hasErrors()) {
            respond resourceInstance.errors, view: 'create'
            return
        }

        resourceInstance.save flush: true
        //  resourceImplService.readWriteEntryForResource(resourceInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'resource.label', default: 'Resource'), resourceInstance.id])
                redirect resourceInstance
            }
            '*' { respond resourceInstance, [status: CREATED] }
        }
    }

    def edit(Resource resourceInstance) {
        respond resourceInstance
    }

    @Transactional
    def update(Resource resourceInstance) {
        println 'from resource update'
        println 'params:' + params
        if (resourceInstance == null) {
            notFound()
            return
        }

        if (resourceInstance.hasErrors()) {
            respond resourceInstance.errors, view: 'edit'
            return
        }

        resourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Resource.label', default: 'Resource'), resourceInstance.id])
                redirect resourceInstance
            }
            '*' { respond resourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Resource resourceInstance) {

        if (resourceInstance == null) {
            notFound()
            return
        }
        Topic topic = resourceInstance.topic
        resourceInstance.delete flush: true
        println 'resource Deleted'

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Resource.label', default: 'Resource'), resourceInstance.id])
//                redirect action:"index", method:"GET"
                redirect controller: 'topic', action: 'show', params: [topicInstance: topic]
//                respond resourceInstance.topic
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def topicsResource(Integer max) {
        println 'from topic Resource'
        println 'params:' + params
        resourceImplService.resourceList(params, session.user, request.getRequestURL())
    }


    def resourceReadStatus() {
        println 'from resourceReadStatus'
        println 'params:' + params
        resourceImplService.readWriteEntryForResource(params)
        render 'success'
    }


    def mail() {
        sendMail {
            to "sanjeev.jha@intelligrape.com"
            subject "Hello Fred"
            body 'How are you?'
        }
        println "mail sent.."
        render 'success'
    }


    def download() {
        println 'from download1'
        println 'params:' + params
        Map map = resourceImplService.download(params, response)

        render 'SUCCESSFULLY DOWNLOADED.......'
    }

    def demo(){

    }
}