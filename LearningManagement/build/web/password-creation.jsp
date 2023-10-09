<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="shortcut icon" href="assets/img/?Pngtree?blue open book_4426437.png">
        <title>EduPro - Online Learning</title>
    </head>
    <link href="assets/css/password-creation.css" rel="stylesheet" type="text/css" media="all">

    <body>
        <%@include file="components/header-signIn-signUp.jsp" %>
        <form id="myForm" action="password-creation" method="post" onsubmit="return validateForm()" style="background-color: #f2f2f2">
            <br>
            <h2 style="color: #06BBCC">SIGN UP</h2>
            <br>
            <p style="color: #06BBCC"> Enter your fullname and password to register</p>
            <br>
            <input style="background: #ffffff;color: #000" type="text" placeholder="Name" name="accountDetailName" required="">

            <input style="background: #ffffff;color: #000" type="password" placeholder="Password" name="accountPassword" id="password" required="">

            <input style="background: #ffffff;color: #000" type="password" placeholder="Re-enter Password" id="rePassword" required="">

            <div id="passwordError" style="color: #b5bccaed; display: none;">Passwords do not match.</div>
            <br>
            <button style="color: #06BBCC" type="submit">SIGN UP</button>

            <div class="social">
                <a href="sign-in" style="margin-left: 50px; text-decoration: none; color: #06BBCC">Sign In</a>
                <a href="/LearningManagement" style="margin-left: 120px; text-decoration: none; color: #06BBCC">Home</a>
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
