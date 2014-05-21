<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 11/5/14
  Time: 3:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Hello
        <g:layoutTitle default="Grails"/></title>
    <style>
    #header {background-color:#ffe0e0;text-align:center;}
    #footer {background-color:#e0e0ff;text-align: center;}

    </style>
    <g:javascript library="jquery"></g:javascript>
    <g:layoutHead/>
</head>

<body>
<div id="header">HEADER
<img src="${resource(dir:'images',file:'san.jpg')}" width="100px" height="60px"></div>
<g:layoutBody/>
<div id="footer">FOOTER</div>
</body>
</html>