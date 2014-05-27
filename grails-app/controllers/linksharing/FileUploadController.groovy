package linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FileUploadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FileUpload.list(params), model:[fileUploadInstanceCount: FileUpload.count()]
    }

    def show(FileUpload fileUploadInstance) {
        respond fileUploadInstance
    }

    def create() {
        respond new FileUpload(params)
    }

    @Transactional
    def save(FileUpload fileUploadInstance) {
        if (fileUploadInstance == null) {
            notFound()
            return
        }

        if (fileUploadInstance.hasErrors()) {
            respond fileUploadInstance.errors, view:'create'
            return
        }

        fileUploadInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fileUpload.label', default: 'FileUpload'), fileUploadInstance.id])
                redirect fileUploadInstance
            }
            '*' { respond fileUploadInstance, [status: CREATED] }
        }
    }

    def edit(FileUpload fileUploadInstance) {
        respond fileUploadInstance
    }

    @Transactional
    def update(FileUpload fileUploadInstance) {
        if (fileUploadInstance == null) {
            notFound()
            return
        }

        if (fileUploadInstance.hasErrors()) {
            respond fileUploadInstance.errors, view:'edit'
            return
        }

        fileUploadInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FileUpload.label', default: 'FileUpload'), fileUploadInstance.id])
                redirect fileUploadInstance
            }
            '*'{ respond fileUploadInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FileUpload fileUploadInstance) {

        if (fileUploadInstance == null) {
            notFound()
            return
        }

        fileUploadInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FileUpload.label', default: 'FileUpload'), fileUploadInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fileUpload.label', default: 'FileUpload'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def fileuploadd(){
println 'hello'
    }
}
