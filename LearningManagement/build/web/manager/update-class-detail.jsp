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
        <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/remixicon.css" rel="stylesheet" type="text css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../components/sidebar.jsp"/>
            <main class="page-content bg-light">
                <jsp:include page="../components/header.jsp"/>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item">${sessionScope.accountCur.role.title}</li>
                                <li class="breadcrumb-item"><a href="lessons">Class</a></li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Class Details</h5>
                        </div>
                        <ul class="nav nav-tabs" id="myTabs">
                            <li class="nav-item">
                                <a class="nav-link active" id="classDetailsTab" data-toggle="tab" href="#classDetails" role="tab" aria-controls="classDetails" aria-selected="true">Class Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="listStudentTab" data-toggle="tab" href="#listStudent" role="tab" aria-controls="listStudent" aria-selected="false">List Students</a>
                            </li>
                        </ul>
                        <c:forEach items="${requestScope.listClass}" var="c">
                            <c:if test="${c.class_id eq classDetailId}">
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="classDetails" role="tabpanel" aria-labelledby="classDetailsTab">
                                        <div class="row">
                                            <c:if test="${sessionScope.msgUpdateClass != null}">
                                                <div class="col-lg-12 mt-4">
                                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                        <strong>${sessionScope.msgUpdateClass}</strong>                                                   
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="col-lg-12 mt-2">
                                                <div class="card border-0 p-4 rounded shadow">
                                                    <div class="row align-items-center">
                                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                            <h4 class="">Class Details</h4>
                                                        </div>
                                                    </div>
                                                    <form class="mt-4" action="class-detail?id=${c.class_id}" method="post" onsubmit="return checkEmpty();">
                                                        <input type="hidden" name="classId" id="classId" value="${c.class_id}">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Class Name:</label>
                                                                    <input type="text" class="form-control" id="className" name="className" value="${c.class_name}" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Subject:</label>
                                                                    <select class="form-control" id="classSubject" name="classSubject">
                                                                        <c:forEach items="${listSubject}" var="ls">
                                                                            <option value="${ls.id}" ${ls.name == c.class_subject_name ? 'selected' : ''}>${ls.name}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label for="classSemester">Semester:</label>
                                                                    <select class="form-control" id="classSemester" name="classSemester">
                                                                        <c:forEach items="${listSemester}" var="l">
                                                                            <option value="${l.id}" ${l.title == c.class_semester_name ? 'selected' : ''}>${l.title}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label for="classTrainer">Trainer:</label>
                                                                    <select class="form-control" id="classTrainer" name="classTrainer">
                                                                        <c:forEach items="${listTrainer}" var="t">
                                                                            <option value="${t.id}" ${t.email == c.class_trainer_name ? 'selected' : ''}>${t.email} - ${t.name}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label for="classStart">Date Start:</label>
                                                                    <input type="date" class="form-control" id="classStart" name="classStart" value="${c.class_start}" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label for="classEnd">Date End:</label>
                                                                    <input type="date" class="form-control" id="classEnd" name="classEnd" value="${c.class_end}" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Class Status:</label>
                                                                    <div class="d-flex ms-4">
                                                                        <div class="form-check pe-4">
                                                                            <input class="form-check-input" type="radio" name="classStatus" id="active" value="true" ${c.class_status == 'true' ? 'checked' : ''}>
                                                                            <label class="form-check-label" for="active">Active</label>
                                                                        </div>
                                                                        <div class="form-check pe-4">
                                                                            <input class="form-check-input" type="radio" name="classStatus" id="inactive" value="false" ${c.class_status == 'false' ? 'checked' : ''}>
                                                                            <label class="form-check-label" for="inactive">Inactive</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <c:if test="${c.update_by != null && c.update_at != null}">
                                                                <ul class="list-unstyled mb-0">
                                                                    <li>
                                                                        <em class="text-muted mb-0" id="info-update-by">Last update by ${c.update_by}</em>
                                                                        <em class="text-muted" id="info-update-at"> at ${c.update_at} </em>
                                                                    </li>
                                                                </ul>
                                                            </c:if>
                                                        </div>
                                                        <div id="error-mess" style="color: red">${error}</div>
                                                        <button type="submit" id="submit-btn" class="btn btn-primary mt-4">Update</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <div class="tab-pane fade" id="listStudent" role="tabpanel" aria-labelledby="listStudentTab">
                                <div class="row">
                                    <div class="col-lg-12 mt-4">
                                        <div class="card border-0 p-4 rounded shadow">
                                            <div class="row align-items-center">
                                                <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                    <h4 class="">List Students</h4>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 mt-4">
                                                    <table id="example" class="display" style="width:100%">

                                                        <thead>
                                                            <tr>
                                                                <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                                                <th class="border-bottom p-3" style="min-width: 180px;">Student Name</th>
                                                                <th class="border-bottom p-3">Email</th>
                                                                <th class="border-bottom p-3">Phone</th>                                                                  
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${requestScope.listTrainee}" var="c">
                                                                <tr>
                                                                    <td class="p-3">${c.id}</td>
                                                                    <td class="p-3">${c.name}</td><!-- comment -->
                                                                    <td class="p-3">${c.email}</td><!-- comment -->
                                                                    <td class="p-3">${c.phone}</td><!-- comment -->
                                                                </tr>
                                                                
                                                                
                                                                
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        </div>
    </div>
</main>
</div>
</body>
</html>
<!--Datatable-->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"/>

<script>
                                                new DataTable('#example');
</script>
<script>
    $(document).ready(function () {
        $("#listStudentTab").click(function () {
            // Khi tab "List Student" được nhấp vào, ta ẩn tab "Class Details" và hiển thị tab "List Student".
            $("#classDetails").removeClass("show active");
            $("#classDetailsTab").removeClass("active");
            $("#listStudent").addClass("show active");
            $("#listStudentTab").addClass("active");
        });
    });
</script>

<%
                       request.getSession().removeAttribute("msgUpdateClass");
%>
