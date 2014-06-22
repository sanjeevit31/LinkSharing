<%@ page import="com.linksharing.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="sideMenu">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
<div id="show-user" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list user">

        <g:if test="${userInstance?.firstName}">
            <li class="fieldcontain">
                <span id="firstName-label" class="property-label"><g:message code="user.firstName.label"
                                                                             default="Fname"/></span>

                <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}"
                                                                                             field="firstName"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.lname}">
            <li class="fieldcontain">
                <span id="firstName-label" class="property-label"><g:message code="user.firstName.label"
                                                                             default="Lname"/></span>

                <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}"
                                                                                             field="firstName"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.emailId}">
            <li class="fieldcontain">
                <span id="emailId-label" class="property-label"><g:message code="user.emailId.label"
                                                                           default="Emailid"/></span>

                <span class="property-value" aria-labelledby="emailId-label"><g:fieldValue bean="${userInstance}"
                                                                                           field="emailId"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.password}">
            <li class="fieldcontain">
                <span id="password-label" class="property-label"><g:message code="user.password.label"
                                                                            default="Password"/></span>

                <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}"
                                                                                            field="password"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.mobile}">
            <li class="fieldcontain">
                <span id="mobile-label" class="property-label"><g:message code="user.mobile.label"
                                                                          default="Mob"/></span>

                <span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${userInstance}"
                                                                                          field="mobile"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.country}">
            <li class="fieldcontain">
                <span id="country-label" class="property-label"><g:message code="user.country.label"
                                                                           default="Country"/></span>

                <span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${userInstance}"
                                                                                           field="country"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.gender}">
            <li class="fieldcontain">
                <span id="gender-label" class="property-label"><g:message code="user.gender.label"
                                                                          default="Gender"/></span>

                <span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${userInstance}"
                                                                                          field="gender"/></span>

            </li>
        </g:if>

        <g:if test="${userInstance?.state}">
            <li class="fieldcontain">
                <span id="state-label" class="property-label"><g:message code="user.state.label"
                                                                         default="State"/></span>

                <span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${userInstance}"
                                                                                         field="state"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: userInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
