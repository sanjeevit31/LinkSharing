<%@ page import="com.linksharing.Subscribed" %>


   <center><p style="color: red"> ${params.'errMsg'}</p></center>
${params.remove(errMsg)}

<%println request.getAttribute('errMsg')
    %>
<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'interestLevel', 'error')} ">
	<label for="interestLevel">
		<g:message code="subscribed.interestLevel.label" default="Interest Level" />
		
	</label>
	%{--<g:textField name="interestLevel" value="${subscribedInstance?.interestLevel}"/>--}%
    <g:select name="interestLevel" from="${['passive','active','very active']}" />

</div>

<div class="fieldcontainHide ${hasErrors(bean: subscribedInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="subscribed.createdDate.label" default="Subscription Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day" value="${subscribedInstance?.createdDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'newUsers', 'error')} required">
	%{--<label for="newUsers">
		<g:message code="subscribed.newUsers.label" default="New Users" />
		<span class="required-indicator">*</span>
	</label>--}%
	%{--<g:textField id="newUsers" name="newUsers.id" from="${com.linksharing.NewUser.findById(sessio.id)}" optionKey="id" required="" value="${subscribedInstance?.newUsers?.id}" class="many-to-one"/>--}%
<g:hiddenField name="newUsers" id="newUsers.id" value="${session.getAttribute('userid')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="subscribed.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label >

<%if(params.action.equals('edit'))
{
    %>
	<g:textField  name="topic.id"  value="${com.linksharing.Topic.findById(subscribedInstance.topicId)}" readonly=""/>
<%}
else
{%>
<g:textField  name="topic.id1" id="topic1" value="${com.linksharing.Topic.findById(params['topicid']).name}" readonly=""/>
<%}%>
<g:hiddenField name="topic.id" id="topic" value="${params['topicid']}"/>
</div>

