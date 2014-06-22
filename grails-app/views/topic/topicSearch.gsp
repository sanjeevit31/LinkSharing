<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 20/6/14
  Time: 12:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="twitterBootstrapLayout"> </meta>
    <title>Login</title>

</head>

<body>

<div class="tab-content">
    <div class="tab-pane active fade in" id="inside">
        <div class="panel panel-default">
        <div class="panel-heading"><h6 class="panel-title"><i class="icon-table"></i>Search Results....</h6></div>
           <g:if test="${topics}">
               <table class="table">
                   <thead>
                   <tr>
                       <th>Sl no</th>
                       <th>Title</th>
                       <th>Author</th>
                       <th>Visibility</th>

                   </tr>
                   </thead>
                   <tbody>
                   <g:each in="${topics}" var="topicInstace" status="status">
                       <g:set var="index" value="${status + 1}"/>
                       <tr>
                           <th>${index}</th>
                           <th>${topicInstace.name}</th>
                           <th><ls:userFullName user="${topicInstace.user}"></ls:userFullName></th>
                           <th>${topicInstace.visibility}</th>

                       </tr>
                   </g:each>

                   </tbody>
               </table>
               <hr size="4px">
               <div class="pagination1">
                   <g:paginate controller="topic" action="topicSearch" total="${topics.totalCount}" max="5" params="${[searchKey:searchKey]}"/>
               </div>
           </g:if>
           <g:else>
               <span style="color: #ff0000">No Record Found !</span>
           </g:else>


         </div>


   </div>

 </div>


</body>
</html>