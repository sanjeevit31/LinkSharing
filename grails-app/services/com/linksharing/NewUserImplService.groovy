package com.linksharing

import grails.transaction.Transactional

@Transactional
class NewUserImplService {

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
     }
     return map


 }

}
