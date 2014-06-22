<%@ page import="com.linksharing.Subscribed" %>


<center>
    <p style="color: red">${params.'errMsg'}</p>
</center>
 ${params.remove(errMsg)}

<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'interestLevel', 'error')} ">
    <label for="interestLevel">
        <g:message code="subscribed.interestLevel.label" default="Interest Level"/>
    </label>

    <g:select name="interestLevel" from="${['passive', 'active', 'very active']}"/>

</div>

<div class="fieldcontainHide ${hasErrors(bean: subscribedInstance, field: 'createdDate', 'error')} required">
    <label for="createdDate">
        <g:message code="subscribed.createdDate.label" default="Subscription Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="createdDate" precision="day" value="${subscribedInstance?.createdDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'user', 'error')} required">
    <g:hiddenField name="user" id="user.id" value="${user.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subscribedInstance, field: 'topic', 'error')} required">
    <label for="topic">
        <g:message code="subscribed.topic.label" default="Topic"/>
        <span class="required-indicator">*</span>
    </label>

    <g:if test="${action=='edit'}">
        <g:textField name="topic.id" value="${topicInstance}" readonly=""/>
    </g:if>

    <g:else>
        <g:textField name="topic.id1" id="topic1" value="${topicInstance.name}"
                     readonly=""/>
    </g:else>
    <g:hiddenField name="topic.id" id="topic" value="${topicInstance.id}"/>
</div>

