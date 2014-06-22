<!DOCTYPE html>
<html>
<head>
    <title>jQuery Vertical Navigation Demo
    <g:layoutTitle default="Grails"/>
    </title>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700,600" rel="stylesheet" type="text/css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${resource(dir: 'Sticky-Sidebar-Navigation-Menu-with-jQuery-Vertical-Navigation/css', file: 'app.css')}"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'formlogin.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'common.css')}">
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
    <div id="contentRight">
        <div style="height:50px;">

            <g:link controller="user" action="dashBoard" style="color: #333333">
                <span style="font-size: 40px;font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">
                        WELCOME TO LINKSHARING
                 </span>
            </g:link>

            <span style="margin-left: 90px">
                <g:if test="${user}">
                    <span>
                        <ls:userFullName user="${user}"></ls:userFullName>
                    </span>
                    <span style="padding-left: 10px"><g:link controller="logout" action="index">Logout</g:link></span>
                    </span>
                </g:if>
                <g:else>
                    <span>
                        <g:link controller="login" action="auth">Login</g:link>
                    </span>
                    <span style="padding-left: 10px"><g:link controller="user" action="create">Register</g:link></span>
                </g:else>

            </span>
            <hr align="center" width="520px" style="position: relative;margin-left:16px ; box-shadow:0px 0px 0px 1px #5fddff"/>

        </div>
    </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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

<r:layoutResources/>
    <g:layoutBody/>
<script src="${resource(dir: 'js', file: 'dashBoard.js')}"></script>
</body>
</html>