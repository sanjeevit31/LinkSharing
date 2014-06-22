<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 11/5/14
  Time: 3:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:javascript src="linksharing_basic.js"></g:javascript>
    <title>Link Sharing
        <g:layoutTitle default="Grails"/></title>
    <style>
    #header {
        background-color: #abbf78;
        text-align: left;
        border-bottom-width: 10px;
        border-bottom-color: red;
    }

    #footer {
        background-color: #e0e0ff;
        text-align: center;
    }

    </style>
    <g:javascript library="jquery"></g:javascript>

    %{--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}">
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body onload="dateTime_()">
<div id="header">
    <g:link controller="user" action="dashBoard">
        <img src="${resource(dir: 'images/linkimg', file: 'lnkshr.gif')}" width="250px" height="90px">
    </g:link>

</div>

<div style="background: #abbf78;height: 70px;width: 110px; position: absolute;right:200px;top: 10px">
    <ls:date format="dd/MM/YYYY" value="${new Date()}"></ls:date>
</br></br>
    <span id="time_"></span>
</div>
<r:layoutResources/>

<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>