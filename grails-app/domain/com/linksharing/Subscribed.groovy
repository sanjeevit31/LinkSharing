package com.linksharing

class Subscribed {
    String interestLevel
    Date createdDate
    static belongsTo = [newUsers:NewUser,topic:Topic]

 static mapping = {
  // id composite: [newUsers,topic.id]
 }
    static constraints = {
        interestLevel nullable: true,blank: true
    }

}
