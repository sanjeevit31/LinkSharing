package com.linksharing

class Topic {

    String name
    String summery
    String visibility
    Date dateCreated
    Date lastUpdated

    static belongsTo = [newUsers:NewUser]
    //static hasOne = [subscribers:Subscribed]
   static hasMany = [subscribers:Subscribed]
    static constraints = {
        name  blank :false,nullable: false,unique: true
        summery maxSize: 1024
    }
}
