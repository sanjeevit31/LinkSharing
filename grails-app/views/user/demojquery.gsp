<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 20/5/14
  Time: 1:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Simple GSP page</title>
    <g:javascript library="jquery"/>
    <jqui:resources theme="darkness"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#datepicker").datepicker({dateFormat: 'yy/mm/dd'});
        })
    </script>

</head>

<body>
<div>
    <p>Between <input type="text" id="datepicker"></p>
</div>

</body>
</html>