package com.linksharing

class Resource {


    String heading
    String type//link or document
    String url_path
    static hasMany = [resourceReadUnreadStatus: ResourceReadUnreadStatus]

    static constraints = {

    }
    static belongsTo = [topic: Topic, new: User]

}
