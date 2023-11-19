<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="shortcut icon" href="assets/img/—Pngtree—blue open book_4426437.png">

        <title>My profile</title>

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet"
            />
        <!--FontAwesome-->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!--css file-->
        <link rel="stylesheet" href="assets/css/profile.css" />
        <link href="assets/css/style_profile.css" rel="stylesheet" />

        <!-- favicon -->
        <link rel="shortcut icon" href="assets/img/logo.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    </head>

    <body>
        <div class="page-wrapper doctris-theme">
            <%@include file="components/sidebar.jsp" %>

            <main class="page-content bg-light">
                <%@include file="components/header.jsp" %>
                <!-- Topbar End -->
                <div class="container emp-profile" style="margin-top: 100px">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="profile-img">
                                <img src="<c:out value="${accountCur.avatar_url}" />" alt="Avatar">



                                <div class="file btn btn-primary">  
                                    <a class="profile-edit-btn"
                                       data-bs-toggle="modal"
                                       data-bs-target="#changeAvatarModal"
                                       href="javascript:void(0)">
                                        Change Photo
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row col-md-9">
                            <div class="col-md-9">
                                <div class="profile-head">
                                    <input
                                        type="hidden"
                                        class="form-control"
                                        id="id"
                                        name="accountId"
                                        value="${sessionScope.accountCur.id}"
                                        />
                                    <h5>${sessionScope.accountCur.name}</h5>
                                    <h6>Email: ${sessionScope.accountCur.email}</h6>
                                    <h6>Phone: ${sessionScope.accountCur.phone}</h6>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <a
                                    class="profile-edit-btn"
                                    data-bs-toggle="modal"
                                    data-bs-target="#changeInformModal"
                                    href="javascript:void(0)"
                                    >edit profile</a
                                >
                            </div>
                            <div class="col-md-12" style="margin-top: -50px;">
                                <ul
                                    class="nav nav-tabs"
                                    id="myTab"
                                    role="tablist"
                                    style="margin-top: 50px"
                                    >
                                    <li class="nav-item">
                                        <a
                                            class="nav-link"
                                            id="about-tab"
                                            data-bs-toggle="tab"
                                            href="#about"
                                            role="tab"
                                            aria-controls="about"
                                            aria-selected="true"
                                            >About</a
                                        >
                                    </li>                                
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-9">
                            <div class="tab-content profile-tab" id="myTabContent">
                                <!---------------- START TAB ABOUT------------->
                                <div
                                    class="tab-pane fade"
                                    id="about"
                                    role="tabpanel"
                                    aria-labelledby="about-tab"
                                    >
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label><i class="fa-solid fa-envelope icon"></i>Email</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${sessionScope.accountCur.email}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label><i class="fa-solid fa-phone icon"></i>Phone</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>${sessionScope.accountCur.phone}</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label><i class="fa-solid fa-signature icon"></i> Name</label>
                                        </div>
                                        <div class="col-md-4">
                                            <p>${sessionScope.accountCur.name}</p>
                                        </div>
                                        <div class="col-md-2">
                                            <p><i class="fa-regular fa-pen-to-square"></i></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label
                                                ><i class="fa-solid fa-calendar-days icon"></i> Date Of
                                                Birth</label
                                            >
                                        </div>
                                        <div class="col-md-4">
                                            <p><fmt:formatDate value="${sessionScope.accountCur.dob}" pattern="dd/MM/yyyy" /><p>
                                        </div>
                                        <div class="col-md-2">
                                            <p><i class="fa-regular fa-pen-to-square"></i></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label><i class="fa-solid fa-lock icon"></i> Password</label>
                                        </div>
                                        <div class="col-md-6">
                                            <p>
                                                <a
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#changePasswordModal"
                                                    href="javascript:void(0)"
                                                    >Change</a
                                                >
                                            </p>
                                        </div>
                                    </div>
                                </div> 
                                <!---------------- END TAB ABOUT------------->
                               
                                <!------------------END  MY CERTIFICATE----------------------->
                            </div>
                        </div>
                    </div>
                </div>

                <!------------------------MODAL CHANGE PASSWORD-------------------------->   
                <%@include file="modal/modal-change-password.jsp" %>
                <!------------------------MODAL CHANGE INFORMATION-------------------------->
                <%@include file="modal/modal-change-information.jsp" %>
                <!------------------------MODAL CHANGE AVATAR-------------------------->
                <%@include file="modal/modal-change-avatar.jsp" %>

                <%@include file="components/footer.jsp" %>
            </main>
        </div>

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
    </body>



    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <script>
        const listDomains = ${domains};
        const error_text = document.getElementById("error-mess");
        const submit_btn = document.getElementById("submit_btn");
        const email_box = document.getElementById("email");
        const phone_box = document.getElementById("phone");

        function checkDomain(str) {
            for (let domain of listDomains)
                if (domain === str)
                    return true;
            return false;
        }

        function checkEmpty() {
            let email = email_box.value;
            let phone = phone_box.value;

            error_text.textContent = null;

            if (email.trim() === '' && phone.trim() === '') {
                error_text.textContent = "You must input email or phone!";
            }


            if (!checkDomain(email.split("@")[1])) {
                error_text.textContent = "This email domain is not valid!";
            }

            if (phone.trim() !== '' && (phone.length > 12 || (phone.charAt(0) !== '0' && phone.charAt(0) !== '+') || phone.length < 8)) {
                error_text.textContent = "This phone number is not valid!";
            }

            if (!error_text.textContent) {
                document.getElementById('form-change-nformation').submit();
            }
        }
    </script>
    <script>
        $("#about-tab").addClass("active");
        $("#about").addClass("show active");
        const msgUpdate = '<%= session.getAttribute("msgUpdate") %>';
        if (msgUpdate === 'addressContact') {
            $("#about-tab").removeClass("active");
            $("#about").removeClass("show active");
            $("#address-tab").addClass("active");
            $("#address").addClass("show active");
        }
        if (msgUpdate === 'deleteNewOrder') {
            $("#about-tab").removeClass("active");
            $("#about").removeClass("show active");
            $("#new-order-tab").addClass("active");
            $("#new-order").addClass("show active");
        }
    </script>

    <script>
        const msgchangePassword = '<%= session.getAttribute("msgchangePassword") %>';
        if (msgchangePassword !== 'null') {
            var myModal = new bootstrap.Modal(document.getElementById("changePasswordModal"), {});
            document.onreadystatechange = function () {
                myModal.show();
            };
        }
    </script>

    <script>
        const msgchangeInformation = '<%= session.getAttribute("msgchangeInformation") %>';
        if (msgchangeInformation !== 'null') {
            const myModal = new bootstrap.Modal(document.getElementById("changeInformModal"), {});
            document.onreadystatechange = function () {
                myModal.show();
            };
        }
    </script>
    <script>
        const msgchangeAvatar = '<%= session.getAttribute("msgchangeAvatar") %>';
        if (msgchangeAvatar !== 'null') {
            const myModal = new bootstrap.Modal(document.getElementById("changeAvatarModal"), {});
            document.onreadystatechange = function () {
                myModal.show();
            };
        }
    </script>

    <script>
        // This code will reload the avatar image when the modal is closed.
        $('#changeAvatarModal').on('hidden.bs.modal', function () {
            location.reload();
        });
    </script>



    <%
        request.getSession().removeAttribute("msgchangePassword");
        request.getSession().removeAttribute("msgchangeInformation");
        request.getSession().removeAttribute("msgchangeAvatar");
    %>
</html>
