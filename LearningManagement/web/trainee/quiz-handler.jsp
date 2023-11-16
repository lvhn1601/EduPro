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
            <c:if test="${param.action != 'take'}">
                <jsp:include page="../components/sidebar.jsp"/>
            </c:if>

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="../components/header.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="#">${sessionScope.accountCur.role.title}</a></li>
                                <li class="breadcrumb-item"><a href="lesson?classid=${param.classid}&id=${lid}">Quiz Lesson</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${param.action} Quiz</li>
                            </ul>
                        </nav>
                            
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">${param.action eq 'take' ? 'Quiz Handling' : 'Quiz Reviewing'}</h5>
                        </div>
                                
                        <div class="row justify-content-center">
                            <div class="col-lg-10 mt-4">
                                <div class="card shadow rounded border-0">
                                    <div class="card-body ps-5 pe-5">
                                        <div class="mb-2">
                                            <p class="text-secondary mb-0">Question ${param.qnum} of ${numOfQues}:</p>
                                            <h4>${question.detail}</h4>
                                            <p class="mb-0">Choose ${correctNum}:</p>
                                        </div>
                                        <table class="mb-3">
                                            <c:forEach items="${question.answers}" var="a">
                                                <tr>
                                                    <td class="p-3" style="max-width: 50px">
                                                        <input class="form-check-input" type="checkbox" id="flexCheckChecked" ${a.choose && param.action == 'review' ? 'checked' : ''} ${a.choose ? 'checked' : ''} onclick="updateChoice(this, ${a.id})" ${param.action == 'review' ? 'disabled' : ''}>
                                                    </td>
                                                    <td class="p-3">
                                                        <p class="mb-0 ${a.correct && param.action == 'review' ? 'text-success' : (a.choose && param.action == 'review' ? 'text-danger' : '')}" style="font-size: large">
                                                            ${!a.correct && a.choose && param.action == 'review' ? '<del>' : ''}${a.detail}${!a.correct && a.choose && param.action == 'review' ? '</del>' : ''}
                                                        </p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        
                                    </div>
                                </div>
                                <div class="card shadow rounded border-0 mt-4">
                                    <div class="card-body ps-5 pe-5">
                                        <div class="">
                                            <h5>Questions:</h5>
                                            <div>
                                                <c:forEach begin="1" end="${numOfQues}" var="i">
                                                    <a href="quiz?action=${param.action}&id=${param.id}&qnum=${i}&subject=${param.subject}&classid=${param.classid}" class="btn btn-icon btn-soft-primary m-1 ${param.qnum == i ? 'active' : ''}">${i}</a>
                                                </c:forEach>
                                            </div>
                                            
                                            <div class="mt-4" id="timer" style="font-weight: 500">Time left: <span id="minutes">00</span>:<span id="seconds">00</span></div>
                                            
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${param.action eq 'take'}">
                                    <div class="mt-4 d-flex justify-content-end me-4">
                                        <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#submitModal" class="btn btn-primary"> Submit </a>
                                    </div>
                                </c:if>
                            </div><!--end col-->
                        </div>
                        
                    </div>
                </div><!--end container-->
                
                <!--Submit Modal-->
                <div class="modal fade" id="submitModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-bottom p-3">
                                <h5 class="modal-title" id="exampleModalLabel">Submit Quiz</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>You are about to submit your quiz...</p>
                                <p>One you press the Submit button you cannot return to your quiz</p>
                            </div>
                            <form class="modal-footer" id="quizSubmit" action="quiz?classid=${param.classid}&id=${param.id}" method="post">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Save & Submit</button>
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
        <c:if test="${param.action == 'take'}">
            <script>
                function updateChoice(element, id) {
                    var isChecked = element.checked;

                    fetch("updateAnswer?id=${param.id}&qid=${question.id}&aid=" + id + "&isChecked=" + isChecked)
                            .then(response => response.text())
                            .then(data => {
                                console.log(data);
                            });
                }

                // Set the duration in seconds
                var duration = ${timeleft};

                // Function to update the timer
                function updateTimer() {
                    var minutesElement = document.getElementById("minutes");
                    var secondsElement = document.getElementById("seconds");

                    var minutes = Math.floor(duration / 60);
                    var seconds = duration % 60;

                    minutesElement.textContent = (minutes < 10 ? '0' : '') + minutes;
                    secondsElement.textContent = (seconds < 10 ? '0' : '') + seconds;

                    if (duration <= 0) {
                        clearInterval(timerInterval);
                        document.getElementById('quizSubmit').submit();
                    } else {
                        duration--;
                    }
                }

                // Initial call to set the timer
                updateTimer();

                // Update the timer every second
                var timerInterval = setInterval(updateTimer, 1000);
            </script>
        </c:if>
    </body>
</html>
