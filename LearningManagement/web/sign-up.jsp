<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="assets/img/?Pngtree?blue open book_4426437.png">
        <title>EduPro - Online Learning</title>
    </head>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
    <link href="assets/css/sign-up.css?v=3" rel="stylesheet" type="text/css" media="all">
    <style>
        body {
            background: url(assets/img/sanhAlpha.png);
            background-size: cover;
            background-repeat: no-repeat;

        }
    </style>
    <body>
        <%@include file="components/header-signIn-signUp.jsp" %>
        <form style="background-color: #f2f2f2">
            <br><br>
            <h2 style="color: #06BBCC">SIGN UP</h2>
            <br>
            <button style="margin-top: 10px; " id="sendMail" type="button" onclick="location.href = '/LearningManagement/sign-up-byMail';">Sign up with email</button>
            <button style="margin-top: 10px" id="sendSms" type="button"onclick="location.href = '/LearningManagement/sign-up-byPhone';" > Sign up with phone number </button>
            <br>
            <br>
            <a href="${GOOGLE_LOGIN_HREF}" class="google-btn" style="width: 184px; height: 42px; background-color: #4285f4; border-radius: 2px; box-shadow: 0 3px 4px 0 rgba(0,0,0,.25); text-decoration: none; display: inline-block; position: relative;">
                <div class="google-icon-wrapper" style="position: absolute; margin-top: 1px; margin-left: 1px; width: 40px; height: 40px; border-radius: 2px; background-color: #fff;">
                    <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg" style="position: absolute; margin-top: 11px; margin-left: 11px; width: 18px; height: 18px;">
                </div>
                <p class="btn-text" style="float: right; margin: 11px 11px 0 0; color: #fff; font-size: 14px; letter-spacing: 0.2px; font-family: 'Roboto';">Sign up with Google</p>
            </a>
            <br>
            <br>
            
            <div style="color: #b5bccaed">
                ${requestScope.msg}
            </div>
            Adready have account?<a href="sign-in" style="margin-left: 50px; " >Sign In</a>
            <br>
        </form>
    </body>

</html>