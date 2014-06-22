<%--
  Created by IntelliJ IDEA.
  User: sanjeev
  Date: 13/6/14
  Time: 11:45 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div style="margin:100px">
    <span style="font-size:40px;font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif,">Link Sharing</span>


    <div style="width:300px;height: 250px;border: ridge rgba(215, 215, 215, 0.73); margin-top: 20px;padding: 20px;box-shadow:2px 2px 3px 3px #427c97">
        <g:form controller="user" action="validateUser" method="POST" name="loginform">
            <table cellspacing="15">
                <tr><td>Username</td></tr>
                <tr><td><input type="text" name="name" id="name" style="width: 250px;"></td></tr>
                <tr style=""><td>Password</td></tr>
                <tr><td><input type="password" name="password" id="password" style="width: 250px;"></td></tr>
            </table>
            <table>
                <tr>
                    <td><input type="checkbox" name="rememberPassword" id="rememberPassword"
                               value="rememberPassword"><span style="font-size: small">Remember Password</span></td>
                    <td style="text-align: right;padding-left: 15px"><input type="submit" name="submit" id="submit"
                                                                            value="Log In"
                                                                            style="background-color: #006dba;width: 60px;height: 30px;color: #ffffff;border-radius: 10px"/>
                    </td>

                </tr>
            </table>
        </g:form>
        <table style="padding-top: 20px">
            <tr>
                <td><span style="height: 34px;font-size: small"><g:link controller="user"
                                                                        action="create">Register</g:link></span></td>
                <td style="text-align: right;padding-left: 15px;font-size: small"><g:link controller="user"
                                                                                          action="resetPassword">Lost Your Password ?</g:link></td>
            </tr>
        </table>
    </div>

</div>
</body>
</html>