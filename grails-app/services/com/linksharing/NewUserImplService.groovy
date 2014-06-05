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
    @Transactional(readOnly = false)
    public Map resetPassword(Object params,StringBuffer requestUrl){

        int len=requestUrl.lastIndexOf('/')
        len=requestUrl.lastIndexOf('/',len-1)
        len=requestUrl.lastIndexOf('/',len-1)
        String applicationContext   =   requestUrl.substring(0,len)

        String emailid  =   params?.emailid
        boolean maillSuccess    =   false
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
                html 'click <a href="'+applicationContext+'/newUser/resetPaswordChange?key='+key+'">Here</a>'

                maillSuccess=true
            }

        }
        println 'maillSuccess'+maillSuccess
        [flag:maillSuccess]
    }



    @Transactional(readOnly = false)
    public Map passwordChange(Object params){
        String emailid=''
        boolean flag=false;
        emailid   =    params?.emailid
        if(emailid!=null && emailid!=''){
            NewUser newUser =   NewUser.findByEmailid(emailid)
            newUser.password    =   params.password
            println emailid
            println newUser.password
            println newUser.save(flush: true)
            flag=true

        }

        [flag:flag]
    }

}
