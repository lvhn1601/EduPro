

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
        <link rel="shortcut icon" href="../assets/img/logo.png">
        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="../assets/css simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../components/sidebar.jsp"/>
            <main class="page-content bg-light">
                <jsp:include page="../components/header.jsp"/>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item">${sessionScope.accountCur.role.title}</li>
                                <li class="breadcrumb-item"><a href="lessons">Class</a></li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Assignment & Quizzes</h5>
                        </div>
                        <ul class="nav nav-tabs" id="myTabs">
                            <li class="nav-item">
                                <a class="nav-link active" id="assignmentDetailTab" data-toggle="tab" href="#assignmentDetail" role="tab" aria-controls="assignmentDetail" aria-selected="true">Assignment</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="quizzDetailTab" data-toggle="tab" href="#quizzDetail" role="tab" aria-controls="quizzDetail" aria-selected="false">Quizzes</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="assignmentDetail" role="tabpanel" aria-labelledby="assignmentDetailTab">
                                <div class="row">
                                    <div class="col-lg-12 mt-2">
                                        <div class="card border-0 p-4 rounded shadow">
                                            <div class="row align-items-center">
                                                <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                    <h4 class="">Assignments Submitted</h4>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 mt-4">
                                                    <div class="table-responsive shadow rounded">  
                                                        <div class="col-12 mt-4">
                                                            <div class="table-responsive shadow rounded">
                                                                <table id="example" class="display" style="width:100%">
                                                                    <thead>
                                                                        <tr>
                                                                           <th class="border-bottom p-3">Lesson </th>
                                                                            <th class="border-bottom p-3" style="min-width: 180px;">Assignment Title</th>
                                                                            <th class="border-bottom p-3">Submit at</th>
                                                                            
                                                                            <th class="border-bottom p-3">Scores</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:forEach items="${requestScope.listAssignmentSubmitted}" var="c">
                                                                            <tr>
                                                                              <td class="p-3">${c.lessonId.id}</td>
                                                                                <td class="p-3">${c.lessonId.title}</td>
                                                                                <td class="p-3">${c.submitTime}</td>
                                                                                <c:if test="${c.submitScore != '0.0'}">
                                                                                <td class="p-3 text-success">${c.submitScore}</td>
                                                                                </c:if>
                                                                                <c:if test="${c.submitScore == '0.0'}">
                                                                                <td  class="p-3 text-danger">Not grade</td>
                                                                                </c:if>

                                                                            </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="quizzDetail" role="tabpanel" aria-labelledby="quizzDetailTab">
                                <div class="row">
                                    <div class="col-lg-12 mt-2">
                                        <div class="card border-0 p-4 rounded shadow">
                                            <div class="row align-items-center">
                                                <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                    <h4 class="">Quizzes Submitted</h4>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 mt-4">
                                                    <div class="table-responsive shadow rounded">       
                                                        <div class="col-12 mt-4">
                                                            <div class="table-responsive shadow rounded">
                                                                <table id="example2" class="display" style="width:100%">
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th class="border-bottom p-3" style="min-width: 180px;">Quizzes Title</th>
                                                                            <th class="border-bottom p-3">Submit at</th>
                                                                            <th class="border-bottom p-3">Scores</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:forEach items="${requestScope.listQuizzSubmitted}" var="d">
                                                                            <tr>
                                                                         
                                                                                <td class="p-3">${d.lesson.title}</td>
                                                                                <td class="p-3">${d.submit_at}</td>
                                                                                <c:if test="${d.score != '0.0'}">
                                                                                <td class="p-3 text-success">${d.score}</td>
                                                                                </c:if>
                                                                                <c:if test="${d.score == '0.0'}">
                                                                                    <td class="p-3 text-danger" >not grade</td>
                                                                                </c:if>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <!--Datatable-->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"/>

        <script>
            new DataTable('#example');
             new DataTable('#example2');
        </script>
        <script>
            $(document).ready(function () {
                $("#assignmentDetailTab").on('click', function (e) {
                    e.preventDefault();
                    $("#quizzDetail").removeClass("show active");
                    $("#quizzDetailTab").removeClass("active");
                    $("#assignmentDetail").addClass("show active");
                    $("#assignmentDetailTab").addClass("active");
                });

                $("#quizzDetailTab").on('click', function (e) {
                    e.preventDefault();
                    $("#assignmentDetail").removeClass("show active");
                    $("#assignmentDetailTab").removeClass("active");
                    $("#quizzDetail").addClass("show active");
                    $("#quizzDetailTab").addClass("active");
                });
            });
        </script>
    </body>
</html>

