package com.linksharing

import grails.transaction.Transactional

@Transactional
class UserDasBoardService {


    def serviceMethod() {
println Topic.list()
    }
}
