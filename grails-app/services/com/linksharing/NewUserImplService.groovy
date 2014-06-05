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

        String emailid  =   params?.emailid
        boolean flag    =   (NewUser.findByEmailid(emailid))?true:false
        if(flag){
            String key   =  new Date().getTime().toString()
            ResetPassword   resetPassword   =   new ResetPassword()
            resetPassword.emailid1  =   emailid
            resetPassword.key1  =   key
            resetPassword.save()
            mailService.sendMail(){
                to  emailid
                subject "Reset Password for LinkSharing"
                html 'click <a href="http://localhost:8080/LinkSharing/newUser/resetPaswordChange/key='+key+'">Here</a>'


            }
            return [:]
        }
        else
            render 'InValid EmailID'



    }


}
