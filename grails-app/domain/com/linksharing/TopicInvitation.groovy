package com.linksharing

class TopicInvitation {
    String invitedTo
    static  belongsTo = [topic:Topic,invitedBy:NewUser]
    static constraints = {

    }
    static mapping = {
        invitedTo column: 'invitedTo'
        invitedBy column: 'invitedBy'
        topic column: 'topic'
    }
}
