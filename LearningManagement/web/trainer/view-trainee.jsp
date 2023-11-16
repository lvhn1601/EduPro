<%-- Document : add-trainee Created on : Oct 26, 2023, 8:41:26 AM Author : tango --%>

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
                <% 
                    String action =(String) request.getAttribute("action"); 
                    int class_id = (int) request.getAttribute("class_id"); 
                %>

                    <div class="page-wrapper doctris-theme toggled">
                        <jsp:include page="../components/sidebar.jsp" />

                        <!-- Start Page Content -->
                        <main class="page-content bg-light">
                            <jsp:include page="../components/header.jsp" />

                            <div class="container-fluid">
                                <div class="layout-specing">
                                    <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                        <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                            <li class="breadcrumb-item"><a
                                                    href="index.html">${sessionScope.accountCur.role.title}</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Lessons</li>
                                        </ul>
                                    </nav>
                                    <div class="d-md-flex justify-content-between">
                                        <h5 class="mb-0">Trainees Manager</h5>
                                    </div>

                                    <form action="search-trainee" method="GET"
                                        class="d-md-flex justify-content-between mt-4">
                                        <div class="search-bar p-0 d-none d-lg-block ms-2">
                                            <div id="search" class="menu-search mb-0">
                                                <div class="searchform">
                                                    <div>
                                                        <input name="action" type="hidden" value="${action}" />
                                                        <input name="classId" type="hidden" value="${class_id}" />
                                                        <input type="text" class="form-control border rounded-pill"
                                                            name="search" id="s" placeholder="Search..."
                                                            value="${param.search}">
                                                        <input type="submit" id="searchsubmit" value="Search">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2 d-flex justify-content-end" style="height: 40px">
                                            <a href="trainee-export?classId=${class_id}" class="btn btn-primary">Export</a>
                                        </div>
                                    </form>

                                    <div class="row" style="margin: 10px 0; justify-content: center">
                                        <center>
                                            <p style="color: green">${message}</p>
                                            <p style="color: red">${error}</p>
                                        </center>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 mt-4">
                                            <div class="table-responsive shadow rounded">
                                                <table class="table table-center bg-white mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th class="border-bottom p-3" style="min-width: 50px;">ID
                                                            </th>
                                                            <th class="border-bottom p-3" style="min-width: 300px;">
                                                                Student
                                                                Name</th>
                                                            <th class="border-bottom p-3">Email</th>
                                                            <th class="border-bottom p-3">Phone Number</th>
                                                            <th class="border-bottom p-3">Action</th>
                                                            <th class="border-bottom p-3">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${trainees}" var="tr">
                                                            <c:set var="number" value="${number+1}"></c:set>
                                                            <tr>
                                                                <th class="p-3">${tr.id}</th>
                                                                <td class="py-3">
                                                                    <div class="d-flex align-items-center">
                                                                        <span class="ms-2">${tr.name}</span>
                                                                    </div>
                                                                </td>
                                                                <td class="p-3">${tr.email}</td>
                                                                <td class="p-3">${tr.phone}</td>
                                                                <td class="p-3">
                                                                    <input name="action" style="display: none"
                                                                        value="${action}" />
                                                                    <a style="display: ${action eq 'view' ? '' : 'none'}"
                                                                        href="#"
                                                                        onclick="removeTrainee(${tr.id}, ${class_id})"
                                                                        class="">
                                                                        Remove
                                                                    </a>
                                                                    <a style="display: ${action eq 'view' ? 'none' : ''}"
                                                                        href="#"
                                                                        onclick="addTrainee(${tr.id}, ${class_id})"
                                                                        class="">
                                                                        Add to Class
                                                                    </a>
                                                                </td>

                                                                <td class="p-3">
                                                                    <form class="form-check form-switch">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            id="flexSwitchCheckDefault" ${tr.active eq 1
                                                                                ? 'checked' : '' } disabled="">
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div><!--end row-->
                                    <form action="import-trainee" method="POST" id="traineeForm" 
                                        class="d-md-flex justify-content-between mt-4" enctype="multipart/form-data">
                                        <input id="class_id" name="class_id" type="hidden" value="${class_id}" />
                                        <div class="search-bar p-0 d-none d-lg-block ms-2">
                                            <div id="search" class="menu-search mb-0">
                                                <div class="searchform">
                                                    <div>
                                                        <button type="submit" id="submit-btn"
                                                            class="btn btn-primary mt-4">Submit</button>
                                                        <button type="button" id="submit-btn"
                                                            class="btn btn-primary mt-4" onclick="getTemplate()">
                                                            Download template</button>
                                                        <input type="file" name="file" class="btn btn-primary mt-3" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row text-center">
                                        <!-- PAGINATION START -->
                                        <c:set var="cur" value="${param.page eq null ? 1 : param.page}" />
                                        <div class="col-12 mt-4">
                                            <div
                                                class="d-md-flex align-items-center text-center justify-content-between">
                                                <span class="text-muted me-3">Showing ${(cur - 1) * 8 + 1} - ${(cur * 8)
                                                    >
                                                    requestScope.count ? requestScope.count : (cur * 8)} out of
                                                    ${requestScope.count}</span>
                                                <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                                    <li class="page-item"><a class="page-link"
                                                            href="javascript:jumpTo(1)" aria-label="Previous">First</a>
                                                    </li>
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
                                                            href="javascript:jumpTo(${pages})"
                                                            aria-label="Next">Last</a>
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
                                                    <script>document.write(new Date().getFullYear())</script> © LMS.
                                                    Design
                                                    with <i class="mdi mdi-heart text-danger"></i> by <a
                                                        href="../../../index.html" target="_blank"
                                                        class="text-reset">Group
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

                    <!-- javascript -->
                    <script src="../assets/js/bootstrap.bundle.min.js"></script>
                    <!-- simplebar -->
                    <script src="../assets/js/simplebar.min.js"></script>
                    <!-- Icons -->
                    <script src="../assets/js/feather.min.js"></script>
                    <!-- Main Js -->
                    <script src="../assets/js/app.js"></script>

                    <script>
                        function getTemplate() {
                            const servletUrl = "http://localhost:9999/LearningManagement/trainer/import-trainee";
                            const xhr = new XMLHttpRequest();

                            xhr.open("GET", servletUrl);

                            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                            xhr.send();

                            xhr.onload = function() {
                                window.location.href = servletUrl;
                            };
                        }
                        function removeTrainee(trainee_id, class_id) {
                            if(confirm("Are you sure to remove this trainee?")) {
                                fetch("remove-trainee?id="+trainee_id+"&class_id="+class_id)
                                        .then(response => response.text())
                                        .then(data => {
                                            window.location.replace("http://localhost:9999/LearningManagement/trainer/view-trainee?classId="+class_id);
                                        });
                            }
                        };
                        function addTrainee(trainee_id, class_id) {
                            console.log(trainee_id+" "+class_id);
                            fetch("add-trainee-detail?id="+trainee_id+"&classId="+class_id)
                                        .then(response => response.text())
                                        .then(data => {
                                            window.alert(data);
                                        });
                        };
                        function jumpTo(page_num) {
                            let action = "${param.action}";          
                            let search = "${param.search eq null ? '' : param.search}";
                            let class_id = "${param.classId}"
                            if (action == 'view') {
                                location.href = "./view-trainee?page=" + Math.floor(page_num) + ("&search=" + search);
                            } else location.href = "./search-trainee?page=" + Math.floor(page_num) + ("&search=" + search) + ("&classId=" + class_id);

                        };
                    </script>
            </body>

            </html>