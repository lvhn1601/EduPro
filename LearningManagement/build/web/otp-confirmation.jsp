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
            <input type="hidden" name="action" value="register">
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
            <a></a>
        </form>
    </body>
</html>