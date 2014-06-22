package com.intelligrape.linksharing

import com.linksharing.Topic
import com.linksharing.User

import java.text.SimpleDateFormat
import java.util.logging.SimpleFormatter


class LinkSharingTagLib {
    //static defaultEncodeAs = 'html'
    static encodeAsForTags = [topicSummery: 'raw']
    static namespace = "ls"

    def topicSummery = { attrs, body ->
        Topic topicInstance = attrs.topic
        String summery = topicInstance?.summery

        if (summery.length() >= 40) {
            out << summery.substring(0, 40)
            out << link(controller: 'topic', action: 'topicDetails', params: [id: topicInstance?.id], ' see more')

        } else if (summery.length() < 40) {
            out << summery
        }
    }

    def userFullName = { attrs, body ->
        User user = attrs.user
        println user
        String fullName=''

        if(user?.firstName)
            fullName=fullName + user.firstName

        if(user?.lastName)
            fullName=fullName+ ' ' + user.lastName


        println 'fullName'+fullName
        out << fullName
    }

    def timeFormat = { attrs, body ->
        Date date = attrs.date
        SimpleDateFormat dateFormat=new SimpleDateFormat('MMM dd, yyyy, hh:mm:ss a');
        out << dateFormat.format(date)
    }


}
