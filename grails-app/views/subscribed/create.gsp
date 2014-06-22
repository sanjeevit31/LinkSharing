<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="sideMenu">
    <g:set var="entityName" value="${message(code: 'subscribed.label', default: 'Subscribed')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-subscribed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="create-subscribed" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${subscribedInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${subscribedInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: subscribedInstance, action: 'save']">
        <fieldset class="form">
            <g:render template="form"/>
            ${params.topicid = topicid}
            <center><g:submitButton name="create" class="save" value='Subscribe'/></center>
        </fieldset>
    </g:form>
</div>
</body>
</html>
