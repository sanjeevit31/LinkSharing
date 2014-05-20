package com.linksharing

class Subscribed {
    String interestLevel
    Date createdDate
    static belongsTo = [newUsers:NewUser,topic:Topic]


    static constraints = {
        interestLevel nullable: true,blank: true
    }
}
