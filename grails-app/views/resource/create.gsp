<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="sideMenu">
    <g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <g:javascript src="linksharing_basic.js"></g:javascript>

</head>

<body>
<a href="#create-resource" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
<div id="create-resource" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${resourceInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${resourceInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: resourceInstance, action: 'save']" enctype="multipart/form-data">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
