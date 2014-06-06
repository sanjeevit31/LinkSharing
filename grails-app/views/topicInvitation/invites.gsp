<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 6/6/14
  Time: 12:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <head>
		<meta name="layout" content="userDashBord">
<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:javascript library="jquery"/>

</head>


<body>
<script>
    function unsubscribedUser(){
        alert('hey')
        var topic   =   $("#topic").val()
        alert(topic)
        jQuery.ajax({type:'POST',data:{'topic':topic}, url:'${params.appContext}/topicInvitation/unsubscribedUserList',
            success:function(data,textStatus){jQuery('#userList').html(data);},
            error:function(XMLHttpRequest,textStatus,errorThrown){}});return false;
    }

</script>
<g:form controller="topicInvitation" action="invitesSend">
    <table style="width: 400px;border: 1px solid black;margin-left: 100px" >
        <tr>
            <td>Topic</td>
            <td><g:select name="topic" id="topic" from="${params.topicList}" onclick="unsubscribedUser()"></g:select></td>
        </tr>
        <tr>
            <td>Invited To</td>
            <td><div id="userList"><g:select name="invitedTo"  from="${['Select Users']}"></div></g:select></td>
        </tr>
        <tr>
            <td><g:hiddenField name="invitedBy" value="${session.user}"/></td>
            <td><g:submitButton name="invites"></g:submitButton></td>
        </tr>

    </table>

</g:form>



</body>
</html>