<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 20/5/14
  Time: 10:39 AM
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
    <center>
        <g:message message="Registration Successful........"></g:message>
        <br>
        <g:link controller="newUser" action="login">Click here to Login</g:link>
    </center>
</body>
</html>