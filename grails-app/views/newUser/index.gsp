
<%@ page import="com.linksharing.NewUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="userDashBord">
		<g:set var="entityName" value="${message(code: 'newUser.label', default: 'NewUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">--}%
			%{--<ul>--}%
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			%{--</ul>--}%
		%{--</div>--}%
		<div id="list-newUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fname" title="${message(code: 'newUser.fname.label', default: 'Fname')}" />
					
						<g:sortableColumn property="lname" title="${message(code: 'newUser.lname.label', default: 'Lname')}" />
					
						<g:sortableColumn property="emailid" title="${message(code: 'newUser.emailid.label', default: 'Emailid')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'newUser.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="mob" title="${message(code: 'newUser.mob.label', default: 'Mob')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'newUser.country.label', default: 'Country')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newUserInstanceList}" status="i" var="newUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newUserInstance.id}">${fieldValue(bean: newUserInstance, field: "fname")}</g:link></td>
					
						<td>${fieldValue(bean: newUserInstance, field: "lname")}</td>
					
						<td>${fieldValue(bean: newUserInstance, field: "emailid")}</td>
					
						<td>${fieldValue(bean: newUserInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: newUserInstance, field: "mob")}</td>
					
						<td>${fieldValue(bean: newUserInstance, field: "country")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
