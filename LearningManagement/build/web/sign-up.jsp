<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LaptopHub - Best Laptop</title>
    </head>
    <link href="assets/css/sign-up.css?v=3" rel="stylesheet" type="text/css" media="all">

    <body>
        <form action="sign-up" method="post">
            <br><br>
            <h2>SIGN UP</h2>
            <br>
            <p>Enter your email to sign up </p>
            <br>
            <input name="email" type="email" placeholder="Email" >
            <br>
            
            <div style="color: #b5bccaed">
                ${requestScope.msg}
            </div>
            <button type="submit">Continue</button>
            <div class="social">
                <a href="sign-in" style="margin-left: 50px; text-decoration: none" > Sign In</a>
                <a href="/WebLaptop" style="margin-left: 120px; text-decoration: none" >Home</a>
            </div>
        </form>
    </body>

</html>