package com.linksharing

class Role {

    String authority

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
    }
    static hasMany = [users: User]
}
