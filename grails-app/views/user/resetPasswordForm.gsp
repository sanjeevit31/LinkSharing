<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 4/6/14
  Time: 1:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="linksharing"> </meta>
    <title>Login</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}" type="text/css">

</head>

<body>
<g:form controller="user" action="resetPassword">

    <table>
        <tr>
            <td>My LinkSharing Email Id:</td>
            <td><g:textField name="emailId" required=""></g:textField></td>
        </tr>
        <tr>
            <td></td>
            <td><g:submitButton name="submit" value="Reset My Password"></g:submitButton></td>
        </tr>

    </table>

</g:form>
</body>
</html>