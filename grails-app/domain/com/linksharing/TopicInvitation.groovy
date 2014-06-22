package com.linksharing

class TopicInvitation {
    String invitedTo
    static belongsTo = [topic: Topic, user: User]
    static constraints = {

    }
    static mapping = {
        invitedTo column: 'invitedTo'
        user column: 'invitedBy'
        topic column: 'topic'
    }
}
