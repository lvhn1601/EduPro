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

                        <div class="row justify-content-center">
                            <div class="col-lg-7 mt-4">
                                <div class="accordion-item border shadow rounded">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button border-0 bg-light h5" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <div style="margin-right:200px">${chapter.title}</div>
                                            <c:if test="${sessionScope.accountCur.role.id == 3}">
                                                <a data-bs-toggle="modal"
                                                    data-bs-target="#addLessonModal"
                                                    href="javascript:void(0"
                                                    class="btn btn-primary">Add lesson</a>
                                            </c:if>
                                            

                                        </button>
                                    </h2>

                                    <div id="collapseOne" class="accordion-collapse border-0 collapse show pb-4" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body text-muted">
                                            ${chapter.description}
                                        </div>

                                        <div class="m-3">
                                            <ul class="list-group-flush">
                                                <c:forEach items="${lessons}" var="l">
                                                    <c:if test="${l.type eq 'Video'}">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <a class="d-flex list-group-item border-0" href="#">
                                                                <i class="uil uil-play-circle me-2" style="font-size: 22px"></i>
                                                                <div>
                                                                    <h6 class="m-0">${l.title}</h6>
                                                                    <p class="text-muted small mb-0">${l.type}</p>
                                                                </div>
                                                            </a>
                                                            <c:if test="${l.extra && sessionScope.accountCur.role.id == 3}">
                                                                <div>
                                                                    <a href="#" class="me-4" onclick="confirmDelete(${l.id})">Remove</a>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </c:if>

                                                    <c:if test="${l.type eq 'Quiz'}">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <a class="d-flex list-group-item border-0" href="/LearningManagement/lesson?subject=${param.subject}&classid=${classId}&id=${l.id}">
                                                                <i class="uil uil-question-circle me-2" style="font-size: 22px"></i>
                                                                <div>
                                                                    <h6 class="m-0">${l.title}</h6>
                                                                    <p class="text-muted small mb-0">${l.type}</p>
                                                                </div>
                                                            </a>
                                                            <c:if test="${l.extra && sessionScope.accountCur.role.id == 3}">
                                                                <div>
                                                                    <a href="#" class="me-4" class="me-4" onclick="confirmDelete(${l.id})">Remove</a>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </c:if>

                                                    <c:if test="${l.type eq 'Assignment'}">
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <a class="d-flex list-group-item border-0" href="/LearningManagement/assignment-detail?subject=${param.subject}&classid=${classId}&id=${l.id}">
                                                                <i class="uil uil-file-question-alt me-2" style="font-size: 22px"></i>
                                                                <div>
                                                                    <h6 class="m-0">${l.title}</h6>
                                                                    <p class="text-muted small mb-0">${l.type}</p>
                                                                </div>
                                                            </a>
                                                            <c:if test="${l.extra && sessionScope.accountCur.role.id == 3}">
                                                                <div>
                                                                    <a href="#" class="me-4" class="me-4" onclick="confirmDelete(${l.id})">Remove</a>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 mt-4">
                                <div class="card shadow rounded border-0 py-3">
                                    <div class="m-3">
                                        <div class="d-flex flex-column align-items-center">
                                            <h5 class="text-dark h5">${classData.class_name}</h5>
                                            <p class="text-dark small"><i class="uil uil-meeting-board" style="font-size: 18px"></i> Trainer: ${classData.class_trainer_name}</p>
                                            <p class="text-dark">Start date: ${classData.class_start}</p>
                                            <p class="text-${classData.class_status ? 'success' : 'danger'}">End date: ${classData.class_end} (Class ${classData.class_status ? 'Working' : 'Ended'})</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
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
        <%@include file="modal/modal-add-lesson.jsp"%>
        <!-- javascript -->
        <script src="/LearningManagement/assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="/LearningManagement/assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="/LearningManagement/assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="/LearningManagement/assets/js/app.js"></script>
        <script>
            function confirmDelete(lessonid) {
                if (confirm("Are you sure you want to delete this lesson in this class?"))
                    window.location.href = "/LearningManagement/delete-extra?subject=${param.subject}&classid=${classId}&chapter=${param.chapter == null ? 1 : param.chapter}&lessonid=" + lessonid;
            }
        </script>
    </body>
</html>
