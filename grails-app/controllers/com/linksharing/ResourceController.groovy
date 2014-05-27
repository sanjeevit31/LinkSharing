package com.linksharing

import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResourceController {
    ResourceImplService resourceImplService;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Resource.list(params), model:[resourceInstanceCount: Resource.count()]
    }

    def show(Resource resourceInstance) {
        respond resourceInstance
    }

    def create() {
        Map map=[:]
                                    println 'from create of resource controller'+params
        params.userid=session.userid
                                     println 'from create of resource controller'+params
//        if(resourceServiceImpl1!=null){
//        map=resourceServiceImpl.getUserAndTopic(params)
//                                      println 'from create of resource controller map'+map
//        }
//       String topicName= Topic.findById(params.topicid).name
//        println 'topic name'+topicName
//        params.topicName=topicName
//        println params
        respond new Resource(params)
    }

    @Transactional
    def save(Resource resourceInstance) {
        println 'from save'+params
        String type=params.type

        if(type!=null && !type.equals(''))
        {
            if(type.equals('Document')){
                resourceImplService.upload(servletContext,request,type,params)

                resourceInstance.properties=params;

            }

        }

        if (resourceInstance == null) {
            notFound()
            return
        }

        if (resourceInstance.hasErrors()) {
            respond resourceInstance.errors, view:'create'
            return
        }

        //sanjeev


        resourceInstance.save flush:true
        resourceImplService.readWriteEntryForResource(resourceInstance)

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
        if (resourceInstance == null) {
            notFound()
            return
        }

        if (resourceInstance.hasErrors()) {
            respond resourceInstance.errors, view:'edit'
            return
        }

        resourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Resource.label', default: 'Resource'), resourceInstance.id])
                redirect resourceInstance
            }
            '*'{ respond resourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Resource resourceInstance) {

        if (resourceInstance == null) {
            notFound()
            return
        }

        resourceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Resource.label', default: 'Resource'), resourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def topicsResource(){
        //render params.topicid
       resourceImplService.resourceList(params)

    }
}
