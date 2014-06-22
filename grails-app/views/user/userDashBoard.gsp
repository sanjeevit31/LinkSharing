<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 19/6/14
  Time: 11:16 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="sideMenu">
    <title>DashBoard</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'dashboard.css')}"/>
</head>

<body style="background-color: #ffffff">
<div style="background-color: #ffffff">


<div style="margin-left: 10px;width: 300px" id="leftPanel">
    <b>My Topics</b><br>
    <g:each in="${userTopics}" var="topicInstance" status="status">
        <div class='topics'>
            ${status + 1}. ${topicInstance.name}
            <span class="plus">+</span>

            <div class='summeryDiv' style="display:none; padding-top: 10px; font-size: small" id="summery${status}">
                <b>Summery</b>:<br>
                <ls:topicSummery topic="${topicInstance}"></ls:topicSummery>
                <br><br>

            </div>
        </div>

    </g:each>
    <div class="pagination">
        <g:paginate controller="user" action="userDashBoard" total="${userTopics.totalCount}" max="5"/>
    </div>
</div>
<div style="width: 400px;left: 700px;top:90px;position: absolute;background-color: #ffffff" id="rightPanel">

    <b>Topic Wise Subscriber</b>
    <div style=" border:thin solid #dcdcdc;padding-top: 10px;margin: 4px;padding-left: 10px;height: 170px">
      <table style="width: 300px;">
          <tr style="background-color: #dcdcdc">
              <td>Topic</td><td>Subscribers</td>
          </tr>
              <g:each in="${topicAndTheirSubscriptionCount}" var="topics" status="status">
                 <tr style="font-size: small;">
                    <td>${topics[0]}</td><a href="#"><td onclick="seeSubscribers()">${topics[1]}</td></a>
                  </tr>
              </g:each>
      </table>

    </div>

</div>

</div>
<g:javascript>
function seeSubscribers(){
alert()
}
</g:javascript>
</body>
</html>