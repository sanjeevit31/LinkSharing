<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 11/5/14
  Time: 10:16 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout"
          content="linksharing"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>

<body>
Last Name: <g:fieldValue bean="${person}" field="lastName"/><br/>
First Name: <g:fieldValue bean="${person}" field="firstName"/><br/>
Age:         <g:fieldValue bean="${person}"         field="age"/><br/>
</body>
</html>