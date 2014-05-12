<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 9/5/14
  Time: 3:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<g:link onccontroller="sample" action="${}"></g:link>
<g:createLink controller="" action="${}"></g:createLink>
<img src="${resource(dir:'images/skin',file:'xyz.jpeg' )}">
<img src="image/">

<a href="${createLink(controller: 'sample')}"
</body>
</html>