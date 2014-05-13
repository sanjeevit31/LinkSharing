package com.linksharing

class Users extends UsersParrents {

    Integer age
    String sex
    Integer mob
    Integer salary



    static constraints = {
    }
    static mapping = {
        table('childUser')
    }
}
