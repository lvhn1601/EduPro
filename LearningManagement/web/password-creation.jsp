<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EduPro - Online Learning</title>
    </head>
    <link href="assets/css/password-creation.css" rel="stylesheet" type="text/css" media="all">

    <body>
        <form id="myForm" action="password-creation" method="post" onsubmit="return validateForm()">
            <br>
            <h2>SIGN UP</h2>
            <br>
            <p>Enter your fullname and password to register</p>
            <br>
            <input type="text" placeholder="Name" name="accountDetailName" required="">

            <input type="password" placeholder="Password" name="accountPassword" id="password" required="">

            <input type="password" placeholder="Re-enter Password" id="rePassword" required="">

            <div id="passwordError" style="color: #b5bccaed; display: none;">Passwords do not match.</div>

            <button type="submit">SIGN UP</button>

            <div class="social">
                <a href="sign-in" style="margin-left: 50px; text-decoration: none">Sign In</a>
                <a href="/WebLaptop" style="margin-left: 120px; text-decoration: none">Home</a>
            </div>
        </form>

        <script>
            const form = document.getElementById('myForm');
            const phone = sessionStorage.getItem("phoneNumber");
             
            if (phone !== null) {
                form.action = 'password-creation?phone=' + phone;
            }
            function validateForm() {
                var password = document.getElementById('password').value;
                var rePassword = document.getElementById('rePassword').value;

                if (password !== rePassword) {
                    document.getElementById('passwordError').style.display = 'block';
                    return false; // Prevent form submission
                }

                // If passwords match, continue with form submission
                return true;
            }
        </script>

    </body>

</html>
