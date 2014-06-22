<%@ page import="com.linksharing.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="user.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${userInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="user.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${userInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'emailId', 'error')} required">
    <label for="emailId">
        <g:message code="user.emailId.label" default="Email Id"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="emailId" required="" value="${userInstance?.emailId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="user.username.label" default="User Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="text" name="username" required="" value="${userInstance?.username}"/>

</div>
<g:if test="${!(params.action == 'edit')}">

    <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
        <label for="password">
            <g:message code="user.password.label" default="Password"/>
            <span class="required-indicator">*</span>
        </label>
        %{--<g:textField name="password" required="" value="${userInstance?.password}"/>--}%
        <g:passwordField name="password" required=""/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'confirmPassword', 'error')} required">
        <label for="confirmPassword">
            <g:message code="user.confirmPassword.label" default="Confirm Password"/>
            <span class="required-indicator">*</span>
        </label>
        %{--<g:textField name="password" required="" value="${userInstance?.password}"/>--}%
        <g:passwordField name="confirmPassword" required=""/>

    </div>
</g:if>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mobile', 'error')} required">
    <label for="mobile">
        <g:message code="user.mobile.label" default="Mobile No."/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="mobile" required="" value="${userInstance?.mobile}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} required">
    <label for="gender">
        <g:message code="user.gender.label" default="Gender"/>
        <span class="required-indicator">*</span>
    </label>
    %{--<g:textField name="gender" required="" value="${userInstance?.gender}"/>--}%
    <g:select name="gender" from="${['male', 'female']}" noSelection="${[0: '~~~~Select  Gender~~~~']}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="user.country.label" default="Country"/>
        <span class="required-indicator">*</span>
    </label>
    <g:countrySelect name="country" required="" noSelection="${[0: '~~~~~~~~~~~~Select Country~~~~~~~~~~~~']}"/>
    %{--<g:textField name="country" required="" value="${userInstance?.country}"/>--}%

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'state', 'error')} required">
    <label for="state">
        <g:message code="user.state.label" default="State"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="state" required="" value="${userInstance?.state}"/>

</div>

