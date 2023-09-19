<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LMS</title>
    </head>
    <link href="assets/css/sign-up.css?v=3" rel="stylesheet" type="text/css" media="all">

    <body>
        <form>
            <br><br>
            <h2>SIGN UP</h2>
            <br>
            <button style="margin-top: 10px" id="sendMail" type="button" onclick="location.href = '/LearningManagement/otp-confirmation';">Sign up with email</button>
            <button style="margin-top: 10px" id="sendSms" type="button"onclick="location.href = '/LearningManagement/otp-confirmation';" > Sign up with phone number </button>
            <br>
            <br>
            <div style="color: #b5bccaed">
                ${requestScope.msg}
            </div>
            
                Adready have account?<a href="sign-in" style="margin-left: 50px; " >Sign In</a>
                <br>
                <a href="/WebLaptop" style="margin-left: 120px; text-decoration: none" >Home</a>
            
        </form>

        <script>
        
        </script>
    </body>

</html>