<%@ page import="com.linksharing.Subscribed" %>



<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'interestLevel', 'error')} ">
	<label for="interestLevel">
		<g:message code="subscribed.interestLevel.label" default="Interest Level" />
		
	</label>
	<g:textField name="interestLevel" value="${subscribedInstance?.interestLevel}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="subscribed.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${subscribedInstance?.createdDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'newUsers', 'error')} required">
	<label for="newUsers">
		<g:message code="subscribed.newUsers.label" default="New Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="newUsers" name="newUsers.id" from="${com.linksharing.NewUser.list()}" optionKey="id" required="" value="${subscribedInstance?.newUsers?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="subscribed.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${com.linksharing.Topic.list()}" optionKey="id" required="" value="${subscribedInstance?.topic?.id}" class="many-to-one"/>

</div>

