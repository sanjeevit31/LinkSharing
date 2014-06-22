package com.linksharing

import grails.transaction.Transactional

@Transactional
class TopicInvitationService {
    def mailService

    def serviceMethod() {
        println 'from TopicInvitationService '

    }



   public void invites(Object params,User user){
       println 'from TopicInvitationService invites '
       println 'params'+params
       println 'user'+user.id
       List topicList   =   ['Select Topic']
       List<Subscribed> subscribedlist    =   Subscribed.findAllByUsers(user)
       List<User> userList   =   User.findAll()
       println 'index of:'+userList.indexOf(user)
       println user
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
           User invitedTo  =   User.findByEmailid(params.invitedTo)
           User invitedBy    =   User.findByEmailid(params.invitedBy)
           TopicInvitation  topicInvitation =   new TopicInvitation()

           if(topic!=null && invitedTo!=null && invitedBy!=null)
           {
               topicInvitation.topic    =   topic
               topicInvitation.invitedTo    =   invitedTo
               topicInvitation.invitedBy    =   invitedBy
               topicInvitation.save()
               mailService.sendMail(){
                   to  invitedTo.emailId;
                   subject "${invitedBy.fname} wants to add you for Topic ${topic.name} "
                   html 'To Subscribed Click <a href="/LinkSharing/user/resetPaswordChange?forgetKey=1">Here</a>';

               }

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
              subscribedUserIdList.add(it.users.id)
          }
          println subscribedUserIdList

          userList=User.createCriteria().list{
              not {
                  'in'("id",subscribedUserIdList)
              }
          }
          println userList.size()
          println User.list().size()
      }


      [userList:userList]
}
}