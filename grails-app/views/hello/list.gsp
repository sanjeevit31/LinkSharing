<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 11/5/14
  Time: 12:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>

<body>
hi............
<g:each in="${persons}" var="person" status="i">
    <h3>${i+1}. ${person.lastName}, ${person.firstName}</h3>
    <p>
        Age: ${person.age}
    </p>
    <br/>
</g:each>
</body>
</html>
</body>
</html>