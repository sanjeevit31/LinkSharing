<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 27/5/14
  Time: 11:00 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %></page>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Simple Ajax</title>
    <g:javascript library="jquery"/>
</head>

<body>
<ul id="menu">
    <li>
        <g:remoteLink action="ajaxRandom1" update="quote">
            Next Quote
        </g:remoteLink><br>
        <g:remoteLink url="['status':true]" action="ajaxDemo" update="quote">
            Next auta${status}
        </g:remoteLink>

    </li>
    <li>
        <g:link action="list">
            Admin
        </g:link>
    </li>
</ul>

<div id="quote"></div>
</body>
</html>