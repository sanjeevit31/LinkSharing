
<%@ page import="com.linksharing.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="userDashBord">
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-resource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
		<div id="show-resource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list resource">
			
				<g:if test="${resourceInstance?.heading}">
				<li class="fieldcontain">
					<span id="heading-label" class="property-label"><g:message code="resource.heading.label" default="Heading" /></span>
					
						<span class="property-value" aria-labelledby="heading-label"><g:fieldValue bean="${resourceInstance}" field="heading"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.new}">
				<li class="fieldcontain">
					<span id="new-label" class="property-label"><g:message code="resource.new.label" default="New" /></span>
					
						<span class="property-value" aria-labelledby="new-label"><g:link controller="newUser" action="show" id="${resourceInstance?.new?.id}">${resourceInstance?.new?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="resource.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${resourceInstance?.topic?.id}">${resourceInstance?.topic?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="resource.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${resourceInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.url_path}">
				<li class="fieldcontain">
					<span id="url_path-label" class="property-label"><g:message code="resource.url_path.label" default="Urlpath" /></span>
					
						<span class="property-value" aria-labelledby="url_path-label"><g:fieldValue bean="${resourceInstance}" field="url_path"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:resourceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${resourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
