<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 8/6/14
  Time: 10:38 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="sideMenu"> </meta>
    <meta name="layout" content="sideMenu"> </meta>
    <title>Login</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}">
</head>

<body>
<g:form controller="user" action="changeUserPassword">
    <table style="background: #CCCCCC);width: 420px;border: solid rgba(46, 23, 23, 0.33) ;margin-left: 40px">
        <tr>
            <td>Old Password:</td>
            <td><g:passwordField name="oldPassword" required=""></g:passwordField></td>
        </tr>
        <tr>
            <td>New Password:</td>
            <td><g:passwordField name="newPassword" required=""></g:passwordField></td>
        </tr>
        <tr>
            <td>Confirm Password:</td>
            <td><g:passwordField name="confirmPassword" required=""></g:passwordField></td>
        </tr>
        <tr>
            <td></td>
            <td><g:submitButton name="submit" value="submit"></g:submitButton></td>
        </tr>
    </table>

</g:form>

</body>
</html>