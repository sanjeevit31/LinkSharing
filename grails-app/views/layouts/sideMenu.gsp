<!DOCTYPE html>
<html>
<head>
    <title>jQuery Vertical Navigation Demo
    <g:layoutTitle default="Grails"/>
    </title>
    <g:javascript library="jquery"></g:javascript>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700,600" rel="stylesheet" type="text/css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${resource(dir: 'Sticky-Sidebar-Navigation-Menu-with-jQuery-Vertical-Navigation/css', file: 'app.css')}"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'common.css')}">
    <script src="${resource(dir: 'js', file: 'common.js')}"></script>
    <g:layoutHead/>
    <r:layoutResources/>

</head>

<body style="background-color: #ffffff">

<div id="contentWrapper">

    <div id="contentLeft">
        <ul id="leftNavigation">
            <ul>
                <li><g:link controller="user" action="dashBoard"><i class="fa fa-coffee leftNavIcon"></i> Home</g:link>
                </li>
            </ul>
            <li><a href="#"><i class="fa fa-coffee leftNavIcon"></i>Topic</a>
                <ul>
                    <li><g:link controller="topic" action="create"><i
                            class="fa fa-angle-right leftNavIcon"></i>New Topic</g:link></li>
                    <li><g:link controller="topic" action="index"><i
                            class="fa fa-angle-right leftNavIcon"></i>Topic List</g:link></li>
                    <li><g:link controller="resource" action="create"><i
                            class="fa fa-angle-right leftNavIcon"></i>Add Resources</g:link></li>
                    <li><g:link controller="topicInvitation" action="invites"><i
                            class="fa fa-angle-right leftNavIcon"></i>Send Invitation</g:link></li>
                </ul>
            </li>

            <li><a href="#"><i class="fa fa-truck leftNavIcon"></i>User Profile</a>
                <ul>
                    <li><g:link controller="user" action="edit"><i
                            class="fa fa-angle-right leftNavIcon"></i>Edit Profile</g:link></li>
                    <li><g:link controller="user" action="changePassword1"><i
                            class="fa fa-angle-right leftNavIcon"></i>Change Password</g:link></li>
                    <li><g:link controller="logout" action="index"><i
                            class="fa fa-angle-right leftNavIcon"></i>Logout</g:link></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-envelope-o leftNavIcon"></i> Contact us</a>
                <ul>
                    <li><a href="#"><i class="fa fa-angle-right leftNavIcon"></i> Find Us</a></li>
                    <li><a href="#"><i class="fa fa-angle-right leftNavIcon"></i> Contact Details</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <div id="contentRight">

        <div style="height:50px;" onclick="dashBoard()">
            <g:link controller="user" action="dashBoard" style="color: #333333">
                <span style="font-size: 40px;font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">
                      WELCOME TO LINKSHARING
                 </span>
            </g:link>
            <span style="margin-left: 50px">
                  <span>
                     <ls:userFullName user="${user}"></ls:userFullName>
                 </span>
                 <span style="padding-left: 10px"><g:link controller="logout" action="index">Logout</g:link></span>
                 </span>
             <hr align="center" width="520px" style="margin-left: 16px;box-shadow:0px 0px 0px 1px #5fddff"/>

        </div>

    </div>
</div>
<r:layoutResources/>
<script src="${resource(dir: 'Sticky-Sidebar-Navigation-Menu-with-jQuery-Vertical-Navigation/js', file: 'jquery.ssd-vertical-navigation.min.js')}"></script>
<script src="${resource(dir: 'Sticky-Sidebar-Navigation-Menu-with-jQuery-Vertical-Navigation/js', file: 'app.js')}"></script>
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();

</script>

<div style="margin-left: 100px">
 <g:layoutBody/>
    <script src="${resource(dir: 'js', file: 'dashBoard.js')}"></script>
</div>

</body>
</html>