<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 18/6/14
  Time: 9:45 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="sideMenu"> </meta>
    <title>Login</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'topicDetails.css')}">
    <style>
    hr {
        margin-left: 20px;
    }
    </style>
</head>

<body>
<div style="width: 500px;margin-left: 100px;margin-top: 30px;margin-bottom: 30px;border: solid silver">

    <div class='topicTitle'>
        ${topicTitle}
    </div>

    <div style="font-size: small;margin-left: 20px">
        <ls:timeFormat date="${topicCreatedDate}">
        </ls:timeFormat>
    </div>

    <hr align="center" width="400px"/>

    <div style="background-color: rgba(76, 38, 38, 0.03);margin: 10px;">
        ${topicSummery}
    </div>

</div>
</body>
</html>