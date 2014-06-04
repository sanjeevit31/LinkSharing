<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 4/6/14
  Time: 1:46 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="linksharing"> </meta>
    <title>Login</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css' ,file: 'formlogin.css')}" type="text/css">



</head>

<body><h4>Your Password Reset email was sent-check your mail!!!</h4>

<br>
<br>
For Login Click <g:link controller="newUser" action="login">Here</g:link>
</body>
</html>