<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <!-- Topbar End -->
        <div class="container emp-profile">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile-img">
                        <img src="${sessionScope.accountCur.avatar_url}" alt="" />


                        <div class="file btn btn-lg btn-primary">  
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
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="class-join-tab"
                                    data-bs-toggle="tab"
                                    href="#class-join"
                                    role="tab"
                                    aria-controls="address"
                                    aria-selected="false"
                                    >Class join</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="my-certificate-tab"
                                    data-bs-toggle="tab"
                                    href="#my-certificate"
                                    role="tab"
                                    aria-controls="delivering"
                                    aria-selected="false"
                                    >My certificate</a
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
                                        <label><i class="fa-solid fa-lock icon"></i> Pass Word</label>
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
                        <!----------------START TAB CLASS JOIN------------->
                        <div
                            class="tab-pane fade"
                            id="class-join"
                            role="tabpanel"
                            aria-labelledby="class-join-tab"
                            >
                            <table class="table shadow table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Class</th>
                                        <th scope="col">Lecturers</th>
                                        <th scope="col">Number of students</th>
                                        <th scope="col">Semester</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.lstClass}" var="o" varStatus="i">
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>    
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!----------------END TAB CLASS JOIN------------->
                        <!------------------START TAB MY CERTIFICATE----------------------->

                        <div
                            class="tab-pane fade"
                            id="my-certificate"
                            role="tabpanel"
                            aria-labelledby="my-certificate-tab"
                            >
                            <table class="table shadow table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Name Lesson</th>
                                        <th scope="col">Started Date</th>
                                        <th scope="col">Done Date</th>
                                        <th scope="col">View</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.lstNewOrder}" var="o" varStatus="i">
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
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
    </body>
    <!--    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

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



    <%
        request.getSession().removeAttribute("msgchangePassword");
        request.getSession().removeAttribute("msgchangeInformation");
        request.getSession().removeAttribute("msgchangeAvatar");
    %>
</html>
