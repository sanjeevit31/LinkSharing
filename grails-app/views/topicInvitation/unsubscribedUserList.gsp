<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 6/6/14
  Time: 3:51 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:if test="${userList}">
    <g:select name="invitedTo" from="${userList}"></g:select>
</g:if>
<g:else>
    <g:select name="invitedTo" from="${['Select User']}"></g:select>
</g:else>

</body>
</html>