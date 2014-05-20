
<%@ page import="com.linksharing.NewUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newUser.label', default: 'NewUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newUser">
			
				<g:if test="${newUserInstance?.fname}">
				<li class="fieldcontain">
					<span id="fname-label" class="property-label"><g:message code="newUser.fname.label" default="Fname" /></span>
					
						<span class="property-value" aria-labelledby="fname-label"><g:fieldValue bean="${newUserInstance}" field="fname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newUserInstance?.lname}">
				<li class="fieldcontain">
					<span id="lname-label" class="property-label"><g:message code="newUser.lname.label" default="Lname" /></span>
					
						<span class="property-value" aria-labelledby="lname-label"><g:fieldValue bean="${newUserInstance}" field="lname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newUserInstance?.emailid}">
				<li class="fieldcontain">
					<span id="emailid-label" class="property-label"><g:message code="newUser.emailid.label" default="Emailid" /></span>
					
						<span class="property-value" aria-labelledby="emailid-label"><g:fieldValue bean="${newUserInstance}" field="emailid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newUserInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="newUser.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${newUserInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newUserInstance?.mob}">
				<li class="fieldcontain">
					<span id="mob-label" class="property-label"><g:message code="newUser.mob.label" default="Mob" /></span>
					
						<span class="property-value" aria-labelledby="mob-label"><g:fieldValue bean="${newUserInstance}" field="mob"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newUserInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="newUser.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${newUserInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newUserInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="newUser.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${newUserInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newUserInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="newUser.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${newUserInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
