package com.linksharing

import grails.transaction.Transactional

import javax.servlet.ServletContext

class TopicInvitationController {
    TopicInvitationService topicInvitationService
    def index() {render '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}

    def invites(){
        String appContext   =   HelpUtil.getApplicationContext(request.getRequestURL())
        println 'from TopicInvitationController invites'
        println 'params:'+params
        println session.user
        topicInvitationService.invites(params,session.user)
        params.appContext   = appContext

    }
    @Transactional(readOnly = false)
    def invitesSend(){
        Map map =   topicInvitationService.invitesSend(params)
        if(map !=null && map.errorFlag==true)
        render 'Fail to send invitation'
        else
            render 'Successfully invitation was sent'
    }

    def unsubscribedUserList(){
        println 'from unsubscribedUserList'
        Map map=topicInvitationService.unsubscribedUserList(params)
        render(view:'unsubscribedUserList', model:[userList:map?.userList])


    }


}
