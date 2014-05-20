package com.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NewUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NewUser.list(params), model:[newUserInstanceCount: NewUser.count()]
    }

    def show(NewUser newUserInstance) {
        respond newUserInstance

    }

    def create() {
        respond new NewUser(params)
    }

    @Transactional
    def save(NewUser newUserInstance) {
        if (newUserInstance == null) {
            notFound()
            return
        }

        if (newUserInstance.hasErrors()) {
            respond newUserInstance.errors, view:'create'
            return
        }

        newUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newUser.label', default: 'NewUser'), newUserInstance.id])
               // redirect newUserInstance
                redirect([controller: "newUser",action: "userCreatedMsg"])
            }
            '*' { respond newUserInstance, [status: CREATED] }
        }
    }

    def edit(NewUser newUserInstance) {
        respond newUserInstance
    }

    @Transactional
    def update(NewUser newUserInstance) {
        if (newUserInstance == null) {
            notFound()
            return
        }

        if (newUserInstance.hasErrors()) {
            respond newUserInstance.errors, view:'edit'
            return
        }

        newUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NewUser.label', default: 'NewUser'), newUserInstance.id])
                redirect newUserInstance
            }
            '*'{ respond newUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NewUser newUserInstance) {

        if (newUserInstance == null) {
            notFound()
            return
        }

        newUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NewUser.label', default: 'NewUser'), newUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newUser.label', default: 'NewUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def login(){

    }
    def userCreatedMsg(){

    }
    def validateUser(){
        String name= params['name']
        String pass=params['password']
        String keepMeLogin=params['keepMeLogin']
       // String errorMessage=""

        NewUser newUser= NewUser.findByEmailidAndPassword(name,pass)
        if(newUser != null){
            session.setAttribute('userid',newUser.id)
            render 'Welcome '+newUser.fname+' '+newUser.lname
        }

        else{
            session.removeAttribute('userid')
            //flash.message='from flash invalid username or password'
            // println flash.message
            session.invalidate()
            println 'validateUser else'

            render(view: '/newUser/login',model: [errorMessage:' invalid username or password'])

        }
    }

}
