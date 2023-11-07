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
        <!-- jquery -->
        <script src="/LearningManagement/assets/js/jquery.min.js"></script>
        <!-- selectize -->
        <script src="/LearningManagement/assets/js/selectize.js"></script>
        <link rel="stylesheet" href="/LearningManagement/assets/css/selectize.bootstrap5.css">
        <!--Datatable-->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"/>
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
        <style>
            .dataTables_filter {
                display: none;
            }
        </style>
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
                                <li class="breadcrumb-item active" aria-current="page">Quizzes</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Quizzes Manager</h5>
                        </div>

                        <div class="d-md-flex justify-content-between mt-4">
                            <a href="" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newPracticeQuiz"><i class="uil uil-plus"></i> New Quiz</a>

                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <div class="searchform">
                                        <input type="text" class="form-control border rounded-pill" name="search" id="searchBox" placeholder="Search...">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between" id="filter-container">

                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive rounded">
                                    <table class="table table-center rounded bg-white mb-0" id="quizzes-table">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                                <th class="border-bottom p-3" style="min-width: 300px;">Practice Quiz</th>
                                                <th class="border-bottom p-3">Question Group</th>
                                                <th class="border-bottom p-3">Question Source</th>
                                                <th class="border-bottom p-3"># Questions</th>
                                                <th class="border-bottom p-3">Spent Time</th>
                                                <th class="border-bottom p-3">Result</th>
                                                <th class="border-bottom p-3">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${quizzes}" var="q" varStatus="loop">
                                                <tr>
                                                    <th class="p-3">${loop.index + 1}</th>
                                                    <td class="py-3">
                                                        <div class="d-flex align-items-center">
                                                            <span class="ms-2">${q.title}</span>
                                                        </div>
                                                    </td>
                                                    <td class="p-3">${q.config_by ? 'Chapter' : 'Dimension'}</td>
                                                    <td class="p-3">${q.dimension_type}</td>
                                                    <td class="p-3">${q.num_of_question}</td>
                                                    <td class="p-3"></td>
                                                    <td class="p-3"></td>

                                                    <td class="p-3">
                                                        <a href="#" class="text-info">Take</a>
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
        <!-- Detail Modal Start -->
        <div class="modal fade" id="newPracticeQuiz" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content" style="height: 80vh">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!--hidden config row to clone-->
                    <!--hidden chapter config-->
                    <div class="row" id="chapter-row" style="display: none">

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Chapter</label>
                                <select name="config-chapter" id="cfChapterSelect" class="form-control form-select department-name select2input bg-white">
                                    <c:forEach items="${chapters}" var="c">
                                        <option value="${c.id}">${c.title}</option>
                                    </c:forEach>
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
                        </div><!--end col-->
                    </div>
                    <!--hidden chapter config end-->

                    <!--hidden dimension config-->
                    <div class="row" id="dimension-row" style="display: none">
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
                        </div><!--end col-->
                    </div>
                    <!--hidden dimension config end-->
                    <!--hidden config row end-->

                    <div class="modal-body col-12">
                        <div class="card border-0 rounded-0 p-4 pt-0">
                            <form class="tab-content mt-2" id="practicequizForm" action="practice-quizzes?classid=${param.classid}" method="post">
                                <div class="tab-pane fade show active" id="pills-general" role="tabpanel" aria-labelledby="general-tab">
                                    <div class="row align-items-center">
                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h4 class="">New Practice Quiz</h4>
                                        </div><!--end col-->
                                    </div><!--end row-->

                                    <div class="mt-2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label d-flex">Quiz Title <p style="color: red">*</p></label>
                                                    <input name="title" id="title" type="text" class="form-control" placeholder="Quiz title..." required="">
                                                </div>
                                            </div><!--end col-->

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
                                                                <c:forEach items="${dimensionTypes}" var="dt">
                                                                    <option value="${dt}">${dt}</option>
                                                                </c:forEach>
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
                                    </div>
                                </div><!--end teb pane-->

                                
                            </form><!--end tab content-->
                        </div>
                    </div><!--end col-->

                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-primary" onclick="document.getElementById('practicequizForm').submit()">Save</button>
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal" aria-label="Close">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Detail Modal End -->
        <!-- Modal end -->

        <!-- javascript -->
        <script src="/LearningManagement/assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="/LearningManagement/assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="/LearningManagement/assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="/LearningManagement/assets/js/app.js"></script>


        <script>
            //$('#quizzes-table').dataTable();
            let fContainer = document.getElementById('filter-container');
            let table = new DataTable('#quizzes-table', {
                scrollX: false,
                //searching: false,
                lengthChange: false
            });

            const searchBox = document.getElementById('searchBox');

            searchBox.addEventListener('keyup', () => {
                table.column(1).search(searchBox.value, false, true).draw();
            });

            function removeConfig(config) {
                config.parentNode.remove();
            }

            function checkAddQues(par) {
                let sel = par.firstElementChild;
                const id = sel.value;
                const detail = sel.options[sel.selectedIndex].text;

                if (id != 0) {
                    addQuizQuestion(id, detail);
                }
            }

            function changeDimensionType() {
                if (confirm('Change Dimension Type will delete all current config! You still want to change?')) {
                    document.getElementById('dimension-container').innerHTML = "";
                    updateListDimensions();
                }
            }
            
            let dt = document.getElementById("dimensionType");
            updateListDimensions(dt.value);
            
            function updateListDimensions(dtype) {
                let ds = document.querySelectorAll('#dimensionSelect');
                if (dtype == null)
                    dtype = document.getElementById('dimensionType').value;
                
                ds.forEach(sel => {
                    sel.innerHTML = "";
                });
                
                fetch('manager/getDatas?table=dimension&subject=${subjectId}&dimension-type=' + dtype)
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

            function addConfig(type) {
                let cfgRow = document.getElementById((type ? 'dimension' : 'chapter') + '-row');
                let newRow = cfgRow.cloneNode(true);
                newRow.style.display = 'flex';

                const container = document.getElementById((type ? 'dimension' : 'chapter') + '-container');
                container.appendChild(newRow);
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
        </script>
    </body>
</html>
