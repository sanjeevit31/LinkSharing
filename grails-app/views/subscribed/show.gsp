
<%@ page import="com.linksharing.Subscribed" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="userDashBord">
		<g:set var="entityName" value="${message(code: 'subscribed.label', default: 'Subscribed')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subscribed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/newUser/dashBord')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				--}%%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%%{--
			</ul>
		</div>--}%
		<div id="show-subscribed" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subscribed">
			
				<g:if test="${subscribedInstance?.interestLevel}">
				<li class="fieldcontain">
					<span id="interestLevel-label" class="property-label"><g:message code="subscribed.interestLevel.label" default="Interest Level" /></span>
					
						<span class="property-value" aria-labelledby="interestLevel-label"><g:fieldValue bean="${subscribedInstance}" field="interestLevel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribedInstance?.createdDate}">
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="subscribed.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${subscribedInstance?.createdDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribedInstance?.newUsers}">
				<li class="fieldcontain">
					<span id="newUsers-label" class="property-label"><g:message code="subscribed.newUsers.label" default="New Users" /></span>
					
						<span class="property-value" aria-labelledby="newUsers-label"><g:link controller="newUser" action="show" id="${subscribedInstance?.newUsers?.id}">${subscribedInstance?.newUsers?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subscribedInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="subscribed.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" params="topicid=${subscribedInstance.topic.id}" id="${subscribedInstance?.topic?.id}">${subscribedInstance?.topic?.encodeAsHTML()}</g:link></span>
					<g:link controller="newUser" action="resetPaswordChange" params="key=key"></g:link>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:subscribedInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${subscribedInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Unsubscribe')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
                    <g:actionSubmit class="delete" action="delete" value="Unsubscribe" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
