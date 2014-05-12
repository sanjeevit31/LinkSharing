<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 11/5/14
  Time: 11:54 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
First Name:${person.firstName} </br>
Last Name:${person.lastName} </br>
Age:${person.age}



%{--each loop in gsp--}%
<g:each in="${(1..10)}" var="number">
    ${number}<br/>
</g:each>
</body>
</html>