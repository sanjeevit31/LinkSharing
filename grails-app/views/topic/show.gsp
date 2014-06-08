
<%@ page import="com.linksharing.Topic" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="userDashBord">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css' ,file: 'formlogin.css')}">
	</head>
	<body>
    <script>
        $(document).ready(function(){
            $('#resource').click(function(){
                if($('#plusMinus').text()=='+'){
                    $('#plusMinus').html('-')
                    $('#seeResources').show()
                }
                else{
                    $('#plusMinus').html('+')
                    $('#seeResources').hide()
                }
            })

            $('#plusMinus').click(function(){
                if($('#plusMinus').text()=='+'){
                    $('#plusMinus').html('-')
                    $('#seeResources').show()
                }
                else{
                    $('#plusMinus').html('+')
                    $('#seeResources').hide()
                }

            })
        })
    </script>
		<a href="#show-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">
			<ul>
                <li>${session.name}</li>
				<li><a class="home" href="${createLink(uri: '/newUser/dashBord')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link controller="subscribed" action="index">Subscribed List</g:link></li>

			</ul>
		</div>--}%
		<div id="show-topic" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topic">
			
				<g:if test="${topicInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="topic.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${topicInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.summery}">
				<li class="fieldcontain">
					<span id="summery-label" class="property-label"><g:message code="topic.summery.label" default="Summery" /></span>
					
						<span class="property-value" aria-labelledby="summery-label"><g:fieldValue bean="${topicInstance}" field="summery"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="topic.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${topicInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="topic.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${topicInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.newUsers}">
				<li class="fieldcontain">
					<span id="newUsers-label" class="property-label"><g:message code="topic.newUsers.label" default="New Users" /></span>
					
						<span class="property-value" aria-labelledby="newUsers-label">
                            <g:if test="${flag}">
                            <g:link controller="newUser" action="show" id="${topicInstance?.newUsers?.id}">
                                ${topicInstance?.newUsers?.encodeAsHTML()}
                            </g:link>
                            </g:if>
                            <g:else>
                                ${topicInstance?.newUsers?.encodeAsHTML()}
                            </g:else>
                        </span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.subscribers}">
				<li class="fieldcontain">
					<span id="subscribers-label" class="property-label">%{--<g:message code="topic.subscribers.label" default="Subscribers" />--}%</span>
					
						%{--<g:each in="${topicInstance.subscribers}" var="s">
						<span class="property-value" aria-labelledby="subscribers-label"><g:link  controller="subscribed" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>--}%
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.visibility}">
				<li class="fieldcontain">
					<span id="visibility-label" class="property-label"><g:message code="topic.visibility.label" default="Visibility" /></span>
					
						<span class="property-value" aria-labelledby="visibility-label"><g:fieldValue bean="${topicInstance}" field="visibility"/></span>
					
				</li>
				</g:if>


			</ol>
            <center>
            <span id="visibility1-label" class="property-label">
           <g:remoteLink  controller="resource" action="topicsResource" params="${['topicid':topicInstance.id]}" update="seeResources">
              <b style="color: #cc0000"> <span id="plusMinus" >+</span></b>
               <span id="resource" >Click Here To See Resource</span>
           </g:remoteLink>
        </span>
            </center>
            <div id="seeResources"></div>

			<g:form url="[resource:topicInstance, action:'delete']" method="DELETE">
				<fieldset class="${TopicDeleteEditFlag}">
					<g:link class="edit" action="edit" resource="${topicInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:if test="${topicSubscribeFlag}">

                        <g:link controller="subscribed" action="create" params="[topicid:topicInstance.id]"><input type='button' name="Subscribe" value="Subscribe"/></g:link>
                    </g:if>
                    <g:else>
                        <g:link controller="resource" action="create" params="[topicid:topicInstance.id]">Add Resource</g:link>
                    </g:else>
				</fieldset>
                <fieldset class="buttons">

                   <g:if test="${TopicDeleteEditFlag!='buttons'}">
                       <g:if test="${topicSubscribeFlag}">

                           <g:link controller="subscribed" action="create" params="[topicid:topicInstance.id]"><input type='button' name="Subscribe" value="Subscribe"/></g:link>
                       </g:if>
                       <g:else>
                           <g:link controller="resource" action="create" params="[topicid:topicInstance.id]">Add Resource</g:link>
                       </g:else>
                   </g:if>

                </fieldset>
			</g:form>
		</div>
	</body>
</html>
