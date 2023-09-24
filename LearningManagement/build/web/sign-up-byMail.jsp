<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="shortcut icon" href="assets/img/?Pngtree?blue open book_4426437.png">
        <title>EduPro - Online Learning</title>
    </head>
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
        <form action="sign-up-byMail" method="post" style="background-color: #f2f2f2">
            <br><br>
            <h2 style="color: #06BBCC">SIGN UP</h2>
            <br>
            <p  style="color: #06BBCC">Enter your email to get OTP</p>
            <br>
            <input style="background: #ffffff;color: #000" name="email" type="email" placeholder="Email" >
            <br>
            <div style="color: #b5bccaed">
                ${requestScope.msg}
            </div>
            <button type="submit">Continue</button>
            <div class="social">
                <a href="sign-in" style="margin-left: 50px; text-decoration: none;color: #06BBCC" > Sign In</a>
                <a href="/LearningManagement" style="margin-left: 120px; text-decoration: none; color: #06BBCC" >Home</a>
            </div>
        </form>
    </body>

</html>