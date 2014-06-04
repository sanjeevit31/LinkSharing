package com.linksharing

import grails.transaction.Transactional

import javax.crypto.Cipher

@Transactional(readOnly = false)
class NewUserImplService {
    def mailService
    def serviceMethod() {

    }
  public Map countryAndStates(){

        List state=State.list()
        List country=Country.list()

    Map map=['state':state,'country':country]
    return map

    }


 public Map dashBord(NewUser newUser){
     Map map=[:]
     if(newUser!=null){
         map['name']= newUser.fname+' '+newUser.lname
         map['sex']='male'
     }

     return map
 }

    public Map resetPassword(Object params){
        println  'from resetPasswod method of NewUserImpl'
        String emailid=params?.emailid
        boolean flag=(NewUser.findByEmailid(emailid))?true:false
        println emailid
        String key = new Date().getTime().toString()
        ResetPassword   resetPassword   =   new ResetPassword()
        resetPassword.emailid1  =   emailid
        resetPassword.key1  =   key
        resetPassword.save()
        println 'save successfully'
        sendMail(){
            to "sanjeev.jha@intelligrape.com"
            subject "Password Reset"
            body 'How are you?'

        }

    }


}
