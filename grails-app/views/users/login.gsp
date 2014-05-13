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


</head>

<body >
<ls:date format="MM-dd-yyyy" value="${new Date()}"></ls:date>

%{--
</g:form>
<div id="formdiv">

   <g:form controller="users" action="index" method="POST" id="loginform" name="loginform" contenteditable="false" autocomplete="on" draggable="true" >
      <g:textField name="name" id="name" draggable="" placeholder="enter user name"></g:textField>
       <g:passwordField  name="pass" id="pass" placeholder="enter password"></g:passwordField>
       --
</div>
--}%
</body>
</html>