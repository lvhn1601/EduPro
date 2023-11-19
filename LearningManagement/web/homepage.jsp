<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>EduPro - Online Learning</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="keywords" />
        <meta content="" name="description" />
        <link rel="shortcut icon" href="assets/img/—Pngtree—blue open book_4426437.png">

        <!-- favicon -->
        <link rel="shortcut icon" href="../assets/img/logo.png">
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
                <!-- Carousel Start -->
                <div class="container-fluid p-0 mb-5">
                    <div class="owl-carousel header-carousel position-relative">
                        <div class="owl-carousel-item position-relative">
                            <img class="img-fluid" src="assets/img/sanhAlpha.png" alt="" />
                            <div
                                class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
                                style="background: rgba(24, 29, 56, 0.7)"
                                >
                                <div class="container">
                                    <div class="row justify-content-start">
                                        <div class="col-sm-10 col-lg-8">
                                            <h5
                                                class="text-primary text-uppercase mb-3 animated slideInDown"
                                                >
                                                EduPro
                                            </h5>
                                            <h1 class="display-3 text-white animated slideInDown">
                                                Exchanging between Students and Lecturers
                                            </h1>
                                            <p class="fs-5 text-white mb-4 pb-2">
                                                The website serves the convenience needs of Lecturers and
                                                Students
                                            </p>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="owl-carousel-item position-relative">
                            <img class="img-fluid" src="assets/img/sanhAlpha2.png" alt="" />
                            <div
                                class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
                                style="background: rgba(24, 29, 56, 0.7)"
                                >
                                <div class="container">
                                    <div class="row justify-content-start">
                                        <div class="col-sm-10 col-lg-8">
                                            <h5
                                                class="text-primary text-uppercase mb-3 animated slideInDown"
                                                >
                                                EduPro
                                            </h5>
                                            <h1 class="display-3 text-white animated slideInDown">
                                                Learnning everything from everywhere
                                            </h1>
                                            <p class="fs-5 text-white mb-4 pb-2">
                                                Learnning knowledge whether you are at school or anywhere
                                                else
                                            </p>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Carousel End -->

                <!-- Service Start -->
                <div id="service" class="container-xxl py-5">
                    <div class="container">
                        <div class="row g-4">
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="service-item text-center pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-graduation-cap text-primary mb-4"></i>
                                        <h5 class="mb-3">Skilled Lecturers</h5>
                                        <p>
                                            All are teachers with 10 years or more experience, lecturers,
                                            masters from prestigious universities across the
                                            country.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                                <div class="service-item text-center pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-globe text-primary mb-4"></i>
                                        <h5 class="mb-3">Online Classes</h5>
                                        <p>
                                            Online classes are arranged by the school with no more than 20
                                            students to ensure instructors stay as close to students as
                                            possible.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                                <div class="service-item text-center pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-home text-primary mb-4"></i>
                                        <h5 class="mb-3">Learning Time</h5>
                                        <p>
                                            Online classes are arranged by the school with no more than 20
                                            students to ensure instructors stay as close to students as
                                            possible.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                                <div class="service-item text-center pt-3">
                                    <div class="p-4">
                                        <i class="fa fa-3x fa-book-open text-primary mb-4"></i>
                                        <h5 class="mb-3">Online Documents</h5>
                                        <p>
                                            Materials and exercises are selected by the school and
                                            lecturers to suit the subject the student is studying and
                                            wants to learn about other subjects.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Service End -->
         

               
                <%@include file="components/footer.jsp" %>
                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"
                   ><i class="bi bi-arrow-up"></i
                    ></a>
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
                
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="assets/lib/wow/wow.min.js"></script>
        <script src="assets/lib/easing/easing.min.js"></script>
        <script src="assets/lib/waypoints/waypoints.min.js"></script>
        <script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="assets/js/main.js"></script>

        
    </body>
</html>
