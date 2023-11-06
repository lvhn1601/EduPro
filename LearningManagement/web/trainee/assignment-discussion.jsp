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
        <script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>
    </head>
    <body>

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
                            <h5 class="mb-0">Assignment Discussion</h5>
                        </div>
                        <h3>Topic: ${requestScope.asm.lessonId.title}</h3>
                        <div class="shadow-lg p-3 mb-2 bg-body-tertiary rounded">
                            <h3>Content</h3>
                            <div>
                                ${requestScope.asm.lessonId.description}
                            </div>
                        </div>
                        <div class="shadow-lg p-3 mb-5 bg-body-tertiary rounded">
                            <div id="commentContent"></div>
                            <form action="assignment-discussion" method="post">
                                <input type="hidden" name="accountId" value="${sessionScope.accountCur.id}"/>
                                <input type="hidden" name="lessonId" value="${requestScope.asm.lessonId.id}"/>
                                <input type="hidden" id="commentValue" name="commentValue"/>
                                <button onclick="editRecruitment()" class="btn- btn-primary mt-2">Submit</button>
                            </form>
                        </div>
                       <c:forEach items="${requestScope.listAssignmentDiscussion}" var="c">
                            <div class="shadow-lg p-3 mb-5 bg-body-tertiary rounded">
                                <div class="d-flex">
                                    <img width="50" height="50" class="rounded-circle" src="${c.account.avatar_url}" alt="alt"/>
                                    <div class="ms-2">
                                        <h5 class="m-0">${c.account.name}</h5>
                                        <span>${c.createAt}</span>
                                    </div>
                                </div>
                                <hr>
                                <div>${c.commentValue}</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </main>
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
                                    let commentContent;
                                    ClassicEditor
                                            .create(document.querySelector('#commentContent'))
                                            .then(newEditor => {
                                                commentContent = newEditor;
                                            })
                                            .catch(error => {
                                                console.error(error);
                                            });
                                    function editRecruitment() {
                                        let data = commentContent.getData();
                                        document.getElementById("commentValue").value = data;
                                    }
    </script>

</body>
</html>
