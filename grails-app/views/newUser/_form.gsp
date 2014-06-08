<%@ page import="com.linksharing.NewUser" %>



<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'fname', 'error')} required">
	<label for="fname">
		<g:message code="newUser.fname.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fname" required="" value="${newUserInstance?.fname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'lname', 'error')} required">
	<label for="lname">
		<g:message code="newUser.lname.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lname" required="" value="${newUserInstance?.lname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'emailid', 'error')} required">
	<label for="emailid">
		<g:message code="newUser.emailid.label" default="Email Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="emailid" required="" value="${newUserInstance?.emailid}"/>

</div>
<g:if test="${!(params.action=='edit')}">

<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="newUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:textField name="password" required="" value="${newUserInstance?.password}"/>--}%
    <g:passwordField name="password" required=""/>

</div>
<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'confirmPassword', 'error')} required">
    <label for="confirmPassword">
        <g:message code="newUser.confirmPassword.label" default="Confirm Password" />
        <span class="required-indicator">*</span>
    </label>
    %{--<g:textField name="password" required="" value="${newUserInstance?.password}"/>--}%
    <g:passwordField name="confirmPassword" required=""/>

</div>
</g:if>
<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'mob', 'error')} required">
	<label for="mob">
		<g:message code="newUser.mob.label" default="Mobile No." />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mob" required="" value="${newUserInstance?.mob}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="newUser.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:textField name="gender" required="" value="${newUserInstance?.gender}"/>--}%
       <g:select name="gender" from="${['male','female']}" noSelection="${[0:'~~~~Select  Gender~~~~']}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="newUser.country.label" default="Country" />
        <span class="required-indicator">*</span>
    </label>
    <g:countrySelect name="country" required="" noSelection="${[0:'~~~~~~~~~~~~Select Country~~~~~~~~~~~~']}"/>
    %{--<g:textField name="country" required="" value="${newUserInstance?.country}"/>--}%

</div>

<div class="fieldcontain ${hasErrors(bean: newUserInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="newUser.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${newUserInstance?.state}"/>

</div>

