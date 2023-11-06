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
            <jsp:include page="../components/sidebar.jsp"/>

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="../components/header.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">${sessionScope.accountCur.role.title}</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Quiz Lesson</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Quiz Lesson</h5>
                        </div>
                                
                        <div class="row justify-content-center">
                            <div class="col-lg-8 mt-4">
                                <div class="card shadow rounded border-0">
                                    <div class="card-body d-flex flex-column align-items-center">
                                        <h3 class="card-title mt-4">${lesson.title}</h3>
                                        <p class="text-black-50">${lesson.description}</p>
                                        <h5 class="text-dark">Number of Attempt Allowed: ${lesson.maxAttempt}</h5>
                                        <h5 class="text-dark">Values to Pass: ${lesson.passValue}%</h5>
                                        <h5 class="text-dark">Time limit: ${lesson.duration} mins</h5>
                                        
                                        <c:if test="${results[0] != null}">
                                            <div class="col-11 mt-4">
                                                <div class="table-responsive shadow rounded">
                                                    <table class="table table-center bg-white mb-0">
                                                        <thead>
                                                            <tr>
                                                                <th class="border-bottom p-3" style="max-width: 60px;">Attempt</th>
                                                                <th class="border-bottom p-3" style="min-width: 100px;">State</th>
                                                                <th class="border-bottom p-3" style="min-width: 100px;">Submitted at</th>
                                                                <th class="border-bottom p-3">Mark</th>
                                                                <th class="border-bottom p-3">Review</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${results}" var="r" varStatus="loop">
                                                                <tr>
                                                                    <td class="p-3">${loop.index + 1}</td>
                                                                    <td class="p-3"><span class="badge rounded-md bg-${r.score >= lesson.passValue ? 'success' : 'danger'}"> ${r.status ? (r.score >= lesson.passValue ? "Finished" : "Not Pass") : "Not Submitted"} </span></td>
                                                                    <td class="p-3">${r.submit_at}</td>
                                                                    <td class="p-3">${r.score}</td>
                                                                    <td class="p-3"><a href="quiz?action=review&id=${r.id}&qnum=1" class="text-info">Review</a></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </c:if>
                                        
                                        <div class="mb-4 mt-5">
                                            <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#attemptModal" class="btn btn-soft-${results.size() >= lesson.maxAttempt ? 'secondary disabled' : 'primary'}">${results.size() > 0 ? 'RE-ATTEMPT QUIZ' : 'ATTEMPT QUIZ NOW'} </a>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div><!--end col-->
                        </div>
                    </div>
                </div><!--end container-->
                
                <!--Attempt Modal-->
                <div class="modal fade" id="attemptModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-bottom p-3">
                                <h5 class="modal-title" id="exampleModalLabel">Attempt Quiz</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                The quiz has a time limit of ${lesson.duration} minutes. Time will count down from the moment you start your attempt and you must submit before it expires. Are you sure that you wish to start now?
                            </div>
                            <form class="modal-footer" action="lesson?type=quiz&id=${lesson.id}" method="post">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Start Attempt</button>
                            </form>
                        </div>
                    </div>
                </div>

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
    </body>
</html>
