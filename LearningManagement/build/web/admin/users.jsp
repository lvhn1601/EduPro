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
        <link href="../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
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
            <jsp:include page="components/sidebar.jsp"/>

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="components/header.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">Admin</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Users</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Users Manager</h5>
                            
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form action="users" method="get" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="search" id="s" placeholder="Search..." value="${param.search}">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                                            
                            <a href="add-user" class="btn btn-primary">Add New User</a>
                            
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 240px;">Name</th>
                                                <th class="border-bottom p-3">User role</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3">Created by</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.data}" var="u">
                                                <tr>
                                                    <th class="p-3">${u.id}</th>
                                                    <td class="py-3">
                                                        <a href="#" class="text-dark">
                                                            <div class="d-flex align-items-center">
                                                                <img src="${u.avatar_url}" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                <span class="ms-2">${u.name}</span>
                                                            </div>
                                                        </a>
                                                    </td>
                                                    <td class="p-3">
                                                        <select class="form-select form-control" name="role" id="role-select" onchange="updateRole(this, ${u.id})">
                                                            <c:forEach items="${requestScope.roles}" var="r">
                                                                <option value="${r.id}" ${u.role.id eq r.id ? 'selected' : ''}>${r.title}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td class="p-3">
                                                        <c:if test="${u.active == 0}">
                                                            <div style="color: red">Unverify</div>
                                                        </c:if>
                                                        <c:if test="${u.active != 0}">
                                                            <form class="form-check form-switch">
                                                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" ${u.active == 1 ? 'checked' : ''} onchange="updateStatus(this ,${u.id})">
                                                            </form>
                                                        </c:if>
                                                    </td>
                                                    
                                                    <td class="p-3">${u.created_by}</td>
                                                    
                                                    <td class="text-end p-3">
                                                        <a href="#"
                                                           class="btn btn-icon btn-pills btn-soft-primary" 
                                                           data-bs-toggle="modal" 
                                                           data-bs-target="#viewprofile"
                                                           onclick="showUserInfo('${u.avatar_url}', '${u.name}', '${u.email}', '${u.phone}', '${u.dob}', '${u.role.title}', '${u.created_by}', '${u.created_at}', '${u.update_by}', '${u.update_at}')"
                                                        >
                                                            <i class="uil uil-eye"></i>
                                                        </a>
                                                        <a href="edit-user?id=${u.id}" class="btn btn-icon btn-pills btn-soft-success"><i class="uil uil-pen"></i></a>
                                                        <!--<a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>-->
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
                                        <li class="page-item"><a class="page-link" href="javascript:jumpTo(1)" aria-label="Previous">First</a></li>
                                        <c:forEach begin="${cur > 1 ? (cur + 3 > pages ? (pages - 4 < 1 ? 1 : pages - 4) : cur - 1) : 1}" end="${cur > 1 ? (cur + 3 > pages ? pages : cur + 3) : (5 > pages ? pages : 5)}" var="i">
                                            <li class="page-item ${(param.page == i || (i==1 && param.page==null)) ? 'active' : ''}">
                                                <a class="page-link" href="javascript:jumpTo(${i})">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link" href="javascript:jumpTo(${pages})" aria-label="Next">Last</a></li>

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
                        <h5 class="modal-title" id="exampleModalLabel1">Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="d-flex align-items-center">
                            <img src="../assets/images/client/01.jpg" class="avatar avatar-small rounded-pill" id="info-avatar" alt="">
                            <h5 class="mb-0 ms-3" id="info-name"></h5>
                        </div>
                        <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                            <li class="me-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>Email:</h6>
                                        <p class="text-dark ms-2" id="info-email">lvhn1601@gmail.com</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>Phone:</h6>
                                        <p class="text-dark ms-2" id="info-phone">0965749667</p>
                                    </li>
                                    
                                    <li>
                                        <em class="text-muted mb-0" id="info-created-by">Created by Le Vo Hoai Nam</em>
                                        <em class="text-muted" id="info-created-at"> at 2023/09/21 01:14:55.001</em>
                                    </li>
                                </ul>
                            </li>
                            <li class="mb-2">
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>Birthday:</h6>
                                        <p class="text-dark ms-2" id="info-dob">16/01/2003</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>Role:</h6>
                                        <p class="text-dark ms-2" id="info-role">Admin</p>
                                    </li>
                                    
                                    <li>
                                        <em class="text-muted mb-0" id="info-update-by">Update by Le Vo Hoai Nam</em>
                                        <em class="text-muted" id="info-update-at"> at 2023/09/23 10:01:42.011</em>
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
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="../assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../assets/js/app.js"></script>
        
        <script>
            
            function jumpTo(page_num) {
                let search = "${param.search eq null ? '' : param.search}";
                location.href = "./users?page=" + Math.floor(page_num) + (search == "" ? "" : "&search=" + search);
            }
            
            function showUserInfo(avatar_url, name, email, phone, dob, role, created_by, created_at, update_by, update_at) {
                console.log(name);
                document.getElementById("info-avatar").src = avatar_url;
                document.getElementById("info-name").textContent = name;
                document.getElementById("info-email").textContent = email;
                document.getElementById("info-phone").textContent = phone;
                document.getElementById("info-dob").textContent = dob;
                document.getElementById("info-role").textContent = role;
                document.getElementById("info-created-by").textContent = 'Created by ' + created_by;
                document.getElementById("info-created-at").textContent = 'at ' + created_at;
                document.getElementById("info-update-by").textContent = 'Update by ' + update_by;
                document.getElementById("info-update-at").textContent = 'at ' + update_at;
            }
            
            function updateStatus(element, id) {
                var isChecked = element.checked;
                
                fetch("updateStatus?table=account&id=" + id + "&isChecked=" + isChecked)
                        .then(response => response.text())
                        .then(data => {
                            console.log(data);
                        });
            }
            
            function updateRole(element, id) {
                var role = element.value;
                
                fetch("update-role?id=" + id + "&role=" + role)
                        .then(response => response.text())
                        .then(data => {
                            console.log(data);
                        });
            }
            
        </script>
    </body>
</html>
