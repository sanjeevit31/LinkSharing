<%@ page import="com.linksharing.Resource" %>



<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'heading', 'error')} required">
	<label for="heading">
		<g:message code="resource.heading.label" default="Heading" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="heading" required="" value="${resourceInstance?.heading}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'new', 'error')} required">
	<label for="new">
		<g:message code="resource.new.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="new1" name="new.id1" value="${session.user}" readonly=""/>
    <g:hiddenField id="new" name="new.id" value="${session.user.id}" readonly=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="resource.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${com.linksharing.Topic.list()}" optionKey="id" required="" value="${resourceInstance?.topic?.id}" class="many-to-one"/>
    %{--<g:textField id="topic1"  readonly="" name="topic.id1"   value="${params.topicName}" />--}%
    %{--<g:hiddenField name="topic.id" id="topic" value="${params.topicid}"/>--}%


</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="resource.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:textField name="type" required="" value="${resourceInstance?.type}"/>--}%
    <g:select name="type" id ="type" from="${['Link','Document']}" onblur="resourceType()" onchange="resourceType()"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'url_path', 'error')} required">
	<label for="url_path">
		%{--<g:message code="resource.url_path.label" default="Urlpath" />--}%
        <span id="resourceTypeLabel">URL</span>
		<span class="required-indicator">*</span>
	</label>
    <span id="resourceType">
        <g:textField name="url_path" required="" value="${resourceInstance?.url_path}"/>
    </span>

   %{-- <div id="resourceType">

    </div>
    <div id="resourceType">
        <g:textField name="url_path" id='url_path' required="" value="${resourceInstance?.url_path}"/>
    </div>--}%

</div>

