package com.linksharing

import grails.transaction.Transactional
import linksharing.Person

@Transactional
class UserDasBoardService {


    def serviceMethod() {
println Topic.list()
    }
}
