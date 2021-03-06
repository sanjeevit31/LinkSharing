package com.linksharing

import javax.transaction.Transaction

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NewUserController {
    NewUserImplService newUserImplService


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NewUser.list(params), model:[newUserInstanceCount: NewUser.count()]
    }

    def show(NewUser newUserInstance) {
        respond newUserInstance

    }

    def create() {
       println 'from create of newUser'
        respond new NewUser(params)
    }

    @Transactional
    def save(NewUser newUserInstance) {
        println params
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

                redirect([controller: "newUser",action: "userCreatedMsg"])
            }
            '*' { respond newUserInstance, [status: CREATED] }
        }
    }

    def edit(NewUser newUserInstance) {
        if(newUserInstance==null){
            newUserInstance =   NewUser.findById(session.user.id)
        }
        println newUserInstance
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
        println 'from validate'
        String name= params['name']
        String pass=params['password']
        String keepMeLogin=params['keepMeLogin']
        NewUser newUser= NewUser.findByEmailidAndPassword(name,pass)
        println 'new User'+newUser
        if(newUser != null){
            session.setAttribute('userid',newUser.id)
            session.setAttribute('user',newUser)
            session.setAttribute('name',newUser.fname+' '+newUser.lname)
            session.setAttribute('msg','You are SuccessFully logined.......')
            Map map=newUserImplService.dashBord(newUser)
            println 'before render'
            render(view: 'dashBord',model: [msg:'You are SuccessFully logined.......',map:map])
         }
        else{
            session.removeAttribute('userid')
            session.invalidate()
            println 'validateUser else'
            render (view: 'login',model:[errorMessage:' invalid username or password'])
        }
    }



    def demojquery(){
    }


    def logout(){
        session.removeAttribute('userid')
        session.removeAttribute('user')
        session.invalidate()
        render(view: '/newUser/login',model: [errorMessage:' You are SuccessFully LogOut..'])
    }




    def dashBord(NewUser newUser){
        Map map=newUserImplService.dashBord(newUser)
        render(view: 'dashBord',model: [msg:'You are SuccessFully logined.......',map:map])
    }


    def resetPasswordForm(){
    }


    @Transactional(readOnly = false)
    def resetPassword(){
        println 'from action resetPassword of NewUser'
        println 'params:'+params

        Map map =  newUserImplService.resetPassword(params,request.getRequestURL())
        if(map?.flag){
            return
        }
        else
            render 'Wrong EmailId'

    }


    @Transactional(readOnly = false)
    def resetPaswordChange(){
        println 'from newUser action resetPaswordChange'
        println params
        String emailid=''
        ResetPassword resetPassword =   ResetPassword.findByKey1(params?.key)
        boolean flag  =   resetPassword?true:false
        println flag
        if(flag){
            emailid=resetPassword.emailid1
            resetPassword.delete()
            render (view: 'resetPaswordChange',model: [key:params.key,emailid:emailid])
        }

        else
            render 'invalid Link'
    }




    @Transactional(readOnly = false)
    def passwordChange(){
        println 'from newUser action passwordChange'
        println params
        Map map  =  newUserImplService.passwordChange(params)
        if(map?.flag)
            render 'password change successfully'
        else
            render 'wrong user'

    }

    def changePassword1(){

    }

    @Transactional(readOnly = false)
    def changePassword2(){
        Map map=[oldPassword:params.oldPassword,newPassword:params.newPassword,confirmPassword:params.confirmPassword,userId:session.user.id]
       map= NewUser.changePassword2(map)
        println map
        render view:'changePassword2', model:['status':(map.status)]
    }






}
