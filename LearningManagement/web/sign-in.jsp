<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LMS</title>
    </head>
    <link href="assets/css/sign-in.css" rel="stylesheet" type="text/css" media="all">
    <style>
        .btn-check{
            size: 0.5rem;
            width: 50%;
            margin: auto;
        }
        .fab {
            text-decoration: none;
        }
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        /* Hide default HTML checkbox */
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked+.slider {
            background-color: #2196F3;
        }

        input:focus+.slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked+.slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
    </style>
    <body>
        <%@include file="components/header-signIn-signUp.jsp" %>
        <form action="sign-in" method="post">
            <h3>Sign in</h3>
            <div style="color: #b5bccaed; margin-top: 10px">
                ${requestScope.msg}
            </div>
            <label for="username">Username</label>
            <input type="email" placeholder="Email" name="username" required="">

            <label for="password">Password</label>
            <input type="password" placeholder="Password" name="password" required="">
            <label class="switch">
                <input class=" btn-check" name="isRemeberMe" type="checkbox" id="rememberMe" checked>
                <span class="slider round" ></span>
                <h4 style="margin-left: 100px">Remember me</h4>
            </label>
            <button type="submit">SIGN IN</button>
            <div class="social" style="margin-top: 20px">
                <a href="sign-up" style="margin-left: 50px; text-decoration: none">Sign Up</a>
                <a href="${GOOGLE_LOGIN_HREF}">Login With Google</a>
            </div>
        </div>
    </form>
</body>

</html>
