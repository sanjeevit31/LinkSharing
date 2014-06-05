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
<g:form controller="newUser" action="">
Enter New Password<g:passwordField name="password" id="password"/>
Confirm Password<g:passwordField name="confirm" id="password"/>
<g:submitButton name="submit" value="submit"></g:submitButton>
</g:form>
</body>
</html>