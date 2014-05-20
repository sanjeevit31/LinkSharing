<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 14/5/14
  Time: 10:34 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><g:javascript src="linksharing_basic.js"></g:javascript>
    <meta name="layout" content="linksharing"> </meta>
    <title>Login</title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css' ,file: 'formlogin.css')}">

</head>

<body>
<div id="registrationDiv">
    <g:form name="registrationform" controller="newUser" action="index">
    <g:textField required="yes" name="fname" placeholder="First name"></g:textField><g:textField name="lname" placeholder="Last name"></g:textField>
    <g:textField name="emailid" placeholder="User Email Id" required="yes" size="45"></g:textField>
    <g:passwordField name="password" placeholder="Password" required="yes" size="45"></g:passwordField>
    <g:passwordField name="confirmpass" placeholder="Confirm Password" required="yes" size="45"></g:passwordField>
    <g:textField name="mob" placeholder="Mobile No" width="10" maxlength="10" required="yes" size="45" ></g:textField>
    <g:countrySelect name="country"  noSelection="['':'-Choose your country-']" onchange="showStates()"></g:countrySelect></br>
    <g:select name="state" from="${['bihar','delhi','up']}" noSelection="${[1:'select state']}" class="hidden_" required="required"></g:select></br>
    <g:radio name="gender" value="male" required="yes"></g:radio>Male
    <g:radio name="gender" value="female" required="yes">Female</g:radio>Female</br></br>
        I agree to the IntelliGrape Terms and Privacy</br>
    %{--<g:actionSubmit value="Create Account" class="button_"></g:actionSubmit>--}%
        <g:submitButton value="Create Account" name='submit' class="button_"></g:submitButton>
    </g:form>
</div>

</body>
</html>