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
            <jsp:include page="../admin/components/sidebar.jsp"/>

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="../admin/components/header.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item">${sessionScope.accountCur.role.title}</li>
                                <li class="breadcrumb-item"><a href="lessons">Lesson</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${param.action eq 'new' ? 'Add New' : 'Details'}</li>
                            </ul>
                        </nav>
                        
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">${param.action eq 'new' ? 'Add New Lesson' : 'Lesson Details'}</h5>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <div class="row align-items-center">
                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h4 class="">Lesson Details</h4>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                    
                                    <form class="mt-4" action="lesson-details?action=${param.action}" method="post" onsubmit="return checkEmpty();">
                                        <input type="number" name="lesson-id" value="${lesson.id}" style="display: none"/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Subject:</label>
                                                    <select name="subject" id="subject" class="form-control department-name select2input bg-white" onchange="updateDatas(this.value)" ${param.action eq 'update' ? 'disabled' : ''}>
                                                        <c:forEach items="${subjects}" var="s">
                                                            <option value="${s.id}" ${lesson.subject.id eq s.id ? 'selected' : ''}>${s.code} - ${s.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Chapter:</label>
                                                    <select name="chapter" id="chapter" class="form-control department-name select2input bg-white" ${param.action eq 'update' ? 'disabled' : ''}>
                                                        <option value="0">Chapter 1</option>
                                                    </select>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Title:</label>
                                                    <input name="title" id="title" type="text" class="form-control" placeholder="Lesson title..." value="${lesson.title}">
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Lesson Type:</label>
                                                    <div class="d-flex ms-4">
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2 type-video" value="Video" checked ${lesson.type eq 'Video' ? 'checked' : ''} onchange="switchLessonType()">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Video
                                                            </label>
                                                        </div>
                                                        
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2" value="Quiz" ${lesson.type eq 'Quiz' ? 'checked' : ''} onchange="switchLessonType()">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Quiz
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Status</label>
                                                    <div class="form-check form-switch ms-4">
                                                        <input class="form-check-input" type="checkbox" name="status" id="flexSwitchCheckChecked quiz-status" value="true" ${lesson.status ? 'checked' : ''} onchange="statusLabel(this)">
                                                        <label class="form-check-label" id="lblStatus" for="flexSwitchCheckChecked">${lesson.status ? 'Published' : 'Unpublished'}</label>
                                                    </div>
                                                </div>
                                            </div><!--end col-->
                                        </div><!--end row-->
                                        
                                        <div class="tab-content mt-2 m-4" id="pills-tabContent">
                                            <!--video tab start-->
                                            <div class="tab-pane fade show active" id="tab-video" role="tabpanel">
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Video link:</label>
                                                        <input name="video" id="video" type="text" class="form-control" placeholder="https://www.youtube.com/..." value="${lesson.video_link}">
                                                    </div>
                                                </div><!--end col-->
                                                
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Description:</label>
                                                        <textarea name="description" id="description" class="form-control" placeholder="Description" rows="5">${lesson.description}</textarea>
                                                    </div>
                                                </div><!--end col-->
                                            </div>
                                            <!--video tab end-->
                                            
                                            <!--quiz tab start-->
                                            <div class="tab-pane fade show" id="tab-quiz" role="tabpanel">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Parent Quiz:</label>
                                                            <select name="quiz" id="quiz" class="form-control department-name select2input bg-white">
                                                                
                                                            </select>
                                                        </div>
                                                    </div><!--end col-->

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Duration:</label>
                                                            <select name="duration" class="form-control department-name select2input bg-white">
                                                                <option value="90" ${lesson.duration == 90 ? 'selected' : ''}>90 mins</option>
                                                                <option value="60" ${lesson.duration == 60 ? 'selected' : ''}>60 mins</option>
                                                                <option value="45" ${lesson.duration == 45 ? 'selected' : ''}>45 mins</option>
                                                                <option value="30" ${lesson.duration == 30 ? 'selected' : ''}>30 mins</option>
                                                                <option value="15" ${lesson.duration == 15 ? 'selected' : ''}>15 mins</option>
                                                            </select>
                                                        </div>
                                                    </div><!--end col-->

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Value to Pass:</label>
                                                            <input name="pass-val" id="pass-val" type="number" class="form-control" value="${lesson.passValue}">
                                                        </div>
                                                    </div><!--end col-->

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Max. Attempt:</label>
                                                            <input name="max-attempt" id="max-attempt" type="number" class="form-control" value="${lesson.maxAttempt}">
                                                        </div>
                                                    </div><!--end col-->
                                                </div>
                                            </div>
                                            <!--quiz tab end-->
                                        </div>
                                        
                                        <div id="error-mess" style="color: red">${error}</div>
            
                                        <button type="submit" id="submit-btn" class="btn btn-primary mt-4">${param.action eq 'add' ? 'Add' : 'Save'}</button>
                                    </form>
                                </div>
                            </div><!--end col-->
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

        <!-- javascript -->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="../assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../assets/js/app.js"></script>
        
        <script>
            let subid = document.getElementById('subject').value;
            updateDatas(subid);
            switchLessonType();
            
            function updateDatas(sid) {
                updateListChapters(sid);
                updateListQuizzes(sid);
            }
            
            function updateListChapters(sid) {
                let chapterSelect = document.getElementById('chapter');
                
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
                            option.selected = (item.id == ${lesson.chapter.id eq null ? 0 : lesson.chapter.id});
                            chapterSelect.appendChild(option);
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            function updateListQuizzes(sid) {
                let quizSelect = document.getElementById('quiz');
                
                quizSelect.innerHTML = "";
                
                fetch('getDatas?table=quiz&subject=' + sid)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            var option = document.createElement("option");
                            option.value = item.id;
                            option.text = item.title;
                            option.selected = (item.id == ${lesson.quiz.id eq null ? 0 : lesson.quiz.id});
                            quizSelect.appendChild(option);
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            function switchLessonType() {
                let type = document.getElementById('flexRadioDefault2 type-video').checked;
                
                let tabVideo = document.getElementById('tab-video');
                let tabQuiz = document.getElementById('tab-quiz');
                
                if (type) {
                    tabVideo.classList.add("active");
                    tabQuiz.classList.remove("active");
                } else {
                    tabQuiz.classList.add("active");
                    tabVideo.classList.remove("active");
                }
            }
            
            function statusLabel(checkbox) {
                let label = document.getElementById("lblStatus");
                if (checkbox.checked)
                    label.innerHTML = "Published";
                else
                    label.innerHTML = "Unpublished";
            }
            
            const title_box = document.getElementById('title');
            const video_check = document.getElementById('flexRadioDefault2 type-video');
            const error_text = document.getElementById('error-mess');
            
            function checkEmpty() {
                let title = title_box.value;
                let video = video_check.checked;
                
                if (title.trim() == '') {
                    error_text.textContent = "You must input Title!";
                    return false;
                }
                
                if (video) {
                    let video_link = document.getElementById('video').value;
                    
                    if (video_link.trim() == '') {
                        error_text.textContent = "You must input video link for lesson!";
                        return false;
                    }
                }
                
                error_text.textContent = "";
                return true;
            }
        </script>
    </body>
</html>
