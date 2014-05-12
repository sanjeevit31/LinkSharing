<%@ page import="linksharing.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="topic.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${topicInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="topic.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${topicInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="topic.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${topicInstance?.name}"/>

</div>

