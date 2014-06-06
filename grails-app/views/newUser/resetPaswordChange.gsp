<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 5/6/14
  Time: 12:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:form controller="newUser" action="passwordChange">
    <table style="background: #CCCCCC)">
        <tr>
            <td>Enter New Password</td>
            <td><g:passwordField name="password" id="password"/></td>
        </tr>

        <tr>
            <td>Confirm Password</td>
            <td><g:passwordField name="confirm" id="password"/></td>
        </tr>

        <tr>
            <td><g:hiddenField name="key" value="${key}"/><g:hiddenField name="emailid" value="${emailid}"/></td>
            <td><g:submitButton name="submit" value="submit"></g:submitButton></td>
        </tr>
    </table>

</g:form>
</body>
</html>