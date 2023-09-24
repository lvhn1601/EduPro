<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EduPro - Online Learning</title>
    </head>
    <link href="assets/css/otp-confirmation.css" rel="stylesheet" type="text/css" media="all">
    <body>
        <form action="otp-reset-password" method="post">
            <br><br>
            <h2>Your OTP has been send</h2>
            <br>
            <p>Enter your OTP to reset password</p>
            <br>
            <input type="text" placeholder="OTP" name="otp" required="">
            <br>
            <div style="color: #b5bccaed">
                ${requestScope.msg}
            </div>
            <button type="submit">Continue</button>
            <div class="social">
                <a href="sign-up-byMail" style="margin-left: 30px; text-decoration: none" ><i class="fab fa-google" ></i> Try another email</a>
                <a href="/LearningManagement" style="margin-left: 70px; text-decoration: none" ><i class="fab fa-facebook" ></i> Home</a>
            </div>
        </form>
    </body>
</html>