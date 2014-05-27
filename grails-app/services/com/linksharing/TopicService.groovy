package com.linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }
   public Map show(Topic topicInstance,Long userid)
   {
       Map map=[:]
       boolean topicSubscribeFlag   =   false;
       String buttonVisibility  =   'buttons'
       boolean flag =   (userid==topicInstance.newUsers.id)

       if(!flag){
           buttonVisibility='buttonsHide'
       }

       NewUser newUser=NewUser.findById(userid)
       Subscribed subscribed= Subscribed.findByTopicAndNewUsers(topicInstance,newUser)

       if(subscribed==null)
           topicSubscribeFlag=true

       map.TopicDeleteEditFlag=buttonVisibility
       map.topicSubscribeFlag=topicSubscribeFlag
       map.flag=flag
       println map
       return map
   }
}
