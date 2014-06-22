<%@ page import="com.linksharing.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="topic.name.label" default="Topic Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${topicInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'summery', 'error')} required">
    <label for="summery">
        <g:message code="topic.summery.label" default="Summery"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="summery" cols="40" rows="5" maxlength="1024" required="" value="${topicInstance?.summery}"/>

</div>


<g:hiddenField name="user.id" id="user" optionKey="id" value="${params.userId}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'visibility', 'error')} required">
    <label for="visibility">
        <g:message code="topic.visibility.label" default="Visibility"/>
        <span class="required-indicator">*</span>
    </label>

    public<g:radio name="visibility" value="public" checked="checked"></g:radio>
    private<g:radio name="visibility" value="private"></g:radio>

</div>

