

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
                                <li class="breadcrumb-item">${sessionScope.accountCur.role.title}</li>
                                <li class="breadcrumb-item"><a href="question-detail-management">Questions</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${param.action eq 'new' ? 'Add New' : 'Details'}</li>
                            </ul>
                        </nav>
                        
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">${param.action eq 'new' ? 'Add New Question' : 'Question Details'}</h5>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <div class="row align-items-center">
                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h4 class="">Question Details</h4>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                    
                                    <form class="mt-4" id="questionForm" action="question-details?action=${param.action}" method="post" onsubmit="return checkEmpty();">
                                        <input type="hidden" name="id" value="${question.id}"/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Subject:</label>
                                                    <select name="subject" id="subject" class="form-control department-name select2input bg-white" onchange="updateDatas(this.value)" ${param.action eq 'update' ? 'disabled' : ''}>
                                                        <option value="0">Choose Subject...</option>
                                                        <c:forEach items="${subjects}" var="s">
                                                            <option value="${s.id}" ${question.subject.id eq s.id ? 'selected' : ''}>${s.code} - ${s.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Chapter:</label>
                                                    <select name="chapter" id="chapter" class="form-control department-name select2input bg-white" onchange="updateListLessons(document.getElementById('chapter').value)" ${param.action eq 'update' ? 'disabled' : ''}>
                                                        <c:forEach items="${chapters}" var="c">
                                                            <option value="${c.id}">${c.title}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Lesson:</label>
                                                    <select name="lesson" id="lesson" class="form-control department-name select2input bg-white" ${param.action eq 'update' ? 'disabled' : ''}>
                                                        <option value="0">Lesson 1</option>
                                                    </select>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Dimension:</label>
                                                    <select name="dimension" id="dimension" class="form-control department-name select2input bg-white">
                                                        
                                                    </select>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Question:</label>
                                                    <textarea name="detail" id="detail" class="form-control" placeholder="Enter your question..." rows="3" required="true">${question.detail}</textarea >
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Status:</label>
                                                    <div class="d-flex ms-4">
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="status" id="flexRadioDefault2" value="true" ${question.status ? 'checked' : ''} checked>
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Active
                                                            </label>
                                                        </div>
                                                        
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="status" id="flexRadioDefault2" ${question.status ? '' : 'checked'} value="false"} >
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Inactive
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!--end col-->
                                            
                                            <div class="col-md-8">
                                                <div class="mb-3" id="answer-container">
                                                    <label class="form-label">List Answers:</label>
                                                    <c:forEach items="${question.answers}" var="a">
                                                        <div>
                                                            <div class="d-flex align-items-center mx-4 mb-3">
                                                                <input type="hidden" name="answer-id" value="${a.id}"/>
                                                                <input name="answer-correct" class="answer-hidden" type="hidden" value="${a.correct ? 'true' : 'false'}">
                                                                <input onclick="setcorrectVal(this, this.parentNode)" type="checkbox" class="form-check-input mt-0" ${a.correct ? 'checked' : ''}>
                                                                <input name="answer-detail" id="answer" type="text" class="form-control mx-4" placeholder="Answer..." value="${a.detail}">
                                                                <a href="#" class="btn btn-icon btn-pills btn-soft-danger" onclick="removeAnswer(this.parentNode);"><i class="uil uil-trash-alt"></i></a>
                                                                <input type="hidden" name="answer-remove" value="no"/>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                
                                                <button type="button" class="btn btn-pills btn-light" onclick="addAnswer()">+ Add Answer</button>
                                            </div><!--end col-->
                                        </div><!--end row-->
                                        
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
            function setcorrectVal(cb, par) {
                const hid = par.querySelector(".answer-hidden");
                hid.value = cb.checked ? "true" : "false";
            }
            
            const form = document.getElementById('questionForm');
            form.addEventListener('submit', () => {
                listCb = document.querySelectorAll("#answer-correct");
                listCb.forEach(item => {
                    if (item.checked) {
                        item.value = "true";
                    } else {
                        item.value = "false";
                    }
                });
            });
            
            function removeAnswer(box) {
                box.parentNode.style.display = 'none';
                box.lastElementChild.value = "yes";
            }
            
            let subid = document.getElementById('subject').value;
            updateDatas(subid);
            
            async function updateDatas(sid) {
                await updateListChapters(sid);
                updateListDimensions(sid);
                let cid = document.getElementById('chapter').value;
                updateListLessons(cid);
            }
            
            async function updateListChapters(sid) {
                let chapterSelect = document.getElementById('chapter');
                
                chapterSelect.innerHTML = "";
                
                var optionDef = document.createElement("option");
                optionDef.value = 0;
                optionDef.text = "Choose chapter...";
                chapterSelect.appendChild(optionDef);
                
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
                            option.selected = (item.id == ${question.chapter.id eq null ? 0 : question.chapter.id});
                            chapterSelect.appendChild(option);
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            
            
            function updateListLessons(cid) {
                let lessonSelect = document.getElementById('lesson');
                
                lessonSelect.innerHTML = "";
                
                var def = document.createElement("option");
                def.value = 0;
                def.text = "Choose Lesson...";
                lessonSelect.appendChild(def);
                
                fetch('getDatas?table=lesson&chapter=' + cid)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            var option = document.createElement("option");
                            option.value = item.id;
                            option.text = item.title;
                            option.selected = (item.id == ${question.lesson.id eq null ? 0 : question.lesson.id});
                            lessonSelect.appendChild(option);
                    });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            function updateListDimensions(sid) {
                console.log('update');
                let ds = document.getElementById('dimension');
                
                ds.innerHTML = "";
                
                var def = document.createElement("option");
                def.value = "0";
                def.text = "Dimension...";
                ds.appendChild(def);
                
                fetch('getDatas?table=dimension&subject=' + sid)
                    .then(response => {
                        if (response.ok)
                            return response.json();
                })
                    .then(data => {
                        data.forEach(item => {
                            var option = document.createElement("option");
                            option.value = item.id;
                            option.text = item.name;
                            option.selected = (item.id == ${question.dimensions[0].id eq null ? 0 : question.dimensions[0].id});
                            ds.appendChild(option);
                        });
                })
                    .catch(error => {
                        console.log('Error: ' + error);
                });
            }
            
            const ansContainer = document.getElementById('answer-container');
            function addAnswer() {
                const newRow = document.createElement('div');
                newRow.innerHTML = `
                    <div class="d-flex align-items-center mx-4 mb-3">
                        <input type="hidden" name="answer-id" value="0"/>
                        <input name="answer-correct" class="answer-hidden" type="hidden" value="false">
                        <input onclick="setcorrectVal(this, this.parentNode)" type="checkbox" class="form-check-input mt-0">
                        <input name="answer-detail" id="answer" type="text" class="form-control mx-4" placeholder="Answer...">
                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger" onclick="removeAnswer(this.parentNode);"><i class="uil uil-trash-alt"></i></a>
                        <input type="hidden" name="answer-remove" value="no"/>
                    </div>
                `;
        
                ansContainer.appendChild(newRow);
            }
            
            const subjectSel = document.getElementById("subject");
            const chapterSel = document.getElementById("chapter");
            const lessonSel = document.getElementById("lesson");
            const dimensionSel = document.getElementById("dimension");
            const detailTxt = document.getElementById("detail");
            
            const errorText = document.getElementById("error-mess");
            
            function checkEmpty() {
                // Check input Subject
                if (subjectSel.value == 0) {
                    errorText.textContent = "You must choose subject!";
                    return false;
                }
                
                // Check input Chapter
                if (chapterSel.value == 0) {
                    errorText.textContent = "You must choose chapter!";
                    return false;
                }
                
                // Check input Lesson
                if (lessonSel.value == 0) {
                    errorText.textContent = "You must choose lesson!";
                    return false;
                }
                
                // Check input Dimension
                if (dimensionSel.value == 0) {
                    errorText.textContent = "You must choose at least 1 dimension!";
                    return false;
                }
                
                // Check input Question detail
                if (detailTxt.value.trim() == '') {
                    errorText.textContent = "Detail of question can not be empty!";
                    return false;
                }
                
                // Check all question detail
                let answers = document.querySelectorAll("#answer");
                var check = true;
                var count = 0;
                answers.forEach(item => {
                    var par = item.parentNode;
                    if (par.parentNode.style.display != 'none') {
                        if (item.value.trim() == '') {
                            errorText.textContent = "Answer detail can not be empty!";
                            check = false;
                        } else {
                            count++;
                        }
                    }
                });
                
                if (!check)
                    return check;
                
                // Check correct answer (must be at least 1 correct answer)
                let corrects = document.querySelectorAll(".answer-hidden");
                var corCount = 0;
                corrects.forEach(item => {
                    var par = item.parentNode;
                    if (par.parentNode.style.display != 'none' && item.value == 'true') {
                        corCount++;
                    }
                });
                
                if (corCount < 1) {
                    errorText.textContent = "Please choose at least 1 correct answer";
                    return false;
                }
                
                // Check number of answers (must be at least 2 answer)
                if (count < 2) {
                    errorText.textContent = "You must add at least 2 answer!";
                    return false;
                }
                
                return true;
            }
            
            
//            const title_box = document.getElementById('title');
//            const video_check = document.getElementById('flexRadioDefault2 type-video');
//            const error_text = document.getElementById('error-mess');
//            
//            function checkEmpty() {
//                let title = title_box.value;
//                let video = video_check.checked;
//                
//                if (title.trim() == '') {
//                    error_text.textContent = "You must input Title!";
//                    return false;
//                }
//                
//                if (video) {
//                    let video_link = document.getElementById('video').value;
//                    
//                    if (video_link.trim() == '') {
//                        error_text.textContent = "You must input video link for lesson!";
//                        return false;
//                    }
//                }
//                
//                error_text.textContent = "";
//                return true;
//            }
        </script>
    </body>
</html>
