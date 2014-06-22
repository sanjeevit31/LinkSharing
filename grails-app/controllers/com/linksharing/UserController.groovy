package com.linksharing

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class UserController {
    def springSecurityService
    UserImplService userImplService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance

    }

    @Secured(['permitAll'])
    def create() {
        println 'from create of user'
        respond new User(params)
    }

    @Transactional
    @Secured(['permitAll'])
    def save(User userInstance) {
        println params
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        userInstance.save flush: true
        Role role = Role.get(2)
        UserRole userRole = new UserRole()
        userRole.role = role
        userRole.user = userInstance
        userRole.save(failOnError: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])

                redirect([controller: "user", action: "userCreatedMsg"])
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        if (userInstance == null) {
            userInstance = User.get(springSecurityService.principal.id)
        }
        println userInstance
        respond userInstance, model: [user: userInstance]
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    @Secured(['permitAll'])
    def userCreatedMsg() {

    }

    @Secured(['permitAll'])
    def dashBoard() {
        Integer offset = 0
        if (params.offset)
            offset = Integer.parseInt(params.offset)

        User user = springSecurityService.getCurrentUser()
        List<Topic> hotTopics = Subscribed.getHotTopics(offset)
        Integer hotTopicCount = Subscribed.hotTopicCount()
        List<User> popularAuthors = Subscribed.getPopularAuthors()
        render(view: 'dashBoard', model: [hotTopics: hotTopics, popularAuthors: popularAuthors, user: user, hotTopicCount: hotTopicCount])
    }

    def userDashBoard(){

        Integer offset=0
        User user=springSecurityService.getCurrentUser()
        if(params.offset){
            offset = Integer.parseInt(params.offset)
        }
        List userTopics = Topic.getUserTopics(user,offset)
        Integer totalSubscriber = Subscribed.getTotalSubscriber(user)
        List topicAndTheirSubscriptionCount = Topic.getTopicAndTheirSubscriptionCount(user)

        render view: "userDashBoard",model: [user:user,userTopics:userTopics,totalSubscriber:totalSubscriber,topicAndTheirSubscriptionCount:topicAndTheirSubscriptionCount]
    }

    @Secured(['permitAll'])
    def resetPasswordForm() {
    }

    //reset Password Link Creation
    @Secured(['permitAll'])
    @Transactional(readOnly = false)
    def resetPassword() {
        println 'from action resetPassword of User'
        println 'params:' + params

        Map map = userImplService.resetPassword(params, request.getRequestURL())
        if (map?.flag) {
            return
        } else
            render 'Wrong EmailId'
    }

    //form after click on reset Link
    @Transactional(readOnly = false)
    def resetPaswordChange() {
        println 'from user action resetPaswordChange'
        println params
        String emailId = ''
        ResetPassword resetPassword = ResetPassword.findByForgetKey(params?.key)
        boolean flag = resetPassword ? true : false
        println flag
        if (flag) {
            emailId = resetPassword.emailId
            ResetPassword.findAllByEmailId(emailId).each { it > it.delete() }
            //resetPassword.delete()
            render(view: 'resetPaswordChange', model: [key: params.key, emailId: emailId])
        } else
            render 'invalid Link'
    }

    //password change using reset link
    @Transactional(readOnly = false)
    def passwordChange() {
        println 'from user action passwordChange'
        println params
        Map map = userImplService.passwordChange(params)
        if (map?.flag)
            render 'password change successfully'
        else
            render 'wrong user'
    }

    //password change form from userprofile
    def changePasswordForm() {
        User user = springSecurityService.getCurrentUser()
        if (user)
            model: [user: user]
    }

    //password change from userprofile
    @Transactional(readOnly = false)
    def changeUserPassword() {
        Map map = [oldPassword: params.oldPassword, newPassword: params.newPassword, confirmPassword: params.confirmPassword, userId: (springSecurityService.getCurrentUser().id)]
        map = User.changePassword(map)
        println map
        render view: 'changeUserPassword', model: ['status': (map.status)]
    }

}
