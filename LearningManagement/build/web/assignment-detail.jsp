

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment - LMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/img/logo.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
        <!-- Thêm thư viện Bootstrap CSS từ CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Thêm thư viện Bootstrap JavaScript từ CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }

        header {
            background-color: #212529;
            padding: 10px;
        }

        h1 {
            font-size: 24px;
            font-weight: bold;
        }

        main {
            padding: 20px;
        }

        section {
            margin-bottom: 20px;
        }

        /*        h2 {
                    font-size: 20px;
                    font-weight: bold;
                }
                h3 {
                    font-size: 15px;
                    font-weight: bold;
                }*/
        p {
            line-height: 1.5;
        }

        a {
            color: #000;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
        #submit > .mg-b-30 {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        #submit .mg-b-10 {
            flex: 0 0 calc(33.33% - 20px); /* 33.33% là 1/3 chiều rộng của container, trừ 20px (10px cho mỗi bên) để tạo margin */
            padding: 5px;
            margin-right: 10px; /* Thêm margin 10px cho mỗi bên để tạo khoảng cách */
            border-radius: 5px;
            background-color: #f0fbfc;
        }

        .red {
            color: red;
            font-weight: bold;
        }

        .green {
            color: green;
            font-weight: bold;
        }

        .yellow {
            color: black;
            font-weight: bold;
        }

        .black {
            color: black;
        }

        #toast {
            display: none;
            background-color: #333;
            color: white;
            padding: 10px;
            position: fixed;
            bottom: 20px;
            right: 20px;
            border-radius: 5px;
        }



    </style>
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
                                <li class="breadcrumb-item"><a href="index.html">Class</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Assignment</li>
                            </ul>
                        </nav>
                        <section id="assignment">
                            <h2>Assignment</h2>
                            <h3>${asm.lessonId.title}</h3>
                        </section>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <main style="background-color: #fff">
                                        <section id="content">
                                            <h4>Content</h4>
                                            <p>${asm.lessonId.description}</p>
                                            <h6>DUE DATE:  ${asm.dueDate}</h6>
                                        </section>
                                        <div class="mg-b-30"><hr class="MuiDivider-root MuiDivider-fullWidth css-39bbo6"></div>
                                            <c:if test="${sessionScope.accountCur.role.id == 4}">
                                            <div id="submit">
                                                <div class="mg-b-30">
                                                    <div class="mg-b-10 table-responsive shadow rounded">
                                                        <div style="margin-top: 5px">
                                                            <span style="margin: 10px"  title="SUBMISSION STATUS" value="SUBMISSION STATUS" class="top text-lightbold">SUBMISSION STATUS</span>
                                                        </div>
                                                        <div style="margin-top: 5px">
                                                            <span style="margin: 10px" title="${requestScope.msg}" value="${requestScope.msg}" 
                                                                  <c:choose>
                                                                      <c:when test="${requestScope.msg == 'Late'}">
                                                                          class="red"
                                                                      </c:when>
                                                                      <c:when test="${requestScope.msg == 'Submitted'}">
                                                                          class="green"
                                                                      </c:when>
                                                                      <c:when test="${requestScope.msg == 'Missing'}">
                                                                          class="yellow"
                                                                      </c:when>
                                                                      <c:otherwise>
                                                                          class="black"
                                                                      </c:otherwise>
                                                                  </c:choose>
                                                                  >
                                                                ${requestScope.msg}
                                                            </span>
                                                        </div>

                                                    </div>
                                                    <div class="mg-b-10 table-responsive shadow rounded">
                                                        <div style="margin-top: 5px">
                                                            <span style="margin: 10px" title="SUBMISSION TIME" value="SUBMISSION TIME" class="top text-lightbold">SUBMISSION TIME</span>
                                                        </div>
                                                        <div style="margin-top: 5px">
                                                            <span style="margin: 10px" title="2023-11-02 21:00:44 (GMT+07)" value="2023-11-02 21:00:44 (GMT+07)">${asmSub.submitTime}</span>
                                                        </div>
                                                    </div>
                                                    <div class="mg-b-10 table-responsive shadow rounded">
                                                        <div style="margin-top: 5px">
                                                            <span style="margin: 10px" title="LINK/FILE ASSIGNMENT" value="LINK/FILE ASSIGNMENT" class="top text-lightbold">LINK/FILE ASSIGNMENT</span>
                                                        </div>
                                                        <c:if test="${not empty asmSub}">
                                                            <div>
                                                                <button style="margin: 10px" class="btn btn-primary"><a href="download-asm?fileName=${asmSub.submitUrl.substring(10)}" style="color: white;">GET MY FILE</a></button>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <c:if test="${empty asmSub}">
                                                    <button style="margin: 16px 10px 0px 0px" type="button" class="btn btn-primary" onclick="openModal()">SUBMIT ASSIGNMENT</button>
                                                </c:if>

                                                <c:if test="${not empty asmSub}">
                                                    <button style="margin: 16px 10px 0px 0px" type="button" class="btn btn-primary" onclick="openModal()">RESUBMIT</button>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </main>
                                </div>
                            </div>
                        </div><!--end row-->
                        <!--                        <button onclick="showToast()">Hiển thị Toast</button>
                                                <div id="toast" class="hidden">Nội dung toast ở đây</div>-->

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
        <!-- Modal -->
        <div class="modal fade" id="submitAssignmentModal" tabindex="-1" role="dialog" aria-labelledby="submitAssignmentModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form class="modal-content" action="upload-asm" method="post" enctype="multipart/form-data">
                    <input type="text" hidden="" value="${asm.lessonId.id}" name="asmId"/>
                    <input type="text" hidden="" value="${param.classid}" name="classid"/>
                    <input type="text" hidden="" value="${param.subject}" name="subject"/>
                    <input type="text" hidden="" value="${accountCur.id}" name="accId"/>
                    <div class="modal-header">
                        <h5 class="modal-title" id="submitAssignmentModalLabel">SUBMISSION</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Add your assignment submission form here -->


                        <div class="form-group">
                            <label for="assignmentFile">SUBMISSION FILE</label>
                            <input type="file" name="file" class="form-control-file" id="assignmentFile">
                        </div>


                        <br><br>
                        <div>
                            <h6>DUE DATE:  ${asm.dueDate}</h6>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Profile Start -->

        <!-- Profile End -->
        <!-- Modal end -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>


    </body>
    <script>
                                        function showToast() {
                                            var toast = document.getElementById("toast");
                                            toast.style.display = "block";

                                            setTimeout(function () {
                                                toast.style.display = "none";
                                            }, 3000); // 3 giây (thay đổi thời gian hiển thị tùy ý)
                                        }
                                        function openModal() {
                                            var myModal = new bootstrap.Modal(document.getElementById('submitAssignmentModal'));
                                            myModal.show();
                                        }


    </script>
</html>
