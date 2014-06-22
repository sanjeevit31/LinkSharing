package com.linksharing

class ResourceReadUnreadStatus {

    Date created = new Date()
    Date readDate = new Date()
    String status
    static constraints = {
        readDate nullable: true
    }
    static belongsTo = [resource: Resource, user: User]
}
