

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Manager - LMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
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
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="components/sidebar.jsp"/>

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="components/header.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">Class</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Assignment</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Assignment of ${c.class_name}</h5>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">NAME</th>
                                                <th class="border-bottom p-3" style="min-width: 240px;">DUE DATE</th>
                                                <th class="border-bottom p-3">STATUS</th>
                                                    <c:choose>
                                                        <c:when test="${sessionScope.accountCur.role.id == 4}">
                                                        <th class="border-bottom p-3">SUBMISSION TIME</th>

                                                    </c:when>
                                                    <c:when test="${sessionScope.accountCur.role.id == 3}">
                                                        <th class="border-bottom p-3" hidden="">GRADE</th>

                                                    </c:when>
                                                </c:choose>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listAsm}" var="asm">
                                                <tr>
                                                    <th class="p-3">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.accountCur.role.id == 4}">
                                                                <a href="assignment-detail?id=${asm.lessonId.id}">${asm.lessonId.title}</a>
                                                            </c:when>
                                                            <c:when test="${sessionScope.accountCur.role.id == 3}">
                                                                <a href="assignment-submit?id=${asm.lessonId.id}">${asm.lessonId.title}</a>
                                                            </c:when>
                                                        </c:choose>
                                                    </th>

                                                    <td class="py-3">
                                                        ${asm.dueDate}
                                                    </td>
                                                    <td class="p-3">
                                                        ${asm.lessonId.status == true ? 'On Going' : 'Expired'}
                                                    </td>
                                                    <td class="p-3">

                                                    </td>

                                                    <td class="p-3">${u.created_by}</td>

                                                    <td class="text-end p-3">
                                                        <a href="#"
                                                           class="btn btn-icon btn-pills btn-soft-primary" 
                                                           data-bs-toggle="modal" 
                                                           data-bs-target="#viewprofile"
                                                           onclick="showUserInfo('${u.avatar_url}', '${u.name}', '${u.email}', '${u.phone}', '${u.dob}', '${u.role.title}', '${u.created_by}', '${u.created_at}', '${u.update_by}', '${u.update_at}')"
                                                           >
                                                            <i class="uil uil-eye"></i>
                                                        </a>
                                                        <a href="edit-user?id=${u.id}" class="btn btn-icon btn-pills btn-soft-success"><i class="uil uil-pen"></i></a>
                                                        <!--<a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>-->
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->


                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> © LMS. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Group 5 - SE1741</a>.</p>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- Modal start -->
        <!-- Profile Start -->
        <div class="modal fade" id="viewprofile" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1">Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="d-flex align-items-center">
                            <img src="assets/images/client/01.jpg" class="avatar avatar-small rounded-pill" id="info-avatar" alt="">
                            <h5 class="mb-0 ms-3" id="info-name"></h5>
                        </div>
                        <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                            <li class="me-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>Email:</h6>
                                        <p class="text-dark ms-2" id="info-email">lvhn1601@gmail.com</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>Phone:</h6>
                                        <p class="text-dark ms-2" id="info-phone">0965749667</p>
                                    </li>

                                    <li>
                                        <em class="text-muted mb-0" id="info-created-by">Created by Le Vo Hoai Nam</em>
                                        <em class="text-muted" id="info-created-at"> at 2023/09/21 01:14:55.001</em>
                                    </li>
                                </ul>
                            </li>
                            <li class="mb-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>Birthday:</h6>
                                        <p class="text-dark ms-2" id="info-dob">16/01/2003</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>Role:</h6>
                                        <p class="text-dark ms-2" id="info-role">Admin</p>
                                    </li>

                                    <li>
                                        <em class="text-muted mb-0" id="info-update-by">Update by Le Vo Hoai Nam</em>
                                        <em class="text-muted" id="info-update-at"> at 2023/09/23 10:01:42.011</em>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Profile End -->
        <!-- Modal end -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>


    </body>
</html>
