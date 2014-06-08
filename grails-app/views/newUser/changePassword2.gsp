<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 8/6/14
  Time: 11:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="userDashBord"> </meta>
    <title>Login</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css' ,file: 'formlogin.css')}">
</head>

<body>
${status}
<g:if test="${status=='success'}">
    Password Changed Successfully.................
</g:if>
<g:else>
    Password Not Changed Due to Some Error Try <g:link controller="newUser" action="changePassword1">Again</g:link>
</g:else>
</body>
</html>