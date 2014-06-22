<%@ page import="com.linksharing.Subscribed" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="sideMenu">
    <g:set var="entityName" value="${message(code: 'subscribed.label', default: 'Subscribed')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-subscribed" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/user/dashBord')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
<div id="list-subscribed" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="interestLevel"
                              title="${message(code: 'subscribed.interestLevel.label', default: 'Interest Level')}"/>

            <g:sortableColumn property="createdDate"
                              title="${message(code: 'subscribed.createdDate.label', default: 'Created Date')}"/>

            <th><g:message code="subscribed.user.label" default="New Users"/></th>

            <th><g:message code="subscribed.topic.label" default="Topic"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${subscribedInstanceList}" status="i" var="subscribedInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${subscribedInstance.id}">${fieldValue(bean: subscribedInstance, field: "interestLevel")}</g:link></td>

                <td><g:formatDate date="${subscribedInstance.createdDate}"/></td>

                <td>${fieldValue(bean: subscribedInstance, field: "user")}</td>

                <td>${fieldValue(bean: subscribedInstance, field: "topic")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${subscribedInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
