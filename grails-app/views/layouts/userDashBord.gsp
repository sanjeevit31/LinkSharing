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

    <title>Link Sharing
        <g:layoutTitle default="Grails"/>
    </title>


    <link rel="stylesheet" href="${resource(dir: 'css', file: 'minu.css')}" type="text/css">
    <g:layoutHead/>
</head>

<body onload="dateTime_()">

    <div id="header" >
         <img src="${resource(dir:'images/linkimg',file:'lnkshr.gif')}" width="250px" height="90px">
    </div>
    <div style="background: #abbf78;height: 50px;width: 110px; position: absolute;right:200px;top: 10px">
         <ls:date format="dd/MM/YYYY" value="${new Date()}"></ls:date> </br></br>

             <span id="time_"></span>
    </div>
    <div id="minu">
        <b>
         <g:link controller="newUser" action="dashBord">
            Welcome: ${session.name}%{--${params['map']['name']}--}%
         </g:link>

        </b>|
        <g:link controller="newUser" action="dashBord">
            %{--<img src="${resource(dir: 'images/skin',file: 'house.png')}" width="30px" height="30px" style="padding-left:40px;padding-top: 4px"/>--}%
            Home
        </g:link>|
        <g:link controller="topic" action="create">
            <b>Topics</b>
        </g:link>|
        <g:link controller="newUser" action="logout">
            <b>Logout</b>
        </g:link>
       <%

           %>
    </div>

<g:layoutBody/>

<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />
</body>
</html>