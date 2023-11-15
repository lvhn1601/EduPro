
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject - Manager</title>
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
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
        <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
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
        <main class="page-content bg-light "style="width: 100%;
              height: 100%;">                
            <h1 style="margin: 100px 0px 0px 30px">Subject detail</h1>
            <div id="subjectDropdownContainer" onchange="changeSubject()">
                <select id="subjectDropdown" >
                    <c:forEach items="${requestScope.subjects}" var="s">
                        <option value="${s.id}">${s.code}</option>
                    </c:forEach>
                    <!-- Thêm các môn học khác nếu cần -->
                </select>
            </div>
            <jsp:include page="../components/header.jsp"/>
            <div class="container">
                <div class="tabs">
                    <div class="tab" onclick="openTab('generalTab')">General</div>
                    <div class="tab" onclick="openTab('chapterTab')">Chapter</div>
                    <div class="tab" onclick="openTab('dimensionsTab')">Dimensions</div>
                </div>

                <!-- General Tab Content -->
                <form id="generalTab" class="tab-content active" action="subject-detail-management?id=${subject.id}" method="post">

                    <div class="row">

                        <div class="col-md-4">
                            <label for="code">Subject Code</label>
                            <input id="code" type="text" placeholder="${subject.code}" disabled/>
                        </div>
                        <div class="col-md-8">
                            <label for="subject">Subject Name</label>
                            <input id="subject" type="text" placeholder="${subject.name}" disabled/>
                        </div>
                        <div class="col-md-12">
                            <label for="manager">Manager</label>
                            <input id="manager" type="text"  placeholder="${subject.manager.name}" disabled=""/>
                        </div>
                        <div class="col-md-6">
                            <label>Status</label>
                            <div class="radio-group">
                                <input type="text" id="active" name="status" value="${subject.status eq true ? "Active" : "Inactive"}" disabled >
                            </div>
                        </div>

                    </div>

                </form>
                <!-- Chapter Tab Content -->

                <form id="chapterTab" class="tab-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-8">
                                    <h3>Chapters of ${subject.name}</h3>
                                </div>
                                <div class="col-md-4 d-flex justify-content-end" style="height: 40px">
                                    <button type="button" class="btn btn-primary" onclick="openAddModal(${subject.id}); event.preventDefault();">Add</button>
                                </div>
                            </div>
                            <table class="chapter-table">
                                <tr>
                                    <th style="width: 3%; text-align: center;">ID</th>
                                    <th style="width: 20%;text-align: center;">Title</th>
                                    <th style="width: 25%;text-align: center;">Description</th>
                                    <th style="width: 10%;text-align: center;">Status</th>
                                    <th style="width: 5%;text-align: center;">Action</th>
                                </tr>
                                <tbody>
                                    <c:forEach items="${requestScope.chapters}" var="c" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${c.title}</td>
                                            <td>${c.description}</td>
                                            <td>
                                                ${c.status eq true ? "Active" : "Inactive"} 
<!--                                                <form class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" ${c.status == true ? 'checked' : ''} onchange="updateStatus(this,${u.id})">
                                                </form>-->
                                            </td>
                                            <td style="text-align: center;">
                                                <button style=" all: unset;"
                                                        onclick="openModal('${subject.id}', '${c.id}', '${c.status}', '${c.title}', '${c.description}'); event.preventDefault();">
                                                    <i class="fa-solid fa-pen-to-square" style="color: #41d3e6;"></i>
                                                </button>
<!--                                                <a href="#" onclick="confirmDeleteChapter('${subject.id}', '${c.id}')">
                                                    <i class="fa-solid fa-ban" style="color: #df2a2a;"></i>
                                                </a>-->
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
                <!-- Dimensions Tab Content -->
                <form id="dimensionsTab" class="tab-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-8">
                                    <h3>Dimensions of ${subject.name}</h3>
                                </div>
                                <div class="col-md-4 d-flex justify-content-end" style="height: 40px">
                                    <button type="button" class="btn btn-primary" onclick="openAddModalx(${subject.id}); event.preventDefault();">Add</button>
                                </div>
                            </div>
                            <table class="chapter-table">

                                <tr>
                                    <th style="width: 3%; text-align: center;">ID</th>
                                    <th style="width: 10%;text-align: center;">Type</th>
                                    <th style="width: 25%;text-align: center;">Name</th>
                                    <th style="width: 25%;text-align: center;">Description</th>
                                    <th style="width: 15%;text-align: center;">Status</th>
                                    <th style="width: 5%;text-align: center;">Action</th>
                                </tr>

                                <tbody>
                                    <c:forEach items="${requestScope.dimensions}" var="d" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${d.type}</td>
                                            <td>${d.name}</td>
                                            <td style="text-align: left;">${d.description}</td>
                                            <td style="text-align: center;">
                                                ${d.status eq true ? "Active" : "Inactive"} 
