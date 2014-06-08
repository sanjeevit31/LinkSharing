package com.linksharing

import grails.transaction.Transactional

class NewUser {
    String fname
    String lname
    String emailid
    String password
    String confirmPassword

    String mob
    String country
    String state
    String gender
    static  transients = ['confirmPassword']

    static constraints = {
       fname  blank :false,nullable: false
       lname blank :false,nullable: false
        emailid blank: false,nullable: false,unique: true

       password  nullable:false/*, validator:{ val,object->
       println val+':'+object.confirmPassword+':'+object.password
            if ((val != object.confirmPassword)) {
                return 'password.Mismatch'
            }
            return true
        }*/

        mob nullable: false;
        country nullable: false
        gender nullable: false

    }
    @Override
    public String toString(){
        return emailid
    }
    static hasMany = [subscribed:Subscribed,resource:Resource]

    public static Map changePassword2(Map map){
        Map map1=[:]
        int userId  =   map?.userId
        String oldPassword=map?.oldPassword
        String newPassword=map?.newPassword
        String confirmPassword=map?.confirmPassword
        NewUser newUser =   NewUser.findById(userId)

        if((newUser?.password==oldPassword) && (newPassword==confirmPassword)){
            println 'from if of changePassword2'
            newUser.password=newPassword
            if(newUser.save()) {
                map1.status='success'
            }
        }
        else
            map1.status='fails'
        return map1

    }
}