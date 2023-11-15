<%-- 
    Document   : users
    Created on : Sep 18, 2023, 3:11:42 PM
    Author     : lvhn1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Questions Manager - Manager</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="/LearningManagement/assets/img/logo.png">
        <!-- Bootstrap -->
        <link href="/LearningManagement/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="/LearningManagement/assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="/LearningManagement/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="/LearningManagement/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="/LearningManagement/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>

        <style>
            .random-gradient {
                height: 200px;
                display: inline-block;
                border: 1px solid #ccc;
                transition: background 0.5s ease;
            }
        </style>
    </head>
    <body>

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="components/sidebar.jsp"/>

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="components/header.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">${sessionScope.accountCur.role.title}</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Subjects List</h5>
                        </div>

                        <div class="row">
                            <c:forEach items="${subjects}" var="s">
                                <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                                    <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                        <div class="random-gradient"></div>
                                        <div class="card-body p-4">
                                            <a href="/LearningManagement/class-dashboard?subject=${s.id}" class="text-dark title h5">${s.code}_${s.name}</a>
                                            <ul class="list-unstyled mb-2 mt-3">
                                                <li class="text-muted small"><i class="uil uil-users-alt text-dark h6 me-1"></i>Number of classes: ${s.countClass}</li>
                                            </ul>
                                            <div class="post-meta d-flex justify-content-end">
                                                <a href="/LearningManagement/class-dashboard?subject=${s.id}" class="link">Go to class <i class="mdi mdi-chevron-right align-middle"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
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

        <!-- javascript -->
        <script src="/LearningManagement/assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="/LearningManagement/assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="/LearningManagement/assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="/LearningManagement/assets/js/app.js"></script>

        <script>
            // Function to generate a random hex color
            function getRandomColor() {
                const letters = '0123456789ABCDEF';
                let color = '#';
                for (let i = 0; i < 6; i++) {
                    color += letters[Math.floor(Math.random() * 16)];
                }
                return color;
            }

            // Apply random colors to the div elements
            document.addEventListener("DOMContentLoaded", function () {
                const divs = document.querySelectorAll('.random-gradient');
                divs.forEach(function (div) {
                    div.style.background = `linear-gradient(to right, ` + getRandomColor() + `, ` + getRandomColor() + `)`;
                });
            });
        </script>
    </body>
</html>
