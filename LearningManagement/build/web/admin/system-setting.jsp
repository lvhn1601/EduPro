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
            <jsp:include page="../components/sidebar.jsp"/>

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="../components/header.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">Admin</a></li>
                                <li class="breadcrumb-item active" aria-current="page">System setting</li>
                            </ul>
                        </nav>
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">System Setting Manager</h5>
                            
                            
                            
                            <a href="add-setting" class="btn btn-primary mb-2">Add New</a>
                        </div>

                        <div class="row d-flex flex-row">
                            <div class="col-6 mt-4">
                                <h5 class="mb-2">Semesters Manager</h5>
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 30px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Semester name</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3">Created by</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${semesters}" var="s">
                                                <tr>
                                                    <th class="p-3">${s.id}</th>
                                                    <td class="py-3">
                                                        <div class="d-flex align-items-center">
                                                            <span class="ms-2">${s.title}</span>
                                                        </div>
                                                    </td>
                                                    <td class="p-3">
                                                        <form class="form-check form-switch">
                                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault ${s.id}" ${s.status ? 'checked' : ''} onchange="updateStatus(this, ${s.id})">
                                                        </form>
                                                    </td>
                                                    
                                                    <td class="p-3">${s.created_by}</td>
                                                    
                                                    <td class="text-end p-3">
                                                        <a href="#"
                                                           class="btn btn-icon btn-pills btn-soft-primary" 
                                                           data-bs-toggle="modal" 
                                                           data-bs-target="#viewprofile"
                                                           onclick="showSettingInfo('Semester', '${s.title}', '${s.created_by}', '${s.created_at}', '${s.update_by}', '${s.update_at}')"
                                                        >
                                                            <i class="uil uil-eye"></i>
                                                        </a>
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"
                                                           onclick="editSetting('Semester', '${s.id}', '${s.title}')"><i class="uil uil-pen"></i></a>
                                                        <!--<a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>-->
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                            <div class="col-6 mt-4">
                                <h5 class="mb-2">Permitted Domains Manager</h5>
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 30px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Permitted domain</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3">Created by</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${domains}" var="d">
                                                <tr>
                                                    <th class="p-3">${d.id}</th>
                                                    <td class="py-3">
                                                        <div class="d-flex align-items-center">
                                                            <span class="ms-2">${d.title}</span>
                                                        </div>
                                                    </td>
                                                    <td class="p-3">
                                                        <form class="form-check form-switch">
                                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault ${d.id}" ${d.status ? 'checked' : ''} onchange="updateStatus(this, ${d.id})">
                                                        </form>
                                                    </td>
                                                    
                                                    <td class="p-3">${d.created_by}</td>
                                                    
                                                    <td class="text-end p-3">
                                                        <a href="#"
                                                           class="btn btn-icon btn-pills btn-soft-primary" 
                                                           data-bs-toggle="modal" 
                                                           data-bs-target="#viewprofile"
                                                           onclick="showSettingInfo('Permitted domain', '${d.title}', '${d.created_by}', '${d.created_at}', '${d.update_by}', '${d.update_at}')"
                                                        >
                                                            <i class="uil uil-eye"></i>
                                                        </a>
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"
                                                           onclick="editSetting('Permitted domain', '${d.id}', '${d.title}')"><i class="uil uil-pen"></i></a>
                                                        <!--<a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>-->
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->
                        
                        <div class="row d-flex flex-row">
                            <div class="col-12 mt-4">
                                <h5 class="mb-2">User Roles Manager</h5>
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 30px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Role</th>
                                                <th class="border-bottom p-3">Display Order</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3">Created by</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${roles}" var="r">
                                                <tr>
                                                    <th class="p-3">${r.id}</th>
                                                    <td class="py-3">
                                                        <div class="d-flex align-items-center">
                                                            <span class="ms-2">${r.title}</span>
                                                        </div>
                                                    </td>
                                                    <td class="p-3">
                                                        <input type="number" max="4" min="1" value="${r.display_order}" onchange="updateDisplayOrder(this, ${r.id})" style="border: none"/>
                                                    </td>
                                                    <td class="p-3">
                                                        <form class="form-check form-switch">
                                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault ${r.id}" ${r.status ? 'checked' : ''} onchange="updateStatus(this, ${r.id})">
                                                        </form>
                                                    </td>
                                                    
                                                    <td class="p-3">${r.created_by}</td>
                                                    
                                                    <td class="text-end p-3">
                                                        <a href="#"
                                                           class="btn btn-icon btn-pills btn-soft-primary" 
                                                           data-bs-toggle="modal" 
                                                           data-bs-target="#viewprofile"
                                                           onclick="showSettingInfo('Role', '${r.title}', '${r.created_by}', '${r.created_at}', '${r.update_by}', '${r.update_at}')"
                                                        >
                                                            <i class="uil uil-eye"></i>
                                                        </a>
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"
                                                           onclick="editSetting('Role', '${r.id}', '${r.title}')"><i class="uil uil-pen"></i></a>
                                                        <!--<a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>-->
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
        <!-- Profile Start -->
        <div class="modal fade" id="viewprofile" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1">Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="d-flex align-items-center">
                            <h5 class="mb-0 ms-3" id="info-title"></h5>
                        </div>
                        <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                            <li style="width: 50%">
                                <ul class="list-unstyled mb-0">
                                    
                                    <li>
                                        <em class="text-muted mb-0" id="info-created-by">Created by Le Vo Hoai Nam</em>
                                        <em class="text-muted" id="info-created-at"> at 2023/09/21 01:14:55.001</em>
                                    </li>
                                </ul>
                            </li>
                            <li style="width: 50%">
                                <ul class="list-unstyled mb-0">
                                    
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
        
        <!-- Profile Settings Start -->
        <div class="modal fade" id="editprofile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Setting</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                    
                        <form class="mt-4" action="edit-setting" method="post">
                            <div class="row">
                                <input name="id" id="setting-id" type="hidden" value=""/>
                                
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">Title</label>
                                        <input name="title" id="setting-title" type="text" class="form-control" placeholder="Title :"/>
                                    </div>
                                </div><!--end col-->
                            
                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="submit" id="submit" name="send" class="btn btn-primary" value="Save changes">
                                </div><!--end col-->
                            </div><!--end row-->
                        </form><!--end form-->
                    </div>
                </div>
            </div>
        </div>
        <!-- Profile Settings End -->
        
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
            console.log(${sessionScope.accountCur.role.display_order});
            function jumpTo(page_num) {
                let search = "${param.search eq null ? '' : param.search}";
                location.href = "./subjects?page=" + Math.floor(page_num) + (search == "" ? "" : "&search=" + search);
            }
            
            function editSetting(type, id, title) {
                document.getElementById("exampleModalLabel").textContent = "Edit " + type;
                document.getElementById("setting-id").value = id;
                document.getElementById("setting-title").value = title;
            }
            
            function showSettingInfo(type, title, created_by, created_at, update_by, update_at) {
                document.getElementById("info-title").textContent = type + ": " + title;
                document.getElementById("info-created-by").textContent = 'Created by ' + created_by;
                document.getElementById("info-created-at").textContent = 'at ' + created_at;
                document.getElementById("info-update-by").textContent = 'Update by ' + update_by;
                document.getElementById("info-update-at").textContent = 'at ' + update_at;
                
                console.log(update_by);
            }
            
            function updateStatus(element, id) {
                var isChecked = element.checked;
                console.log(isChecked);
                
                fetch("updateStatus?table=setting&id=" + id + "&isChecked=" + isChecked)
                        .then(response => response.text())
                        .then(data => {
                            console.log(data);
                        });
            }
            
            function updateDisplayOrder(element, id) {
                var val = element.value;
                if (val > 0 && val < 5) {
                    fetch("updateDisOrd?id=" + id + "&value=" + val)
                        .then(response => response.text())
                        .then(data => {
                            console.log(data);
                        });
                }
            }
        </script>
    </body>
</html>
