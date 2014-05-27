<%@ page import="com.linksharing.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="topic.name.label" default="Topic Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${topicInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'summery', 'error')} required">
	<label for="summery">
		<g:message code="topic.summery.label" default="Summery" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="summery" cols="40" rows="5" maxlength="1024" required="" value="${topicInstance?.summery}"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'newUsers', 'error')} required">
	<label for="newUsers">
		<g:message code="topic.newUsers.label" default="New Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="newUsers" name="newUsers.id" from="${com.linksharing.NewUser.list()}" optionKey="id" required="" value="${topicInstance?.newUsers?.id}" class="many-to-one"/>--}%
<g:hiddenField name="newUsers.id" id="newUsers" optionKey="id" class="many-to-one" value="${session.user.id}"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'subscribers', 'error')} ">
	<label for="subscribers">
		<g:message code="topic.subscribers.label" default="Subscribers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${topicInstance?.subscribers?}" var="s">
    <li><g:link controller="subscribed" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subscribed" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subscribed.label', default: 'Subscribed')])}</g:link>
</li>
</ul>


</div>--}%

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'visibility', 'error')} required">
	<label for="visibility">
		<g:message code="topic.visibility.label" default="Visibility" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:textField name="visibility" required="" value="${topicInstance?.visibility}"/>--}%
    <g:select name="visibility" from="${['public','private']}" required="" />

</div>

