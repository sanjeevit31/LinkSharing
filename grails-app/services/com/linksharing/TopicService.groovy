package com.linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {
    def springSecurityService

    def serviceMethod() {

    }

    public Map show(Topic topicInstance) {
        println topicInstance
        User user = springSecurityService.getCurrentUser()
        Map map = [:]
        boolean topicSubscribeFlag = false;
        String buttonVisibility = 'buttons'
        boolean flag = (user.id == topicInstance.user.id)
        println 'flag before if' + flag
        if (user.emailId == 'sanjeev.jha@intelligrape.com') {
            flag = true
            println 'flag after if' + flag

        }

        if (!flag) {
            buttonVisibility = 'buttonsHide'
        }

        // User user=User.findById(userid)
        Subscribed subscribed = Subscribed.findByTopicAndUser(topicInstance, user)

        if (subscribed == null)
            topicSubscribeFlag = true

        map.TopicDeleteEditFlag = buttonVisibility
        map.topicSubscribeFlag = topicSubscribeFlag
        map.flag = flag
        println map
        return map
    }

    @Transactional(readOnly = false)
    public void deleteTopicResource(Topic topicInstance) {
        TopicInvitation.executeUpdate("delete from TopicInvitation i where i.topic = :topic", [topic: topicInstance])
        Subscribed.executeUpdate("delete from Subscribed i where i.topic = :topic", [topic: topicInstance])
        List<Resource> resourceList = Resource.findAllByTopic(topicInstance)
        ResourceReadUnreadStatus.where { inList('resource', resourceList) }.deleteAll()
        Resource.where { eq('topic', topicInstance) }.deleteAll()

        println 'sucessfully deleted'


    }
}
