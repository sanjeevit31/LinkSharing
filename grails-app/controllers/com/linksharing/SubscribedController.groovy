package com.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubscribedController {
    SubscribedImp subscribedImp

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subscribed.list(params), model:[subscribedInstanceCount: Subscribed.count()]
    }

    def show(Subscribed subscribedInstance) {
        respond subscribedInstance
    }

    def create() {
        respond new Subscribed(params)
    }

    @Transactional
    def save(Subscribed subscribedInstance) {
        if (subscribedInstance == null) {
            notFound()
            return
        }

        if (subscribedInstance.hasErrors()) {
            respond subscribedInstance.errors, view:'create',[status: CREATED]
            return
        }

       boolean flag=subscribedImp.subscriptionuniquness(subscribedInstance);
        println flag
        if(flag){

             redirect(controller:'subscribed',action: 'create',params: [errMsg: "You Can't Subscribe a Topic Again"])
            //render(view:'/subscribed/create')
           // respond subscribedInstance.errors, view:'create'
            return

        }
                else
            subscribedInstance.save flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subscribed.label', default: 'Subscribed'), subscribedInstance.id])
                redirect subscribedInstance
            }
            '*' { respond subscribedInstance, [status: CREATED] }
        }
    }

    def edit(Subscribed subscribedInstance) {
        respond subscribedInstance
    }

    @Transactional
    def update(Subscribed subscribedInstance) {
        if (subscribedInstance == null) {
            notFound()
            return
        }

        if (subscribedInstance.hasErrors()) {
            respond subscribedInstance.errors, view:'edit'
            return
        }

        subscribedInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Subscribed.label', default: 'Subscribed'), subscribedInstance.id])
                redirect subscribedInstance
            }
            '*'{ respond subscribedInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Subscribed subscribedInstance) {

        if (subscribedInstance == null) {
            notFound()
            return
        }

        subscribedInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Subscribed.label', default: 'Subscribed'), subscribedInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribed.label', default: 'Subscribed'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
