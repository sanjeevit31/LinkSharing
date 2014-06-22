package com.linksharing

import grails.transaction.Transactional

@Transactional(readOnly = false)
class UserImplService {
    def mailService
    def springSecurityService
    def serviceMethod() {

    }
  public Map countryAndStates(){

        List state=State.list()
        List country=Country.list()

    Map map=['state':state,'country':country]
    return map

    }


 public Map dashBord(User user) {
     Map map=[:]
    println user
     if(user!=null){
         map.name= user.firstName+' '+user.lastName

     }
     println 'from ser'+map
     return map
 }
    @Transactional(readOnly = false)
    public Map resetPassword(Object params,StringBuffer requestUrl){
        String applicationContext=''
        if(requestUrl!=null)
        applicationContext  =    HelpUtil.getApplicationContext(requestUrl)
        println 'applicationContext'+applicationContext
        String emailId  =   params?.emailId
        boolean maillSuccess    =   false
        boolean flag    =   (User.findByEmailid(emailId))?true:false

        if(flag){
            String forgetKey   =  new Date().getTime().toString()
            forgetKey=forgetKey.encodeAsMD5()
            forgetKey=forgetKey.encodeAsSHA1()
            println forgetKey
            ResetPassword   resetPassword   =   new ResetPassword()
            resetPassword.emailId1  =   emailId
            resetPassword.forgetKey1  =   forgetKey
            resetPassword.save()

            mailService.sendMail(){
                to  emailId
                subject "Reset Password for LinkSharing"
                html 'click <a href="'+applicationContext+'/user/resetPaswordChange?forgetKey='+forgetKey+'">Here</a>'
                maillSuccess=true
            }

        }
        println 'maillSuccess'+maillSuccess
        [flag:maillSuccess]
    }



    @Transactional(readOnly = false)
    public Map passwordChange(Object params){
        String emailId=''
        boolean flag=false;
        emailId   =    params?.emailId
        if(emailId!=null && emailId!=''){
            User user =   User.findByEmailid(emailId)
            user.password    =   params.password
            println emailId
            println user.password
            println user.save(flush: true)
            flag=true

        }

        [flag:flag]
    }

}
