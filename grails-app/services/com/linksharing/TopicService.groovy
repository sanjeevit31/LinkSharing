package com.linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }
   public Map show(Topic topicInstance,NewUser user)
   {    println topicInstance
        println user
       Map map=[:]
       boolean topicSubscribeFlag   =   false;
       String buttonVisibility  =   'buttons'
       boolean flag =   (user.id==topicInstance.newUsers.id)
       println 'flag before if'+flag
       if(user.emailid=='sanjeev.jha@intelligrape.com'){
           flag=true
           println 'flag after if'+flag

       }

       if(!flag){
           buttonVisibility='buttonsHide'
       }

      // NewUser newUser=NewUser.findById(userid)
       Subscribed subscribed= Subscribed.findByTopicAndNewUsers(topicInstance,user)

       if(subscribed==null)
           topicSubscribeFlag=true

       map.TopicDeleteEditFlag=buttonVisibility
       map.topicSubscribeFlag=topicSubscribeFlag
       map.flag=flag
       println map
       return map
   }
    @Transactional(readOnly = false)
    public void deleteTopicResource(Topic topicInstance){
        TopicInvitation.executeUpdate("delete from TopicInvitation i where i.topic = :topic",[topic:topicInstance])
        Subscribed.executeUpdate("delete from Subscribed i where i.topic = :topic",[topic:topicInstance])
        List<Resource> resourceList =   Resource.findAllByTopic(topicInstance)
        ResourceReadUnreadStatus.where {inList('resource',resourceList)}.deleteAll()
        Resource.where {eq('topic',topicInstance)}.deleteAll()
       // ResourceReadUnreadStatus.executeUpdate("delete from ResourceReadUnreadStatus i where i.resource = :resource",[resource:])

//        def TopicInvitationList = TopicInvitation.createCriteria().list {
//            inList()
//        }
//        Topic.where {eq}.deleteAll()
//        TopicInvitationList*.delete()
//        throw  new Exception()
//        new ResourceReadUnreadStatus().resource
        println 'sucessfully deleted'


    }
}
