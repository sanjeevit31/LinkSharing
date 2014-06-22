<html>
<head>
	<meta name='layout' content=''/>
	<title><g:message code="springSecurity.login.title"/></title>
   <style>

   .login_message{
      color: red;
   }
       .login{
           margin:100px;
           align-self: center;
           display: none;
       }
       .lnkshrMsg{
           font-size:40px;
           font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif
       }
       .loginContent{
           width:300px;
           /*height: 30px;*/
           border: ridge rgba(215, 215, 215, 0.73);
           margin-top: 20px;
           padding: 20px;
           box-shadow:2px 2px 3px 3px #427c97
       }
       .submit{
           background-color: #006dba;
           width: 60px;
           height: 30px;
           color: #ffffff;
           border-radius: 10px
       }
       .register{
           font-size: small;
       }
       .forget{
           font-size: small;
           padding-left: 20px;
       }
   </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>

<body>
<script>
    $(document).ready(function(){


//        $(".login").animate(
//                {"height": "0px"},
//
//                "slow");
        $('.login').slideDown('slow')
    });


</script>

<center>
<div class='login'>
    <span class="lnkshrMsg"><g:message code="springSecurity.login.welcomeMsg"/></span>

    <div class="loginContent">

		<div class='fheader'></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>

            <table cellspacing="15">
                <tr><td>Username</td></tr>
                <tr><td><input type='text' class='text_' name='j_username'  required="" style="width: 250px;"/></td></tr>
                <tr style=""><td>Password</td></tr>
                <tr><td><input type='password' class='text_' name='j_password' required="" style="width: 250px;"></td></tr>
            </table>

            <table>
                <tr>
                    <td>
                        <p id="remember_me_holder">
                                 <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                 <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label></td>
                       </p>
                    <td style="text-align: right;padding-left: 15px"><input type="submit" name="submit" id="submit" class='submit' value='${message(code: "springSecurity.login.button")}'/></td>

                </tr>
            </table>
		</form>
        <table style="padding-top: 5px">
            <tr>
                <td><g:link name="registration"  action="create" controller="user" class="register">Register</g:link></td>
                <td ><g:link controller="user" action="resetPasswordForm" class="forget">Lost Your Password ?</g:link> </td>
            </tr>
        </table>

	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
    </center>
</body>
</html>
