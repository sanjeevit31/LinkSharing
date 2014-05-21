<%@ page import="com.linksharing.Resource" %>



<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="resource.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${resourceInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'new', 'error')} required">
	<label for="new">
		<g:message code="resource.new.label" default="New" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="new" name="new.id" from="${com.linksharing.NewUser.list()}" optionKey="id" required="" value="${resourceInstance?.new?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="resource.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${com.linksharing.Topic.list()}" optionKey="id" required="" value="${resourceInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="resource.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${resourceInstance?.type}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="resource.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${resourceInstance?.url}"/>

</div>