<!--                                                <label for="active">
                                                    <input type="radio"  disabled ${d.status eq true ? "checked" : ""}>Active
                                                </label>
                                                <label for="inactive">
                                                    <input type="radio" disabled ${d.status eq true ? "" : "checked"}>Inactive
                                                </label>-->
                                            </td>
                                            <td style="text-align: center;">
                                                <button style=" all: unset;  "
                                                        onclick="openModalx('${subject.id}', '${d.id}', '${d.status}', '${d.type}', '${d.name}', '${d.description}'); event.preventDefault();">
                                                    <i class="fa-solid fa-pen-to-square" style="color: #41d3e6;"></i>
                                                </button>
<!--                                                <a href="#" onclick="confirmDeleteDimension('${subject.id}', '${d.id}')">
                                                    <i class="fa-solid fa-ban" style="color: #df2a2a;"></i>
                                                </a>-->
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
    <%@include file="../modal/modal-update-subject-detail.jsp" %>
    <%@include file="../modal/modal-add-subject-detail.jsp" %>



    <!-- Add these links in the <head> section of your HTML -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <!-- simplebar -->
    <script src="../assets/js/simplebar.min.js"></script>
    <!-- Icons -->
    <script src="../assets/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="../assets/js/app.js"></script>
    <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
<script>
                                                            function updateStatus(element, id) {
                                                                var radioName = "status" + id;
                                                                var radios = document.getElementsByName(radioName);

                                                                var isChecked = false;
                                                                for (var i = 0; i < radios.length; i++) {
                                                                    if (radios[i].checked) {
                                                                        isChecked = true;
                                                                        break;
                                                                    }
                                                                }

                                                                fetch("../admin/updateStatus?table=chapter&id=" + id + "&isChecked=" + isChecked)
                                                                        .then(response => response.text())
                                                                        .then(data => {
                                                                            console.log(data);
                                                                        });
                                                            }

                                                            function openAddModal(subjectId) {
                                                                console.log(subjectId);
                                                                $('#subjectIdadd').val(subjectId);
                                                                $('#chapterAddModal').modal('show');
                                                            }
                                                            function openAddModalx(subjectId) {
                                                                console.log(subjectId);
                                                                $('#subjectIdaddx').val(subjectId);
                                                                $('#dimensionAddModal').modal('show');
                                                            }

                                                            function openModal(subjectId, id, status, title, description) {
                                                                console.log(subjectId);
                                                                $('#activeChapter').prop('checked', status === "true");
                                                                $('#inactiveChapter').prop('checked', status === "false");
                                                                $('#chapterId').val(id);
                                                                $('#chapterTitle').val(title);
                                                                $('#subjectId').val(subjectId);
                                                                $('#chapterTitleh3').text(title);
                                                                $('#chapterDescription').val(description);

                                                                // Show the modal
                                                                $('#chapterModal').modal('show');
                                                            }
                                                            function openModalx(subjectId, id, status, title, name, description) {
                                                                console.log(status);
                                                                $('#subjectIdx').val(subjectId);
                                                                $('#dimensionId').val(id);
                                                                $('#dimensionTitle').val(title);
                                                                $('#dimensionName').val(name);
                                                                $('#dimensionDescription').val(description);
                                                                $('#activeDimension').prop('checked', status === "true");
                                                                $('#inactiveDimension').prop('checked', status === "false");
                                                                $('#dimensionModal').modal('show');
                                                            }
                                                            function confirmDeleteChapter(subjectId, chapterId) {
                                                                console.log(subjectId);
                                                                var result = confirm("Bạn có chắc muốn xóa?");
                                                                if (result) {
                                                                    // Nếu người dùng chọn OK, chuyển hướng đến URL xóa
                                                                    window.location.href = `subject-detail-management?id=` + subjectId + `&action=delete-chapter&cid=` + chapterId;
                                                                } else {
                                                                    // Nếu người dùng chọn Cancel, không làm gì cả
                                                                }
                                                            }
                                                            function confirmDeleteDimension(subjectId, dimensionId) {
                                                                console.log(subjectId);
                                                                var result = confirm("Bạn có chắc muốn xóa?");
                                                                if (result) {
                                                                    // Nếu người dùng chọn OK, chuyển hướng đến URL xóa
                                                                    window.location.href = `subject-detail-management?id=` + subjectId + `&action=delete-dimension&did=` + dimensionId;
                                                                } else {
                                                                    // Nếu người dùng chọn Cancel, không làm gì cả
                                                                }
                                                            }


                                                            function changeSubject() {
                                                                var selectedSubjectId = document.getElementById('subjectDropdown').value;
                                                                // Lưu giá trị vào localStorage
                                                                console.log();
                                                                localStorage.setItem('selectedSubjectId', selectedSubjectId);

                                                                window.location.href = 'subject-detail-management?id=' + selectedSubjectId;
                                                            }

                                                            function openTab(tabId, showAlert) {
                                                                // Hide all tab contents
                                                                var tabs = document.getElementsByClassName('tab-content');
                                                                for (var i = 0; i < tabs.length; i++) {
                                                                    tabs[i].classList.remove('active');
                                                                }

                                                                // Remove 'active' class from all tabs
                                                                var tabButtons = document.getElementsByClassName('tab');
                                                                for (var i = 0; i < tabButtons.length; i++) {
                                                                    tabButtons[i].classList.remove('active');
                                                                }

                                                                // Show the selected tab content
                                                                document.getElementById(tabId).classList.add('active');

                                                                // Check if showAlert is true and show alert
                                                                if (showAlert) {
                                                                    alert('Update successful!');
                                                                }
                                                            }
                                                            function openTabDeleted(tabId, showAlert) {
                                                                // Hide all tab contents
                                                                var tabs = document.getElementsByClassName('tab-content');
                                                                for (var i = 0; i < tabs.length; i++) {
                                                                    tabs[i].classList.remove('active');
                                                                }

                                                                // Remove 'active' class from all tabs
                                                                var tabButtons = document.getElementsByClassName('tab');
                                                                for (var i = 0; i < tabButtons.length; i++) {
                                                                    tabButtons[i].classList.remove('active');
                                                                }

                                                                // Show the selected tab content
                                                                document.getElementById(tabId).classList.add('active');

                                                                // Check if showAlert is true and show alert
                                                                if (showAlert) {
                                                                    alert('Delete successful!');
                                                                }
                                                            }
                                                            function openTabAdded(tabId, showAlert) {
                                                                // Hide all tab contents
                                                                var tabs = document.getElementsByClassName('tab-content');
                                                                for (var i = 0; i < tabs.length; i++) {
                                                                    tabs[i].classList.remove('active');
                                                                }

                                                                // Remove 'active' class from all tabs
                                                                var tabButtons = document.getElementsByClassName('tab');
                                                                for (var i = 0; i < tabButtons.length; i++) {
                                                                    tabButtons[i].classList.remove('active');
                                                                }

                                                                // Show the selected tab content
                                                                document.getElementById(tabId).classList.add('active');

                                                                // Check if showAlert is true and show alert
                                                                if (showAlert) {
                                                                    alert('Add successful!');
                                                                }
                                                            }
                                                            window.onload = function () {
                                                                var urlParams = new URLSearchParams(window.location.search);
                                                                var urlSubjectId = urlParams.get('id');
                                                                var updateType = urlParams.get('updateType');
                                                                var deleteType = urlParams.get('deleteType');
                                                                var addType = urlParams.get('addType');
                                                                document.getElementById('subjectDropdown').value = urlSubjectId;

                                                                localStorage.setItem('selectedSubjectId', urlSubjectId);

                                                                if (updateType === 'chapter') {
                                                                    openTab('chapterTab', true);
                                                                } else if (updateType === 'dimension') {
                                                                    openTab('dimensionsTab', true);
                                                                }
                                                                if (deleteType === 'chapter') {
                                                                    openTabDeleted('chapterTab', true);
                                                                } else if (deleteType === 'dimension') {
                                                                    openTabDeleted('dimensionsTab', true);
                                                                }
                                                                if (addType === 'chapter') {
                                                                    openTabAdded('chapterTab', true);
                                                                } else if (addType === 'dimension') {
                                                                    openTabAdded('dimensionsTab', true);
                                                                }
                                                            };

</script>
</html>