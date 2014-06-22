<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 21/5/14
  Time: 10:44 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="test"> </meta>
    <title>Login</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'dashboard.css')}"/>
</head>

<body>
<div style="margin-left: 10px;width: 400px" id="leftPanel">
    <b>Hot Topics</b><br>
    <g:each in="${hotTopics}" var="topicInstance" status="status">
        <div class='topics'>
            ${status + 1}. ${topicInstance.name}
            <span class="plus">+</span>

            <div class='summeryDiv' style="display:none; padding-top: 10px; font-size: small" id="summery${status}">
                <b>Summery</b>:<br>
                <ls:topicSummery topic="${topicInstance}"></ls:topicSummery>
                <br><br>
                <center>
                <g:link controller="subscribed" action="create" params="${[topicId:topicInstance.id]}">
                    Click To Subscribe
                </g:link>
                </center>

            </div>
        </div>

    </g:each>
    <div class="pagination">
        <g:paginate controller="user" action="dashBoard" total="${hotTopicCount}" max="5"/>
    </div>
</div>

<div style="width: 400px;left: 700px;top:90px;position: absolute" id="rightPanel">
    <b>Popular Authors</b><br>

    <g:each in="${popularAuthors}" var="userInstance" status="status">
        <g:set var="index" value="${status + 1}"/>
        <div class="topics" data-id="${userInstance.id}">
            ${index}
            <ls:userFullName user="${userInstance}"/>
            <span class="plus">+</span>

            <div style="display: none;font-size: small" class="recentTopicDiv">

            </div>
        </div>
    </g:each>

</div>

</body>
</html>