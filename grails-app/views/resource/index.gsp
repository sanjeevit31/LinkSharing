
<%@ page import="com.linksharing.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		%{--<meta name="layout" content="main">--}%
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-resource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-resource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="heading" title="${message(code: 'resource.heading.label', default: 'Heading')}" />
					
						<th><g:message code="resource.new.label" default="New" /></th>
					
						<th><g:message code="resource.topic.label" default="Topic" /></th>
					
						<g:sortableColumn property="type" title="${message(code: 'resource.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="url_path" title="${message(code: 'resource.url_path.label', default: 'Urlpath')}" />
					
					</tr>
				</thead>
				<tbody class="odd">
				<g:each in="${resourceInstanceList}" status="i" var="resourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${resourceInstance.id}">${fieldValue(bean: resourceInstance, field: "heading")}</g:link></td>
					
						<td>${fieldValue(bean: resourceInstance, field: "new")}</td>
					
						<td>${fieldValue(bean: resourceInstance, field: "topic")}</td>
					
						<td>${fieldValue(bean: resourceInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: resourceInstance, field: "url_path")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${resourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
