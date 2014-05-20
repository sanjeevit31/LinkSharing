package com.linksharing

class ValidateusersFilters {

    def filters = {
        all(controller:'newUser',action:'create|login|save|userCreatedMsg', invert:true) {
            before = {
                         def id=session.getAttribute('userid')

                        println params
                        if(id==null ){

                        redirect([controller:"newUser",action:"login" ])

                         }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
