package linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DemoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Demo.list(params), model:[demoInstanceCount: Demo.count()]
    }

    def show(Demo demoInstance) {
        respond demoInstance
    }

    def create() {
        respond new Demo(params)
    }

    @Transactional
    def save(Demo demoInstance) {
        if (demoInstance == null) {
            notFound()
            return
        }

        if (demoInstance.hasErrors()) {
            respond demoInstance.errors, view:'create'
            return
        }

        demoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'demo.label', default: 'Demo'), demoInstance.id])
                redirect demoInstance
            }
            '*' { respond demoInstance, [status: CREATED] }
        }
    }

    def edit(Demo demoInstance) {
        respond demoInstance
    }

    @Transactional
    def update(Demo demoInstance) {
        if (demoInstance == null) {
            notFound()
            return
        }

        if (demoInstance.hasErrors()) {
            respond demoInstance.errors, view:'edit'
            return
        }

        demoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Demo.label', default: 'Demo'), demoInstance.id])
                redirect demoInstance
            }
            '*'{ respond demoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Demo demoInstance) {

        if (demoInstance == null) {
            notFound()
            return
        }

        demoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Demo.label', default: 'Demo'), demoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'demo.label', default: 'Demo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
