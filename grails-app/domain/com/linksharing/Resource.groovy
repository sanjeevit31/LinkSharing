package com.linksharing

class Resource {


    String heading
    String type//link or document
    String url_path
    static hasMany = [resourceReadUnreadStatus:ResourceReadUnreadStatus]

    static constraints = {
        /*url url: true,blank: false,nullable: false
        type blank: false,nullable: false
        string blank: false,nullable: false*/
    }
    static belongsTo = [topic:Topic,new:NewUser]

}
