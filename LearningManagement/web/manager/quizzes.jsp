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
        <link rel="shortcut icon" href="../assets/img/logo.png">
        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="../assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- jquery -->
        <script src="../assets/js/jquery.min.js"></script>
        <!-- selectize -->
        <script src="../assets/js/selectize.js"></script>
        <link rel="stylesheet" href="../assets/css/selectize.bootstrap5.css">
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    </head>
    <body>
        <!-- Loader -->
<!--        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>-->
        <!-- Loader -->

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
                                <li class="breadcrumb-item active" aria-current="page">Quizzes</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Quizzes Manager</h5>
                        </div>
                                            
                        <form action="quizzes" method="get" class="d-md-flex justify-content-between mt-4">
                            <a href="" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addNew" onclick="showAddNew()"><i class="uil uil-plus"></i> New Quiz</a>

                            <div class="col-sm-12 col-md-2 d-flex align-items-center">
                                <h6 class="mb-0" style="padding-right: 5px">Subject: </h6>
                                <div class="mb-0 position-relative w-100">
                                    <select class="form-control time-during select2input" name="subject" style="background-color: #fff; border-radius: 10px;" onchange="this.form.submit()">
                                        <option value="0"}>All</option>
                                        <c:forEach items="${subjects}" var="s">
                                            <option value="${s.id}" ${s.id eq param.subject ? 'selected' : ''}>${s.code} - ${s.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div><!--end col-->

                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <div class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="search" id="s" placeholder="Search..." value="${param.search}">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                                <th class="border-bottom p-3" style="min-width: 300px;">Quiz title</th>
                                                <th class="border-bottom p-3">Subject</th>
                                                <th class="border-bottom p-3">Chapter</th>
                                                <th class="border-bottom p-3">Type</th>
                                                <th class="border-bottom p-3">Created by</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${quizzes}" var="q">
                                                <tr>
                                                    <th class="p-3">${q.id}</th>
                                                    <td class="py-3">
                                                        <div class="d-flex align-items-center">
                                                            <span class="ms-2">${q.title}</span>
                                                        </div>
                                                    </td>
                                                    <td class="p-3">${q.subject.code}</td>
                                                    <td class="p-3">${q.chapter.title}</td>
                                                    <td class="p-3">${q.type ? "Random" : "Fixed"}</td>
                                                    <td class="p-3">${q.created_by}</td>
                                                    
                                                    <td class="p-3">
                                                        <form class="form-check form-switch">
                                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault ${q.id}" ${q.status ? 'checked' : ''} onchange="updateStatus(this, ${q.id})">
                                                        </form>
                                                    </td>
                                                    
                                                    <td class="text-end p-3">
                                                        <a href="#"
                                                           class="btn btn-icon btn-pills btn-soft-primary"
                                                           data-bs-toggle="modal" data-bs-target="#cfgdetail"
                                                           onclick="showInfo(${q.id}, '${q.title}', '${q.description}', ${q.subject.id}, ${q.chapter.id}, ${q.type}, ${q.status}, ${q.config_by}, '${q.dimension_type}', ${q.num_of_question})"
                                                        >
                                                            <i class="uil uil-edit"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->

                        <div class="row text-center">
                            <!-- PAGINATION START -->
                            <c:set var="cur" value="${param.page eq null ? 1 : param.page}" />
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <span class="text-muted me-3">Showing ${(cur - 1) * 8 + 1} - ${(cur * 8) > requestScope.count ? requestScope.count : (cur * 8)} out of ${requestScope.count}</span>
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <li class="page-item"><a class="page-link" href="javascript:jumpTo(1)" aria-label="Previous">First</a></li>
                                        <c:forEach begin="${cur > 1 ? (cur + 3 > pages ? (pages - 4 < 1 ? 1 : pages - 4) : cur - 1) : 1}" end="${cur > 1 ? (cur + 3 > pages ? pages : cur + 3) : (5 > pages ? pages : 5)}" var="i">
                                            <li class="page-item ${(param.page == i || (i==1 && param.page==null)) ? 'active' : ''}">
                                                <a class="page-link" href="javascript:jumpTo(${i})">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link" href="javascript:jumpTo(${pages})" aria-label="Next">Last</a></li>

                                    </ul>
                                </div>
                            </div><!--end col-->
                            <!-- PAGINATION END -->
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
        <!-- Detail Modal Start -->
        <div class="modal fade" id="cfgdetail" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content" style="height: 80vh">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1">Quiz Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="card border-0 rounded-0 ps-4 pe-4 pt-4 w-50">
                        <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded shadow overflow-hidden bg-light" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link rounded-0 active" id="general-tab" data-bs-toggle="pill" href="#pills-general" role="tab" aria-controls="pills-general" aria-selected="false">
                                    <div class="text-center pt-1 pb-1">
                                        <h4 class="title fw-normal mb-0">General</h4>
                                    </div>
                                </a><!--end nav link-->
                            </li><!--end nav item-->

                            <li class="nav-item">
                                <a class="nav-link rounded-0" id="questions-tab" data-bs-toggle="pill" href="#pills-questions" role="tab" aria-controls="pills-questions" aria-selected="false">
                                    <div class="text-center pt-1 pb-1">
                                        <h4 class="title fw-normal mb-0">Questions</h4>
                                    </div>
                                </a><!--end nav link-->
                            </li><!--end nav item-->
                        </ul><!--end nav pills-->
                    </div>
                    
                    <!--hidden config row to clone-->
                    <!--hidden chapter config-->
                    <div class="row" id="chapter-row" style="display: none">
                        <!--<input type="number" name="id" id="config-id" value="0" style="display: none"/>-->
                        <!--<input type="number" name="quiz" id="quiz-id-c" value="0" style="display: none"/>-->

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Chapter</label>
                                <select name="config-chapter" id="cfChapterSelect" class="form-control form-select department-name select2input bg-white">
                                </select>
                            </div>
                        </div><!--end col-->

                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="form-label">Number of questions</label>
                                <input name="numOfQues" id="numOfQues" type="number" class="form-control" placeholder="Number of question..." required="">
                            </div>
                        </div><!--end col-->
                        <div class="col-md-1 d-flex align-items-center">
                            <a href="#" class="btn btn-icon btn-pills btn-soft-danger" onclick="removeConfig(this.parentNode)"><i class="uil uil-trash-alt"></i></a>
                            <!--<input type="text" name="remove" value="no" style="display: none"/>-->
                        </div><!--end col-->
                    </div>
                    <!--hidden chapter config end-->

                    <!--hidden dimension config-->
                    <div class="row" id="dimension-row" style="display: none">
                        <!--<input type="number" name="id" id="config-id" value="0" style="display: none"/>-->
                        <!--<input type="number" name="quiz" id="quiz-id-c" value="0" style="display: none"/>-->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Dimension</label>
                                <select name="config-dimension" id="dimensionSelect" class="form-control form-select department-name select2input bg-white">
                                </select>
                            </div>
                        </div><!--end col-->

                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="form-label">Number of questions</label>
                                <input name="numOfQues" id="numOfQues" type="number" class="form-control" placeholder="Number of question..." required="">
                            </div>
                        </div><!--end col-->
                        <div class="col-md-1 d-flex align-items-center">
                            <a href="#" class="btn btn-icon btn-pills btn-soft-danger" onclick="removeConfig(this.parentNode)"><i class="uil uil-trash-alt"></i></a>
                            <!--<input type="text" name="remove" value="no" style="display: none"/>-->
                        </div><!--end col-->
                    </div>
                    <!--hidden dimension config end-->
                    <!--hidden config row end-->
                    
                    <div class="modal-body col-12">
                        <div class="card border-0 rounded-0 p-4 pt-0">
                            <form class="tab-content mt-2" id="quizForm" action="quizzes?action=updateQuiz" method="post">
                                <div class="tab-pane fade show active" id="pills-general" role="tabpanel" aria-labelledby="general-tab">
                                    <div class="row align-items-center">
                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h4 class="">General Quiz Details</h4>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                    
                                    <div class="mt-2">
                                        <div class="row">
                                            <input type="number" id="quiz-id" name="id" value="" style="display: none"/>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label d-flex">Quiz Title <p style="color: red">*</p></label>
                                                    <input name="title" id="title" type="text" class="form-control" placeholder="Quiz title..." required="">
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label d-flex">Description</label>
                                                    <textarea name="description" id="description" class="form-control" placeholder="Some Description..." rows="4"></textarea>
                                                </div>
                                            </div><!--end col-->
            
                                            <div class="col-md-6">
                                                <div class="mb-3 w-75">
                                                    <label class="form-label d-flex">Subject <p style="color: red">*</p></label>
                                                    <select name="subject" id="subjectSelect" class="form-control form-select department-name select2input bg-white" disabled="">
                                                        <c:forEach items="${subjects}" var="s">
                                                            <option value="${s.id}">${s.code} - ${s.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div><!--end col-->
            
                                            <div class="col-md-6">
                                                <div class="mb-3 w-75">
                                                    <label class="form-label d-flex">Chapter <p style="color: red">*</p></label>
                                                    <select name="chapter" id="chapterSelect" class="form-control form-select department-name select2input bg-white" onchange="">
                                                        
                                                    </select>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label d-flex">Quiz type <p style="color: red">*</p></label>
                                                    <div class="d-flex ms-4">
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2 quiz-type-random" value="1" checked onchange="switchQuizType(true)">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Random
                                                            </label>
                                                        </div>
                                                        
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2 quiz-type-fixed" value="0" onchange="switchQuizType(false)">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Fixed
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label d-flex">Status <p style="color: red">*</p></label>
                                                    <div class="form-check form-switch ms-4">
                                                        <input class="form-check-input" type="checkbox" name="status" id="flexSwitchCheckChecked quiz-status" value="active" checked="" onchange="statusLabel(this)">
                                                        <label class="form-check-label" id="lblStatus" for="flexSwitchCheckChecked">Active</label>
                                                    </div>
                                                </div>
                                            </div><!--end col-->
                                        </div><!--end row-->
            
<!--                                        <button type="submit" class="btn btn-primary mt-4">Save</button>-->
                                    </div>
                                </div><!--end teb pane-->

                                <div class="tab-pane fade" id="pills-questions" role="tabpanel" aria-labelledby="questions-tab">
                                    <div class="row align-items-center">
                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h4 class="">Question List:</h4>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                    
                                    <div class="tab-content mt-2" id="pills-tabContent">
                                        <div class="tab-pane fade show active" id="tab-random" role="tabpanel">
                                            <div class="row" id="config-row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="form-label d-flex">Config type <p style="color: red">*</p></label>
                                                        <div class="d-flex ms-4">
                                                            <div class="form-check pe-4">
                                                                <input class="form-check-input" type="radio" name="config-type" id="flexRadioDefault2 config-type-chapter" value="0" checked onchange="switchConfigType()">
                                                                <label class="form-check-label" for="flexRadioDefault2">
                                                                    By Chapter
                                                                </label>
                                                            </div>

                                                            <div class="form-check pe-4">
                                                                <input class="form-check-input" type="radio" name="config-type" id="flexRadioDefault2 config-type-dimension" value="1" onchange="switchConfigType()">
                                                                <label class="form-check-label" for="flexRadioDefault2">
                                                                    By Dimension
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-md-3">
                                                    <div class="mb-3">
                                                        <label class="form-label">Total number of questions</label>
                                                        <input name="totalNum" id="totalNum" type="number" class="form-control" placeholder="Number of question..." required="">
                                                    </div>
                                                </div><!--end col-->
                                                
                                                <!--Config type tab-->
                                                <div class="tab-content mt-2 m-4" id="pills-tabContent">
                                                    <!--By Chapter-->
                                                    <div class="tab-pane fade show active" id="tab-chapter" role="tabpanel">
                                                        <h6>Chapter configs list:</h6>
                                                        <div id="chapter-container">
                                                            
                                                        </div>

                                                        <button type="button" class="btn btn-pills btn-light" onclick="addConfig(false)">+ Add chapter config</button>
                                                    </div>
                                                    
                                                    <!--By Dimension-->
                                                    <div class="tab-pane fade show" id="tab-dimension" role="tabpanel">
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label class="form-label">Choose a dimension type:</label>
                                                                <select name="dimensionType" id="dimensionType" class="form-control form-select department-name select2input bg-white" onchange="changeDimensionType()">
                                                                </select>
                                                            </div>
                                                        </div><!--end col-->
                                                        
                                                        <h6>Dimension configs list:</h6>
                                                        <div id="dimension-container">
                                                            
                                                        </div>

                                                        <button type="button" class="btn btn-pills btn-light" onclick="addConfig(true)">+ Add dimension config</button>
                                                    </div>
                                                </div>
                                                <!--Config type tab end-->
                                            </div>
<!--                                            <div class="mt-3">
                                                <button type="button" class="btn btn-primary" onclick="document.getElementById('configForm').submit()">Save</button>
                                            </div>-->
                                        </div>
                                        
                                        <div class="tab-pane fade show" id="tab-fixed" role="tabpanel">
                                            
                                            <div class="table-responsive shadow rounded">
                                                <!--<form id="questionForm" action="quizzes?action=updateQuestions" method="post">-->
                                                    <input type="number" name="quiz" id="quiz-id-q" value="0" style="display: none"/>
                                                    <table class="table table-center bg-white mb-0">
                                                        <thead>
                                                            <tr>
                                                                <th class="border-bottom p-3" style="width: 10px;">#</th>
                                                                <th class="border-bottom p-3" style="min-width: 300px;">Question</th>
                                                                <th class="border-bottom p-3" style="width: 50px;"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="quiz-question-container">
                                                            
                                                        </tbody>
                                                    </table>
                                                <!--</form>-->
                                            </div>
                                            
                                            <div class="p-4">
                                                <div class="d-flex">
                                                    <select class="form-select form-control bg-white" id="questionSelect" placeholder="Select question...">
                                                        
                                                    </select>

                                                    <button class="btn btn-pills btn-soft-primary ms-2" onclick="checkAddQues(this.parentNode)"><i class="uil uil-plus"></i></button>
                                                </div>
                                            </div>
                                            
<!--                                            <div class="mt-3">
                                                <button type="button" class="btn btn-primary" onclick="document.getElementById('questionForm').submit()">Save</button>
                                            </div>-->
                                        </div>
                                    </div>
                                    
                                </div><!--end teb pane-->
                            </form><!--end tab content-->
                        </div>
                    </div><!--end col-->
                    
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-primary" onclick="document.getElementById('quizForm').submit()">Save</button>
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal" aria-label="Close">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Detail Modal End -->
        
        <!-- Add New Modal Start -->
        <div class="modal fade" id="addNew" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content" style="height: 80vh">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1">Add New Quiz</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body col-12">
                        <div class="card border-0 rounded-0 p-4 pt-0">
                            <div class="tab-content mt-2" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-general">
                                    <div class="row align-items-center">
                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h4 class="">General Quiz Details</h4>
                                        </div>
                                    </div>
                                    
                                    <form class="mt-2" action="quizzes?action=addNewGeneral" method="post">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label d-flex">Quiz Title <p style="color: red">*</p></label>
                                                    <input name="title" id="new-title" type="text" class="form-control" placeholder="Quiz title..." required="">
                                                </div>
                                            </div>
            
                                            <div class="col-md-6">
                                                <div class="mb-3 w-75">
                                                    <label class="form-label d-flex">Subject <p style="color: red">*</p></label>
                                                    <select name="subject" id="new-subjectSelect" class="form-control form-select department-name select2input bg-white" onchange="updateListChapters2(this.value)">
                                                        <c:forEach items="${subjects}" var="s">
                                                            <option value="${s.id}">${s.code} - ${s.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
            
                                            <div class="col-md-6">
                                                <div class="mb-3 w-75">
                                                    <label class="form-label d-flex">Chapter <p style="color: red">*</p></label>
                                                    <select name="chapter" id="new-chapterSelect" class="form-control form-select department-name select2input bg-white" onchange="">
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label d-flex">Quiz type <p style="color: red">*</p></label>
                                                    <div class="d-flex ms-4">
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2" value="1" checked>
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Random
                                                            </label>
                                                        </div>
                                                        
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2" value="0">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Fixed
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label d-flex">Status <p style="color: red">*</p></label>
                                                    <div class="form-check form-switch ms-4">
                                                        <input class="form-check-input" type="checkbox" name="status" id="flexSwitchCheckChecked" checked="" onchange="statusLabel(this)">
                                                        <label class="form-check-label" id="lblStatus" for="flexSwitchCheckChecked">Active</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
            
                                        <button type="submit" class="btn btn-primary mt-4">Add</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add New Modal End -->
        <!-- Modal end -->

        <!-- javascript -->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="../assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../assets/js/app.js"></script>

        <script>
            
            function removeConfig(config) {
                config.parentNode.remove();
            }
            
            function removeThis(config) {
                config.lastElementChild.value = "yes";
                let par = config.parentNode;
                par.style.display = "none";
            }
            
            function checkAddQues(par) {
                let sel = par.firstElementChild;
                const id = sel.value;
                const detail = sel.options[sel.selectedIndex].text;
                
                if (id != 0) {
                    addQuizQuestion(id, detail, 'new');
                }
            }
            
            function changeDimensionType() {
                if (confirm('Change Dimension Type will delete all current config! You still want to change?')) {
                    document.getElementById('dimension-container').innerHTML = "";
                    updateListDimensions();
                }
            }
            
            async function showInfo(id, title, description, subject, chapter, type, status, config_by, dimension_type, num_of_question) {
                document.getElementById('quiz-id').value = id;
                document.getElementById('title').value = title;
                document.getElementById('description').value = description;
                document.getElementById('subjectSelect').value = subject;
                
                await updateDatas(dimension_type);
                document.getElementById('chapterSelect').value = chapter;
                if (type) {
                    document.getElementById('flexRadioDefault2 quiz-type-random').checked = true;
                    document.getElementById('flexRadioDefault2 quiz-type-fixed').checked = false;
                    switchQuizType();
                } else {
                    document.getElementById('flexRadioDefault2 quiz-type-random').checked = false;
                    document.getElementById('flexRadioDefault2 quiz-type-fixed').checked = true;
                    switchQuizType();
                }
                if (status)
                    document.getElementById('flexSwitchCheckChecked quiz-status').checked = true;
                else
                    document.getElementById('flexSwitchCheckChecked quiz-status').checked = false;
                
                if (!config_by) {
                    document.getElementById('flexRadioDefault2 config-type-chapter').checked = true;
                    document.getElementById('flexRadioDefault2 config-type-dimension').checked = false;
                    switchConfigType();
                } else {
                    document.getElementById('flexRadioDefault2 config-type-chapter').checked = false;
                    document.getElementById('flexRadioDefault2 config-type-dimension').checked = true;
                    switchConfigType();
                }
                
                document.getElementById('dimensionType').value = dimension_type;
                document.getElementById('totalNum').value = num_of_question;
                
                //document.getElementById('quiz-id-c').value = id;
                document.getElementById('quiz-id-q').value = id;
//                console.log(id);
                getListConfig(id);
                getListQuizQuestion(id);
            }
            
            async function updateDatas(dtype) {
                let sid = document.getElementById('subjectSelect').value;
                //let qid = document.getElementById('quiz-id').value;
                
                //getListConfig(qid);
                //getListQuizQuestion(qid);
                await updateDimensionTypes(sid);
                await updateListChapters(sid);
                await updateListDimensions(dtype);
                await updateListQuestions(sid);
            }
            
            async function updateDimensionTypes(sid) {
                let dtSel = document.getElementById('dimensionType');
                
                dtSel.innerHTML = "";
                
                await fetch('getDatas?table=dimension-type&subject=' + sid)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            var option = document.createElement("option");
                            option.value = item;
                            option.text = item;
                            dtSel.appendChild(option);
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            async function updateListChapters(sid) {
                let chapterSelect = document.getElementById('chapterSelect');
                let cfChapterSelects = document.querySelectorAll('#cfChapterSelect');
                
                chapterSelect.innerHTML = "";
                cfChapterSelects.forEach(sel => {
                    sel.innerHTML = "";
                });
                
                await fetch('getDatas?table=chapter&subject=' + sid)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            var option = document.createElement("option");
                            option.value = item.id;
                            option.text = item.title;
                            chapterSelect.appendChild(option);
                            cfChapterSelects.forEach(sel => {
                                var option = document.createElement("option");
                                option.value = item.id;
                                option.text = item.title;
                                sel.appendChild(option);
                            });
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            async function updateListDimensions(dtype) {
                let sid = document.getElementById('subjectSelect').value;
                let ds = document.querySelectorAll('#dimensionSelect');
                if (dtype == null)
                    dtype = document.getElementById('dimensionType').value;
                
                ds.forEach(sel => {
                    sel.innerHTML = "";
                });
                
                await fetch('getDatas?table=dimension&subject=' + sid + '&dimension-type=' + dtype)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        listDimension = data;
                        data.forEach(item => {
                            ds.forEach(sel => {
                                var option = document.createElement("option");
                                option.value = item.id;
                                option.text = item.name;
                                sel.appendChild(option);
                            });
                        });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            async function updateListQuestions(sid) {
                let quesSel = document.getElementById('questionSelect');
                
                quesSel.innerHTML = "";
                
                var option = document.createElement("option");
                option.value = "";
                option.text = "Choose question...";
                quesSel.appendChild(option);
                
                await fetch('getDatas?table=question&subject=' + sid)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            var option = document.createElement("option");
                            option.value = item.id;
                            option.text = item.detail;
                            quesSel.appendChild(option);
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
                
                $('#questionSelect').selectize({
                    sortField: 'text'
                });
            }
            
            function getListConfig(quiz_id) {
                document.getElementById('chapter-container').innerHTML = "";
                document.getElementById('dimension-container').innerHTML = "";
                fetch('getDatas?table=config&quiz=' + quiz_id)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            setConfig(item.type, item.dimension.id, item.chapter.id, item.num_of_question);
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            function addConfig(type) {
                let cfgRow = document.getElementById((type ? 'dimension' : 'chapter') + '-row');
                let newRow = cfgRow.cloneNode(true);
                newRow.style.display = 'flex';
        
                const container = document.getElementById((type ? 'dimension' : 'chapter') + '-container');
                container.appendChild(newRow);
            }
            
            function setConfig(type, dimension, chapter, num_of_ques) {
                addConfig(type);
//                let listID = document.querySelectorAll('#config-id');
//                let idbox = listID[listID.length-1];
//                idbox.value = id;
                
                if (type) {
                    let listDS = document.querySelectorAll('#dimensionSelect');
                    let dise = listDS[listDS.length-1];
                    dise.value = dimension;
                } else {
                    let listCh = document.querySelectorAll('#cfChapterSelect');
                    let chse = listCh[listCh.length-1];
                    chse.value = chapter;
                }
                
                let listNOQ = document.querySelectorAll('#numOfQues');
                let noq = listNOQ[listNOQ.length-1];
                noq.value = num_of_ques;
            }
            
            function getListQuizQuestion(quiz_id) {
                document.getElementById('quiz-question-container').innerHTML = "";
                fetch('getDatas?table=quiz-question&quiz=' + quiz_id)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            addQuizQuestion(item.id, item.detail, 'old');
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            function addQuizQuestion(id, detail, status) {
                const newRow = document.createElement('tr');
                newRow.innerHTML = `
                    <th class="p-3">` + id + `</th>
                    <td class="py-3">
                        <div class="d-flex align-items-center">
                            <input type="hidden" name="question-id" value="` + id + `"/>
                            <input type="hidden" name="status" value="` + status + `"/>
                            <span class="ms-2">` + detail + `</span>
                        </div>
                    </td>

                    <td class="text-end p-3">
                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger" onclick="removeThis(this.parentNode)"><i class="uil uil-trash-alt"></i></a>
                        <input type="hidden" name="remove" value="no"/>
                    </td>
                `;
        
                const container = document.getElementById("quiz-question-container");
                container.appendChild(newRow);
            }
            
            function statusLabel(checkbox) {
                let label = document.getElementById("lblStatus");
                if (checkbox.checked)
                    label.innerHTML = "Active";
                else
                    label.innerHTML = "Inactive";
            }
            
            function switchQuizType() {
                let type = document.getElementById('flexRadioDefault2 quiz-type-random').checked;
                
                const tabRandom = document.getElementById('tab-random');
                const tabFixed = document.getElementById('tab-fixed');
                
                if (type) {
                    tabRandom.classList.add("active");
                    tabFixed.classList.remove("active");
                } else {
                    tabFixed.classList.add("active");
                    tabRandom.classList.remove("active");
                }
            }
            
            function switchConfigType() {
                let type = document.getElementById('flexRadioDefault2 config-type-chapter').checked;
                
                const tabChapter = document.getElementById('tab-chapter');
                const tabDimension = document.getElementById('tab-dimension');
                
                if (type) {
                    tabChapter.classList.add("active");
                    tabDimension.classList.remove("active");
                } else {
                    tabDimension.classList.add("active");
                    tabChapter.classList.remove("active");
                }
            }
            
            // Javascript for modal addNew start
            // show Modal Add new
            function showAddNew() {
                let sid = document.getElementById('new-subjectSelect').value;
                updateListChapters2(sid);
            }
            
            // updateListChapters for Add New Modal
            function updateListChapters2(sid) {
                let chapterSelect = document.getElementById('new-chapterSelect');
                
                chapterSelect.innerHTML = "";
                
                fetch('getDatas?table=chapter&subject=' + sid)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            var option = document.createElement("option");
                            option.value = item.id;
                            option.text = item.title;
                            chapterSelect.appendChild(option);
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            // Javascript for modal addNew end
            
            function jumpTo(page_num) {
                let search = "${param.search eq null ? '' : param.search}";
                let subject = ${param.subject eq null ? 0 : param.subject};
                location.href = "./quizzes?page=" + Math.floor(page_num) + (search == "" ? "" : "&search=" + search) + (subject == 0 ? "" : "&subject=" + subject);
            }
            
            function updateStatus(element, id) {
                var isChecked = element.checked;
                
                fetch("../admin/updateStatus?table=quiz&id=" + id + "&isChecked=" + isChecked)
                        .then(response => response.text())
                        .then(data => {
                            console.log(data);
                        });
            }
            
            updateDatas(null);
            switchQuizType();
        </script>
    </body>
</html>
