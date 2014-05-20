package com.linksharing

class NewUser {
    String fname
    String lname
    String emailid
    String password
    String mob
    String country
    String state
    String gender

    static constraints = {
       fname  blank :false,nullable: false
        lname blank :false,nullable: false
        emailid email: true,unique: true,blank: false,nullable: false
        password  nullable: false
        mob nullable: false;
        country nullable: false
        gender nullable: false

}
}