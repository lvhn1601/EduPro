<%-- 
    Document   : edit-user
    Created on : Sep 21, 2023, 5:43:11 PM
    Author     : lvhn1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User - Admin</title>
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
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Add User</h5>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <div class="row align-items-center">
                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h4 class="">Add new user</h4>
                                        </div><!--end col-->
                                    </div><!--end row-->
            
                                    <form class="mt-4" action="add-user" method="post">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name</label>
                                                    <input name="name" id="name" type="text" class="form-control" placeholder="Full Name :">
                                                </div>
                                            </div><!--end col-->
            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input name="email" id="email" type="email" class="form-control" placeholder="Email :" oninput="checkEmpty()">
                                                </div>
                                            </div><!--end col-->
            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Phone no.</label>
                                                    <input name="phone" id="phone" type="tel" class="form-control" placeholder="Phone no. :" oninput="checkEmpty()">
                                                </div> 
                                            </div><!--end col-->
            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Date of Birth</label>
                                                    <input name="dob" id="dob" type="date" class="form-control" required>
                                                </div>                                                                               
                                            </div><!--end col-->
            
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Role</label>
                                                    <select name="role" class="form-control department-name select2input">
                                                        <c:forEach items="${roles}" var="r">
                                                            <option value="${r.id}">${r.title}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div><!--end col-->
                                        </div><!--end row-->
            
                                        <div id="error-mess" style="color: red">${error}</div>
                                        
                                        <button type="submit" class="btn btn-primary" id="submit-btn" disabled>Add</button>
                                    </form>
                                </div>
                            </div><!--end col-->
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
        
        <!-- javascript -->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="../assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../assets/js/app.js"></script>
        
        <script>
            const listDomains = ${domains};
            const error_text = document.getElementById("error-mess");
            const submit_btn = document.getElementById("submit-btn");
            const email_box = document.getElementById("email");
            const phone_box = document.getElementById("phone");
            
            function checkDomain(str) {
                for (let domain of listDomains)
                    if (domain == str) return true;
                
                return false;
            }
            
            function checkEmpty() {
                let email = email_box.value;
                let phone = phone_box.value;
            
                if (email.trim() == '' && phone.trim() == '') {
                    error_text.textContent = "You must input email or phone!";
                    submit_btn.disabled = true;
                    return;
                }
                
                
                if (email.trim() != '' && !checkDomain(email.split("@")[1])) {
                    error_text.textContent = "This email domain is not valid!";
                    submit_btn.disabled = true;
                    return;
                }
                
                if (phone.trim() != '' && (phone.length > 12 || (phone.charAt(0) != '0' && phone.charAt(0) != '+'))) {
                    error_text.textContent = "This phone number is not valid!";
                    submit_btn.disabled = true;
                    return;
                }
                
                error_text.textContent = "";
                submit_btn.disabled = false;
            }
        </script>
    </body>
</html>
