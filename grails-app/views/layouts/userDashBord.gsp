<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 21/5/14
  Time: 10:38 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <g:javascript src="linksharing_basic.js"></g:javascript>
    <g:javascript library="jquery"></g:javascript>
    %{--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--}%

    <title>Link Sharing
    <g:layoutTitle default="Grails"/>
    </title>


    <link rel="stylesheet" href="${resource(dir: 'css', file: 'minu.css')}" type="text/css">
    <g:layoutHead/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}">
    <r:layoutResources/>
</head>

<body onload="dateTime_()">

<div id="header">
    <g:link controller="user" action="dashBoard">
        <img src="${resource(dir: 'images/linkimg', file: 'lnkshr.gif')}" width="250px" height="90px">
    </g:link>
</div>

<div style="background: #abbf78;height: 50px;width: 110px; position: absolute;right:200px;top: 10px">
    <ls:date format="dd/MM/YYYY" value="${new Date()}"></ls:date> </br></br>

    <span id="time_"></span>
</div>

<div id="minu">

    <nav>
        <ul>
            <li><g:link controller="user" action="dashBord">HOME</g:link></li>


            <li><a href="#">TOPIC</a>
                <ul>
                    <li><g:link controller="topic" action="create">NEW TOPIC</g:link></li>
                    <li><g:link controller="topic" action="index">TOPIC LIST</g:link></li>
                    <li><g:link controller="resource" action="create">ADD RESOURCE</g:link></li>
                    <li><a href="#">SUB MENU</a>
                        <ul>
                            <li><a href="#">HTML</a></li>
                            <li><a href="#">CSS</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><g:link controller="subscribed" action="index">SUBSCRIBED TOPICS</g:link>
                <ul>
                    <li><g:link controller="topicInvitation" action="invites">SEND INIVITATION</g:link></li>
                    <li><a href="#">User Experience</a></li>
                </ul>
            </li>
            <li><a href="#">WELCOME:${name}</a>
                <ul>
                    <li><g:link controller="user" action="edit">Edit Profile</g:link></li>
                    <li><g:link controller="user" action="changePassword1">change Password</g:link></li>
                    <li><g:link controller="logout" action="index">LOGOUT</g:link></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
<r:layoutResources/>
<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources/>
</body>
</html>