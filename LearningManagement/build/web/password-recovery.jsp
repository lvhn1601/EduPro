<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EduPro - Online Learning</title>
            <link rel="shortcut icon" href="assets/img/?Pngtree?blue open book_4426437.png">
    </head>
    <link href="assets/css/password-creation.css" rel="stylesheet" type="text/css" media="all">

    <body>
        <form id="myForm" action="password-recovery" method="post">
            <br>
            <h2>Password Recovery</h2>
            <br>
            <p>Enter your new password</p>
            <br>

            <input type="password" placeholder="New password" name="accountPassword" required="">

            <button type="submit">CONFIRM</button>
            <div class="social">
                <a href="sign-in" style="margin-left: 50px; text-decoration: none" > Sign In</a>
                <a href="/WebLaptop" style="margin-left: 120px; text-decoration: none" > Home</a>
            </div>
        </form>
        <script>
            const form = document.getElementById('myForm');
            const phone = sessionStorage.getItem("phoneNumber");
            console.log(phone);
            if (phone !== null) {
                form.action = 'password-recovery?phone=' + phone;
            }
        </script>
    </body>

</html>
