<%@ page import="linksharing.Sample" %>



<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="sample.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${sampleInstance?.name}"/>

</div>

