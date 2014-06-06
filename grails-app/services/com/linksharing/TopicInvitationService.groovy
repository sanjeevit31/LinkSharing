package com.linksharing

import grails.transaction.Transactional

@Transactional
class TopicInvitationService {
    def serviceMail

    def serviceMethod() {
        println 'from TopicInvitationService '

    }



   public void invites(Object params,NewUser newUser){
       println 'from TopicInvitationService invites '
       println 'params'+params
       println 'newUser'+newUser.id
       List topicList   =   ['Select Topic']
       List<Subscribed> subscribedlist    =   Subscribed.findAllByNewUsers(newUser)
       List<NewUser> userList   =   NewUser.findAll()
       println 'index of:'+userList.indexOf(newUser)
       println newUser
       println userList

       subscribedlist.each {it->
           topicList.add(it.topic)
       }
       params.userList  =   userList
       params.topicList  =   topicList
    }

    @Transactional(readOnly = false)
   public Map invitesSend(Object params){
        Map map=new HashMap()
        map.errorFlag='false'
       println 'from TopicInvitationService invites '
       println 'params'+params
       String topicName=params.topic
       Topic topic  =   Topic.findByName(topicName)

       try{
           NewUser invitedTo  =   NewUser.findByEmailid(params.invitedTo)
           NewUser invitedBy    =   NewUser.findByEmailid(params.invitedBy)
           TopicInvitation  topicInvitation =   new TopicInvitation()

           if(topic!=null && invitedTo!=null && invitedBy!=null)
           {
               topicInvitation.topic    =   topic
               topicInvitation.invitedTo    =   invitedTo
               topicInvitation.invitedBy    =   invitedBy
               topicInvitation.save()
               

           }
           else
               map.errorFlag=true
       }
       catch(Exception e){
           println 'from Exception'
           map.errorFlag=true
           println 'Exception in invitesSend()'+e

       }
        println map
        map

   }


  public Map  unsubscribedUserList(Object params){
      List<Subscribed> subscribedListOfTopic
      def userList=[]
      List subscribedUserIdList
      Topic topic   =   Topic.findByName(params?.topic)
      if(topic!=null){
         subscribedListOfTopic   =   Subscribed.findAllByTopic(topic)
      }
      if(subscribedListOfTopic!=null){
          subscribedUserIdList =   new ArrayList()
          subscribedListOfTopic.each {it->
              subscribedUserIdList.add(it.newUsers.id)
          }
          println subscribedUserIdList

          userList=NewUser.createCriteria().list{
              not {
                  'in'("id",subscribedUserIdList)
              }
          }
          println userList.size()
          println NewUser.list().size()
      }


      [userList:userList]
}
}