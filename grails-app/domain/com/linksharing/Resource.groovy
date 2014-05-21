package com.linksharing

class Resource {

    String type//link or document
    String name
    String url


    static constraints = {
        /*url url: true,blank: false,nullable: false
        type blank: false,nullable: false
        string blank: false,nullable: false*/
    }
    static belongsTo = [topic:Topic,new:NewUser]

}
