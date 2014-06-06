<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 27/5/14
  Time: 3:53 PM
--%>

<%@ page import="com.linksharing.Resource" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>


<table>
    <thead>
    <tr>

        <g:sortableColumn property="heading" title="${message(code: 'resource.heading.label', default: 'Heading')}" />
        <th></th>
        <th><g:message code="resource.new.label" default="User" /></th>



        <g:sortableColumn property="type" title="${message(code: 'resource.type.label', default: 'Type')}" />

        <g:sortableColumn property="url_path" title="${message(code: 'resource.url_path.label', default: 'Content')}" />

    </tr>
    </thead>
    <tbody >
    <g:each in="${params.resourceList}" status="i" var="resourceInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}" id="${i}">

            <td><g:link action="show" id="${resourceInstance.id}">${resourceInstance.heading}</g:link></td>
            <td style="font-size: 10px" id="status">
               <span id="new${i}">${params.read.get(i)?'':'new'}</span>
                <g:hiddenField name="resourceId" id="resourceId${i}" value="${resourceInstance.id}"/>
                </td>
            <td>${resourceInstance.new}</td>



            <td>${resourceInstance.type}</td>
            <g:if test="${resourceInstance.type=='Link'}">
            <td id="td${i}">
                <g:hiddenField  value="${resourceInstance.url_path}" name="url${i}" id="tdtd${i}"></g:hiddenField>
                <g:hiddenField  value="Link" name="Link${i}" id="Linktd${i}"></g:hiddenField>
                <g:link  url="#">Click To See Link</g:link>
            </td>
            </g:if>
            <g:else>
                <td id="td${i}">
                %{--<g:remoteLink controller="resource" action="download" params="['path':resourceInstance.url_path]">DownLoad</g:remoteLink>--}%
                <g:hiddenField  value="${resourceInstance.url_path}" name="url${i}" id="tdtd${i}"></g:hiddenField>
                <g:hiddenField  value="DownLoad" name="Link${i}" id="Linktd${i}"></g:hiddenField>
                <g:link  url="#">Download</g:link>
                </td>
            </g:else>

        </tr>
    </g:each>
    </tbody>
</table>

<script>
$(document).ready(function(){
    $('tr').click(function(){
        alert('on row click')
       var trId=$(this).attr("id");
        var tdId="resourceId"+trId;
        var newId='new'+trId;
             if(($('#'+newId).text())=='new'){alert('from new')
                     /*$('#'+newId).hide()*/
                     $('#'+newId).text('')
                    var resourceId=($("#"+tdId).val())
                 alert('${params.appContext}')
                 jQuery.ajax({type:'POST',data:{'resourceId':resourceId}, url:'${params.appContext}/resource/resourceReadStatus?user=${session.user}',
                 success:function(data,textStatus){/*alert('hello'+data)*/},
                 error:function(XMLHttpRequest,textStatus,errorThrown){}});return false;
      }




    })
    $('td').click(function(){
        alert('column click')
      var tdId =  $(this).attr('id')
       var url=$('#td'+tdId).val()
        if($('#Link'+tdId).val()=='Link')
       window.open(url)
        else  if($('#Link'+tdId).val()=='DownLoad'){
            alert('Download'+url)

            window.open('${params.appContext}/resource/download?path='+url)


        }


        })
})
</script>
</body>
</html>