<%@ page import="linksharing.FileUpload" %>



<div class="fieldcontain ${hasErrors(bean: fileUploadInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="fileUpload.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${fileUploadInstance?.name}"/>

</div>

