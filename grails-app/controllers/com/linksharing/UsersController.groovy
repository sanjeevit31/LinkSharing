package com.linksharing

class UsersController {

    def login() {
    //render([view: 'login'])
    }

    def registration(){
        render([view: '/newUser/index'])
    }
   def userLogin(){

       String name= params['name']
       String pass=params['password']
       String keepMeLogin=params['keepMeLogin']
       String errorMessage=''

       NewUser newUser= NewUser.findByEmailidAndPassword(name,pass)

       if(newUser != null){
           session.setAttribute('userid',newUser.id)
           render 'Welcome '+newUser.fname+' '+newUser.lname
       }

       else{
           session.removeAttribute('userid')
           //flash.message='from flash invalid username or password'
          // println flash.message
           session.invalidate()

          render(view: 'login',model: errorMessage=' invalid username or password')

       }


   }
}
