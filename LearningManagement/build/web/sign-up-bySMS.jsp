<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="assets/img/?Pngtree?blue open book_4426437.png">
        <link href="assets/css/sign-up.css?v=3" rel="stylesheet" type="text/css" media="all">
    </head>
    <style>
        .container {
            width: 302px;
            height: 175px;
            position: absolute;
            left: 0px;
            right: 0px;
            top: 0px;
            bottom: 0px;
            margin: auto;
        }

        #number,
        #verificationcode {
            width: calc(100% - 24px);
            padding: 10px;
            font-size: 20px;
            margin-bottom: 5px;
            outline: none;
        }

        #recaptcha-container {
            margin-bottom: 5px;
        }

        #send,
        #verify {
            width: 100%;
            height: 40px;
            outline: none;
        }

        .p-conf,
        .n-conf {
            width: calc(100% - 22px);
            border: 2px solid green;
            border-radius: 4px;
            padding: 8px 10px;
            margin: 4px 0px;
            background-color: rgba(0, 249, 12, 0.5);
            display: none;
        }

        .n-conf {
            border-color: red;
            background-color: rgba(255, 0, 4, 0.5);
        }
        form {
            background-color: #f2f2f2;
        }

        .container {
            text-align: center;
            margin-top: 50px;
        }

        .form-heading {
            color: #06BBCC;
        }

        .form-subtext {
            color: #06BBCC;
        }

        .form-input {
            background: #ffffff;
            color: #000;
            margin-bottom: 10px;
            padding: 8px;
        }

        #recaptcha-container {
            /* Add your styles for recaptcha container */
        }

        button {
            background-color: #06BBCC;
            color: #ffffff;
            padding: 10px;
            cursor: pointer;
        }

        .form-message {
            margin-top: 10px;
            padding: 8px;
        }

        .success {
            background-color: #4CAF50;
            color: white;
        }

        .error {
            background-color: #f44336;
            color: white;
        }
    </style>

    <body>
        <%@include file="components/header-signIn-signUp.jsp" %>
        <form style="background-color: #f2f2f2">
            <div class="container">
                <div id="sender">
                    <h2 style="color: #06BBCC">SIGN UP</h2>
                    <p style="color: #06BBCC">Enter your phone number to get OTP</p>
                    <br>
                    <input style="background: #ffffff;color: #000" type="text" name="number" id="number" placeholder="Your number">
                    <div id="recaptcha-container"></div>
                    <button type="button" id="send" onClick="phoneAuth()">Send</button>
                </div>
                <div id="verifier" style="display: none">
                    <h2 style="color: #06BBCC">Your OTP has been send</h2>
                    <input style="background: #ffffff;color: #000" type="text" id="verificationcode" placeholder="OTP Code">
                    <button type="button" id="verify" onClick="codeverify()">Verify</button>
                    <div class="p-conf">Number Verified</div>
                    <div class="n-conf">OTP ERROR</div>
                </div>
            </div>
        </form>
        <!--	add firebase SDK-->
        <script src="https://www.gstatic.com/firebasejs/9.12.1/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.12.1/firebase-auth-compat.js"></script>

        <%@ page import="java.util.List" %>
        <%@ page import="com.google.gson.Gson" %>
        <script>
                        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
                        const firebaseConfig = {
                            apiKey: "AIzaSyDxdKXptrzc4pjQLmV1hlgJSPWbdqPl1s8",
                            authDomain: "g2esport-e73c5.firebaseapp.com",
                            projectId: "g2esport-e73c5",
                            storageBucket: "g2esport-e73c5.appspot.com",
                            messagingSenderId: "914939081478",
                            appId: "1:914939081478:web:23402639e265e7a30a6487",
                            measurementId: "G-KMG33MSRFD"
                        };
                        firebase.initializeApp(firebaseConfig);
                        render();
                        function render() {
                            window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container');
                            recaptchaVerifier.verify();
                        }
                        // function for send message
                        function phoneAuth() {
                            var number = document.getElementById('number').value;
                            if (number.charAt(0) === '0') {
                                number = '+84' + number.substr(1);
                            }
                            var phoneList = <%= request.getAttribute("jsonList") %>;
                            console.log(phoneList)
                            console.log(number)
                            var isPhoneNumberValid = checkPhoneNumberInList(number, phoneList);
                            if (!isPhoneNumberValid) {
                                firebase.auth().signInWithPhoneNumber(number, window.recaptchaVerifier).then(function (confirmationResult) {
                                    window.confirmationResult = confirmationResult;
                                    coderesult = confirmationResult;
                                    document.getElementById('sender').style.display = 'none';
                                    document.getElementById('verifier').style.display = 'block';

                                    sessionStorage.setItem('phoneNumber', number);
                                }).catch(function (error) {
                                    alert(error.message);
                                });
                            } else {
                                alert("This phone number is registered");
                            }

                        }
                        function checkPhoneNumberInList(phoneNumber, phoneList) {
                            return phoneList.includes(phoneNumber);
                        }
                        // function for code verify
                        function codeverify() {
                            var code = document.getElementById('verificationcode').value;
                            coderesult.confirm(code).then(function () {
                                document.getElementsByClassName('p-conf')[0].style.display = 'block';
                                document.getElementsByClassName('n-conf')[0].style.display = 'none';
                                window.location.href = 'password?action=register';
                            }).catch(function () {
                                document.getElementsByClassName('p-conf')[0].style.display = 'none';
                                document.getElementsByClassName('n-conf')[0].style.display = 'block';
                            });
                        }
        </script>
    </body>
</html>