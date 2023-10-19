
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
        <link rel="shortcut icon" href="../assets/img/logo.png">
        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="../assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    </head>
    <style>
        .page-wrapper .sidebar-wrapper {
            z-index: 5;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .tabs {
            display: flex;
            margin-bottom: 20px;
        }

        .tab {
            flex: 1;
            padding: 10px;
            text-align: center;
            background-color: #ddd;
            cursor: pointer;
            border-radius: 4px 4px 0 0;
            transition: background-color 0.2s ease;
        }

        .tab.active {
            background-color: #06BBCC;
            color: #fff;
        }

        .tab:hover {
            background-color: #ccc;
        }

        .tab-content {
            display: none;
            padding: 20px;
            border-radius: 0 0 8px 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .tab-content.active {
            display: block;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .radio-group {
            display: flex;
            align-items: center;
        }

        .radio-group label {
            margin-right: 15px;
        }
        .update-button {
            background-color: #DDDDDD;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .update-button:hover {
            background-color: #06BBCC;
            color: #fff;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #06BBCC;
            color: #fff;
        }

        #dimensionModal.active,
        .overlay.active {
            display: block;
        }
        .chapter-table th:nth-child(1),
        .chapter-table td:nth-child(1) {
            width: 5%;
            text-align: center;/* Đặt chiều rộng của cột id, có thể điều chỉnh tùy ý */
        }

        .chapter-table th:nth-child(4),
        .chapter-table td:nth-child(4) {
            width: 10%;
            text-align: center;/* Đặt chiều rộng của cột action, có thể điều chỉnh tùy ý */
        }

        #subjectDropdownContainer {
            display: inline-block;
            margin-left: 30px;
            margin-top: 10px;
            font-family: 'Arial', sans-serif;
        }

        #subjectDetail {
            font-weight: bold;
            margin-right: 10px;
        }

        #subjectDropdown {
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        #subjectDropdown:hover {
            border-color: #06BBCC;
        }

        .tab.active-tab {
            background-color: #06BBCC; /* Màu nền của tab khi được chọn */
            color: #fff; /* Màu chữ của tab khi được chọn */
        }
    </style>
</head>

<body>

    <div class="page-wrapper doctris-theme toggled">
        <jsp:include page="../components/sidebar.jsp"/>
        <main class="page-content bg-light ">
            <h1 style="margin: 100px 0px 0px 30px">Question List</h1>
            <div id="subjectDropdownContainer" onchange="changeSubject()">
                <select id="subjectDropdown" >
                    <c:forEach items="${requestScope.subjects}" var="s">
                        <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                    <!-- Thêm các môn học khác nếu cần -->
                </select>
            </div>
            <jsp:include page="../components/header.jsp"/>
            <div class="container">

                <!-- General Tab Content -->
                <form id="generalTab" class="tab-content active" action="subject-detail-management?id=${subject.id}" method="post">

                    <form id="generalTabTab" class="tab-content active">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-8">
                                        <h3>Question of ${subject.name}</h3>
                                    </div>
                                    <div class="col-md-4 d-flex justify-content-end" style="height: 40px">
                                        <a href="question-details?action=add" class="btn btn-primary">Add</a>
                                    </div>
                                </div>
                                <table class="chapter-table">

                                    <tr>
                                        <th>ID</th>
                                        <th>Detail</th>
                                        <th>Lesson</th>
                                        <th>Chapter</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>

                                    <tbody>
                                        <c:forEach items="${requestScope.questions}" var="q" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${q.detail}</td>
                                                <td>${q.lesson.title}</td>
                                                <td>${q.chapter.title}</td>
                                                <td>
                                                    <label for="active">
                                                        <input type="radio"  disabled ${q.status eq true ? "checked" : ""}>Active
                                                    </label>
                                                    <label for="inactive">
                                                        <input type="radio" disabled ${q.status eq true ? "" : "checked"}>Inactive
                                                    </label>
                                                </td>
                                                <td>
                                                    <button style=" all: unset; margin-right: 15px"
                                                            type="button"
                                                            onclick="window.location.href = 'question-details?action=update&id=${q.id}'">
                                                        <i class="fa-solid fa-pen-to-square" style="color: #41d3e6;"></i>
                                                    </button>
                                                    <a href="#" onclick="confirmDeleteChapter('${subject.id}', '${c.id}')">
                                                        <i class="fa-solid fa-ban" style="color: #df2a2a;"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </form>
                    <!-- Dimensions Tab Content -->
                </form>
            </div>
        </main>
    </div>

    <!-- Add these links in the <head> section of your HTML -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

    <!-- javascript -->
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <!-- simplebar -->
    <script src="../assets/js/simplebar.min.js"></script>
    <!-- Icons -->
    <script src="../assets/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="../assets/js/app.js"></script>

</body>
<script>
                                                function changeSubject() {
                                                    var selectedSubjectId = document.getElementById('subjectDropdown').value;
                                                    // Lưu giá trị vào localStorage
                                                    console.log();
                                                    localStorage.setItem('selectedSubjectId', selectedSubjectId);

                                                    window.location.href = 'question-detail-management?id=' + selectedSubjectId;
                                                }




                                                window.onload = function () {
                                                    var urlParams = new URLSearchParams(window.location.search);
                                                    var urlSubjectId = urlParams.get('id');

                                                    document.getElementById('subjectDropdown').value = urlSubjectId;

                                                    localStorage.setItem('selectedSubjectId', urlSubjectId);


                                                };
</script>
</html>