<%-- Document : class-trainee.jsp Created on : Oct 25, 2023, 11:17:41 PM Author : tango --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
                <!-- Css -->
                <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
                <!-- Icon Font Stylesheet -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet" />
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
                    <jsp:include page="../components/sidebar.jsp" />

                    <!-- Start Page Content -->
                    <main class="page-content bg-light">
                        <jsp:include page="../components/header.jsp" />

                        <div class="container-fluid">
                            <div class="layout-specing">
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="index.html">Trainer</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Class</li>
                                    </ul>
                                </nav>
                                <div class="d-md-flex justify-content-between">
                                    <h5 class="mb-0">Class Manager</h5>

                                    <form class="d-flex justify-content-between mt-4" method="get"
                                        action="class-trainee" class="d-md-flex justify-content-between mt-4">

                                        <div class="col-sm-12 col-md-3 d-flex align-items-center">
                                            <h6 class="mb-0" style="padding-right: 5px">Subject: </h6>
                                            <div class="mb-0 position-relative w-100">
                                                <select class="form-control time-during select2input" name="subject"
                                                    id="subject" style="background-color: #fff; border-radius: 10px;">
                                                    <option value="" }>All</option>
                                                    <c:forEach items="${subjects}" var="s">
                                                        <option value="${s.name}" ${s.name eq param.subject ? 'selected'
                                                            : '' }>
                                                            ${s.code} - ${s.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-sm-12 col-md-3 d-flex align-items-center">
                                            <h6 class="mb-0" style="padding-right: 5px">Semester: </h6>
                                            <div class="mb-0 position-relative w-100">
                                                <select class="form-control time-during select2input" name="semester"
                                                    id="subject" style="background-color: #fff; border-radius: 10px;">
                                                    <option value="" }>All</option>
                                                    <c:forEach items="${semesters}" var="s">
                                                        <option value="${s.title}" ${s.title eq param.semester
                                                            ? 'selected' : '' }>
                                                            ${s.title}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div><!--end col-->

                                        <div class="search-bar p-0 d-none d-lg-block ms-2">
                                            <div id="search" class="menu-search mb-0">
                                                <div class="searchform">
                                                    <div>
                                                        <input type="text" name="search"
                                                            class="form-control border rounded-pill" id="searchInput"
                                                            placeholder="Search...">
                                                        <input type="submit" id="searchsubmit" value="Search">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>


                                <div class="row">
                                    <div class="col-12 mt-4">
                                        <div class="table-responsive shadow rounded">
                                            <table class="table table-center bg-white mb-0">
                                                <thead>
                                                    <tr>
                                                        <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                                        <th class="border-bottom p-3" style="min-width: 180px;">Class
                                                            Name</th>
                                                        <th class="border-bottom p-3">Subject</th>
                                                        <th class="border-bottom p-3">Semester</th>
                                                        <th class="border-bottom p-3"></th>
                                                        <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${classes}" var="c">
                                                        <tr>
                                                            <th class="p-3">${c.class_id}</th>
                                                            <td class="py-3">
                                                                <div class="d-flex align-items-center">
                                                                    <span class="ms-2">${c.class_name}</span>
                                                                </div>
                                                            </td>
                                                            <td class="p-3">${c.class_subject_name}</td>
                                                            <td class="p-3">${c.class_semester_name}</td>
                                                            <td class="p-3"><a href="view-trainee?classId=${c.class_id}"
                                                                    class="btn btn-primary">View</a></td>
                                                            <td class="p-3"><a href="add-trainee?classId=${c.class_id}"
                                                                    class="btn btn-primary">Add Trainee</a></td>
                                                            <td class="text-end p-3">
                                                                <a href="#"
                                                                    class="btn btn-icon btn-pills btn-soft-primary"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#classDetailModal"
                                                                    data-classId="${c.class_id}"
                                                                    data-className="${c.class_name}"
                                                                    data-classSubject="${c.class_subject_name}"
                                                                    data-classTrainer="${c.class_trainer_name}"
                                                                    data-classSemester="${c.class_semester_name}"
                                                                    data-classStatus="${c.class_status}"
                                                                    data-classStart="${c.class_start}"
                                                                    data-classEnd="${c.class_end}">
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
                                            <span class="text-muted me-3">Showing ${(cur - 1) * 8 + 1} - ${(cur * 8) >
                                                requestScope.count ? requestScope.count : (cur * 8)} out of
                                                ${requestScope.count}</span>
                                            <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                                <li class="page-item"><a class="page-link" href="javascript:jumpTo(1)"
                                                        aria-label="Previous">First</a></li>
                                                <c:forEach
                                                    begin="${cur > 1 ? (cur + 3 > pages ? (pages - 4 < 1 ? 1 : pages - 4) : cur - 1) : 1}"
                                                    end="${cur > 1 ? (cur + 3 > pages ? pages : cur + 3) : (5 > pages ? pages : 5)}"
                                                    var="i">
                                                    <li
                                                        class="page-item ${(param.page == i || (i==1 && param.page==null)) ? 'active' : ''}">
                                                        <a class="page-link" href="javascript:jumpTo(${i})">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item"><a class="page-link"
                                                        href="javascript:jumpTo(${pages})" aria-label="Next">Last</a>
                                                </li>

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
                                            <p class="mb-0 text-muted">
                                                <script>document.write(new Date().getFullYear())</script> © LMS. Design
                                                with <i class="mdi mdi-heart text-danger"></i> by <a
                                                    href="../../../index.html" target="_blank" class="text-reset">Group
                                                    5 - SE1741</a>.
                                            </p>
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


                <!------------------------MODAL UPDATE CLASS DETAIL-------------------------->   
                <%@include file="modal/modal-update-class-information.jsp"%>
                <!-- javascript -->
                <script src="../assets/js/bootstrap.bundle.min.js"></script>
                <!-- simplebar -->
                <script src="../assets/js/simplebar.min.js"></script>
                <!-- Icons -->
                <script src="../assets/js/feather.min.js"></script>
                <!-- Main Js -->
                <script src="../assets/js/app.js"></script>

                <script>
                    const classSelect = document.getElementById("classSelect");
                    const traineeList = document.getElementById("traineeList");

                    classSelect.addEventListener('change', (event) => {
                        // Get the selected class value
                        const selectedClass = event.target.value;
                        console.log(selectedClass);
                        //fetch trainee for the selected class
                        fetchTrainee(selectedClass);
                    });

                    function jumpTo(page_num) {
                        let search = "${param.search eq null ? '' : param.search}";
                        location.href = "./class-trainee?page=" + Math.floor(page_num) + ("&search=" + search);
                    }

                    function updateStatus(element, id) {
                        var isChecked = element.checked;

                        fetch("../admin/updateStatus?table=lesson&id=" + id + "&isChecked=" + isChecked)
                            .then(response => response.text())
                            .then(data => {
                                console.log(data);
                            });
                    }
                </script>
                <script>
                    document.addEventListener('click', function (e) {
                        if (e.target && e.target.dataset.bsToggle === 'modal' && e.target.dataset.bsTarget === '#classDetailModal') {
                            const classId = e.target.dataset.classId;
                            const className = e.target.dataset.className;
                            const classSubject = e.target.dataset.classSubject;
                            const classSemester = e.target.dataset.classSemester;
                            const classTrainer = e.target.dataset.classTrainer;
                            const classStart = e.target.dataset.classStart;
                            const classEnd = e.target.dataset.classEnd;
                            const classStatus = e.target.dataset.classStatus;

                            // Kiểm tra giá trị trước khi gán
                            if (classStart && classEnd) {
                                // Điền thông tin vào các trường input và select
                                document.getElementById('className').value = className;
                                document.getElementById('classSubject').value = classSubject;
                                document.getElementById('classSemester').value = classSemester;
                                document.getElementById('classTrainer').value = classTrainer;
                                document.getElementById('classStart').value = classStart;
                                document.getElementById('classEnd').value = classEnd;

                                if (classStatus === 'active') {
                                    document.getElementById('active').checked = true;
                                    document.getElementById('inactive').checked = false;
                                } else {
                                    document.getElementById('active').checked = false;
                                    document.getElementById('inactive').checked = true;
                                }
                            }
                        }
                    });
                </script>
            </body>

            </html>