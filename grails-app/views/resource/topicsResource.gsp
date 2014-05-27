<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 27/5/14
  Time: 3:53 PM
--%>

<%@ page import="com.linksharing.Resource" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>


<table>
    <thead>
    <tr>

        <g:sortableColumn property="heading" title="${message(code: 'resource.heading.label', default: 'Heading')}" />
        <th></th>
        <th><g:message code="resource.new.label" default="User" /></th>



        <g:sortableColumn property="type" title="${message(code: 'resource.type.label', default: 'Type')}" />

        <g:sortableColumn property="url_path" title="${message(code: 'resource.url_path.label', default: 'Content')}" />

    </tr>
    </thead>
    <tbody >
    <g:each in="${params.resourceList}" status="i" var="resourceInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${resourceInstance.heading}</td>
            <td style="font-size: 10px">new</td>
            <td>${resourceInstance.new}</td>



            <td>${resourceInstance.type}</td>
            <g:if test="${resourceInstance.type=='Link'}">
            <td>
                <g:link url="${resourceInstance.url_path}">Click To See Link</g:link>
            </td>
            </g:if>
            <g:else>
                <td><g:remoteLink controller="resource" action="download" params="['path':resourceInstance.url_path]">DownLoad</g:remoteLink>
                </td>
            </g:else>

        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>