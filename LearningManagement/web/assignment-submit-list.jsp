

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
    </head>
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
                                <li class="breadcrumb-item"><a href="assignment">Assignment</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Submission</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Submission of ${asm.lessonId.title}</h5>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" >#</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">NAME</th>
                                                <th class="border-bottom p-3">SUBMIT TIME</th>
                                                <th class="border-bottom p-3">SCORE</th>
                                                <th class="border-bottom p-3">Grade</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.data}" var="asmSub" varStatus="loop">
                                                <tr>
                                                    <td class="p-3">${loop.index + 1}</td>
                                                    <td class="p-3">${asmSub.submitterId.name}</td>
                                                    <td class="p-3">${asmSub.submitTime}</td>
                                                    <td class="p-3">
                                                        ${asmSub.submitScore}
                                                    </td>
                                                    <td class=" p-3">
                                                        <a href="#"
                                                           class="btn btn-icon btn-pills btn-soft-primary" 
                                                           data-bs-toggle="modal" 
                                                           data-bs-target="#viewprofile"
                                                           onclick="showUserInfo('${asmSub.submitUrl}', '${asmSub.submitterId.id}', '${asmSub.lessonId.id}', '${asmSub.submitScore}')"
                                                           >
                                                            <i class="uil uil-eye"></i>
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
                                        <li class="page-item"><a class="page-link" href="javascript:jumpTo(1,${requestScope.asmId},${param.classId},${param.subject})" aria-label="Previous">First</a></li>
                                            <c:forEach begin="${cur > 1 ? (cur + 3 > pages ? (pages - 4 < 1 ? 1 : pages - 4) : cur - 1) : 1}" end="${cur > 1 ? (cur + 3 > pages ? pages : cur + 3) : (5 > pages ? pages : 5)}" var="i">
                                            <li class="page-item ${(param.page == i || (i==1 && param.page==null)) ? 'active' : ''}">
                                                <a class="page-link" href="javascript:jumpTo(${i},${requestScope.asmId},${param.classId},${param.subject})">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link" href="javascript:jumpTo(${pages},${requestScope.asmId},${param.classId},${param.subject})" aria-label="Next">Last</a></li>

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
        <!-- Profile Start -->
        <div class="modal fade" id="viewprofile" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1">Submission</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4" style="padding-top: 0px">
                        <div class="d-flex align-items-center">

                            <h5 class="mb-0 ms-3" id="info-name"></h5>
                        </div>
                        <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                            <li class="me-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex" style="display: flex;">
                                        <form action="assignment-submit" method="post">
                                            <input type="text" hidden="" value="${param.classId}" name="classId"/>
                                            <input type="text" hidden="" value="${param.subject}" name="subject"/>
                                            <input id="asmId" hidden="" value="" name="asmId"/>
                                            <input id="accId" hidden="" value="" name="accId"/>
                                            <h6 style="font-size: 1rem; margin-right: 0.5rem;">Score:</h6>
                                            <input name="score" type="number" id="scoreInput" step="0.1" min="0" max="10" style="border: 1px solid #ced4da; border-radius: 0.25rem; width: 100px; padding: 0.375rem 0.75rem; font-size: 1rem; line-height: 1.5;">

                                            <button style="border: none;border-radius: 5px" type="submit">Ok</button>
                                        </form>
                                    </li>
                                    <br><!-- comment -->
                                    <li class="d-flex">
                                        <h6>File name:</h6>
                                        <p class="text-dark ms-2" id="info-email"></p>
                                    </li>
                                    <br>
                                    <li class="d-flex">
                                        <button style=" border-radius: 5px" class="btn-info"><a href="download-asm?fileName=" style="color: white;">Get file</a></button>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
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

        <script>
                                        function jumpTo(page_num, asmId, subject, classId) {
                                            location.href = "./assignment-submit?subject="+subject+"&classId="+classId+"&id=" + asmId + "&page=" + Math.floor(page_num);
                                        }
                                        function showUserInfo(fileName, submitterId, asmId, score) {
                                            console.log(fileName);

                                            // Lấy 9 ký tự đầu tiên của fileName
                                            var newFileName = fileName.substr(9);

                                            // Đặt giá trị của href
                                            var downloadLink = document.querySelector('.btn-info a');
                                            downloadLink.href = "download-asm?fileName=" + newFileName;

                                            // Hiển thị tên file trong phần "File name"
                                            var infoEmail = document.getElementById("info-email");
                                            infoEmail.textContent = newFileName;

                                            // Gán giá trị asmId cho phần tử asmId
                                            var asmIdInput = document.getElementById("asmId");
                                            asmIdInput.value = asmId;

                                            // Gán giá trị submitterId cho phần tử accId
                                            var accIdInput = document.getElementById("accId");
                                            accIdInput.value = submitterId;

                                            // Gán giá trị điểm cho phần tử scoreInput
                                            var modalScoreElement = document.getElementById("scoreInput");
                                            modalScoreElement.value = score;
                                        }

                                        var modalScoreElement = document.getElementById("scoreInput");

                                        modalScoreElement.addEventListener("input", function () {
                                            var score = parseFloat(this.value);

                                            if (isNaN(score) || score < 0) {
                                                this.value = "0";
                                            } else if (score > 10) {
                                                this.value = "10";
                                            }
                                        });



        </script>
    </body>
</html>
