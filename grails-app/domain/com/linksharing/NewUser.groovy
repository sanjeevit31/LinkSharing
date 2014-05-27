package com.linksharing

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
}