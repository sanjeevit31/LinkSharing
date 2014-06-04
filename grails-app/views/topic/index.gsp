
<%@ page import="com.linksharing.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="userDashBord">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css' ,file: 'formlogin.css')}">
	</head>
	<body>
    <script>
        $(document).ready(function(){
                    $('tr').click(function(){
alert()
                        $(this).after('<tr>hello</tr>')
                    })
                } );


    </script>
		<a href="#list-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">--}%
			%{--<ul>--}%
                %{--<li>${session.name}</li>--}%
				%{--<li><a class="home" href="${createLink(uri: '/newUser/dashBord')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			%{--</ul>--}%
		%{--</div>--}%
		<div id="list-topic" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'topic.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="summery" title="${message(code: 'topic.summery.label', default: 'Summery')}" />

					
						<g:sortableColumn property="dateCreated" title="${message(code: 'topic.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'topic.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="topic.newUsers.label" default="New Users" /></th>
					
						<g:sortableColumn property="visibility" title="${message(code: 'topic.visibility.label', default: 'Visibility')}" />
                        <th><g:message code="topic.newUsers.label" default="Resources" /></th>



					</tr>
				</thead>
				<tbody>
				<g:each in="${topic}" status="i" var="topicInstance">

					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "name")}</g:link></td>
					
						%{--<td>${fieldValue(bean: topicInstance, field: "summery")}</td>--}%
                        <td><g:textArea name="semmery" value="${topicInstance.summery}" style="width:160px;height: 50px" readonly=""/></td>
					
						<td><g:formatDate date="${topicInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${topicInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: topicInstance, field: "newUsers")}</td>
					
						<td>${fieldValue(bean: topicInstance, field: "visibility")}</td>
                        <td><input type="button" value="click" name="resource" id="resource"></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>


			<div class="pagination">
				<g:paginate total="${topicInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
