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
    #header {background-color:#abbf78;text-align:left;border-bottom-width: 10px;border-bottom-color: red;
    }
    #footer {background-color:#e0e0ff;text-align: center;}

    </style>
    <g:javascript library="jquery"></g:javascript>
    <g:layoutHead/>
</head>

<body onload="dateTime_()">
<div id="header" >
    <img src="${resource(dir:'images/linkimg',file:'lnkshr.gif')}" width="250px" height="90px">
</div>
<div style="background: #abbf78;height: 70px;width: 110px; position: absolute;right:200px;top: 10px">
    <ls:date format="dd/MM/YYYY" value="${new Date()}"></ls:date>
    </br></br>
    <span id="time_"></span>
</div>

<g:layoutBody/>

<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />
</body>
</html>