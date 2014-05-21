<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 13/5/14
  Time: 2:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="linksharing"> </meta>
    <title>Login</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css' ,file: 'formlogin.css')}">
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript>
        $(document).ready(function(){
            $("p").click(function(){
                $(this).hide();
            });
        });
        </g:javascript>
</head>

<body >


<div id="formdiv">
    </br>
<center>WELCOME  TO  LINK  SHARING
   <g:form controller="newUser" action="validateUser" method="POST"  name="loginform">
       </br></br>
         <p style="color: red">${errorMessage} </p>


      <g:textField name="name" placeholder="enter user name" required="yes" id="name" ></g:textField></br>
       <g:passwordField  name="password" placeholder="enter password" required="yes"></g:passwordField>
       <g:checkBox name="keepMeLogin" value="${true}"></g:checkBox>Keep me signed in
       <g:submitButton value="Submit" class="button_" name="submit"></g:submitButton>
     <g:link action="forgotPassword">Forgot password?</g:link></br>
       or</br>
   </g:form>
    <g:link name="registration"  action="create" controller="newUser">
   <input type="button" class="button_" value="Create New User" name="registration" formaction="dghfvhdj"/>
    </g:link>

   %{-- <g:actionSubmit value="Create New User" class="button_" action="${g.link(controller: 'users',action: 'registration')}"></g:actionSubmit>--}%
</center>
</div>
<p>hello</p>
</body>
</html>