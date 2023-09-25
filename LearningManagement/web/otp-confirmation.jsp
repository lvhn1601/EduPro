<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="shortcut icon" href="assets/img/?Pngtree?blue open book_4426437.png">
        <title>EduPro - Online Learning</title>
    </head>
    <link href="assets/css/otp-confirmation.css" rel="stylesheet" type="text/css" media="all">
    <style>
        body {
            background: url(assets/img/sanhAlpha.png);
            background-size: cover;
            background-repeat: no-repeat;

        }
    </style>
    <body>
        <%@include file="components/header-signIn-signUp.jsp" %>
        <form action="otp-confirmation" method="post" style="background-color: #f2f2f2">
            <br><br>
            <h2 style="color: #06BBCC">Your OTP has been send</h2>
            <br>
            <p style="color: #06BBCC">Enter your OTP to register</p>
            <br>
            <input style="background: #ffffff;color: #000" type="text" placeholder="OTP" name="otp" required="">
            <br>
            <div style="color: #b5bccaed">
                ${requestScope.msg}
            </div>
            <button type="submit">Continue</button>
            <br><br>
            <a href="${GOOGLE_LOGIN_HREF}" class="google-btn" style="width: 184px; height: 42px; background-color: #4285f4; border-radius: 2px; box-shadow: 0 3px 4px 0 rgba(0,0,0,.25); text-decoration: none; display: inline-block; position: relative;">
                <div class="google-icon-wrapper" style="position: absolute; margin-top: 1px; margin-left: 1px; width: 40px; height: 40px; border-radius: 2px; background-color: #fff;">
                    <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg" style="position: absolute; margin-top: 11px; margin-left: 11px; width: 18px; height: 18px;">
                </div>
                <p class="btn-text" style="float: right; margin: 11px 11px 0 0; color: #fff; font-size: 14px; letter-spacing: 0.2px; font-family: 'Roboto';">Another account</p>
            </a>
        </form>
    </body>
</html>