<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<head>
    <!-- Favicon -->
    <link href="assets/img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap"
        rel="stylesheet"
        />

    <!-- Icon Font Stylesheet -->
    <link
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
        rel="stylesheet"
        />
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
        rel="stylesheet"
        />

    <!-- Libraries Stylesheet -->
    <link href="assets/lib/animate/animate.min.css" rel="stylesheet" />
    <link
        href="assets/lib/owlcarousel/assets/owl.carousel.min.css"
        rel="stylesheet"
        />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="assets/css/style.css" rel="stylesheet" />
</head>
<body>
    <!-- Navbar Start -->
    <nav
        class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0"
        >
        <a
            href="/LearningManagement/"
            class="navbar-brand d-flex align-items-center px-4 px-lg-5"
            >
            <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>EduPro</h2>
        </a>
        <button
            type="button"
            class="navbar-toggler me-4"
            data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse"
            >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="/LearningManagement/" class="nav-item nav-link active">Home</a>
                <a href="/LearningManagement/" class="nav-item nav-link">Lesson</a>
                <div class="nav-item dropdown">
                    <a
                        href="#"
                        class="nav-link dropdown-toggle"
                        data-bs-toggle="dropdown"
                        >Class</a
                    >
                    <div class="dropdown-menu fade-down m-0"></div>
                </div>
                <a href="#service" class="nav-item nav-link">service</a>
            </div>
            <c:if test="${sessionScope.accountCur == null}">           
                <a href="sign-in" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block"
                   >Join Now<i class="fa fa-arrow-right ms-3"></i
                    ></a>
                </c:if>
        </div>
        <c:if test="${sessionScope.accountCur != null}">  
            <div class="btn-group">
                <button style="background-color: #06BBCC; color: white" type="button" class="btn btn-sm btn-light dropdown-toggle" data-bs-toggle="dropdown"><i class="fas fa-user p-2"></i>${sessionScope.accountCur.name}</button>
                <div class="dropdown-menu dropdown-menu-right">

                    <a href="profile" class="dropdown-item" type="button">My profile</a>
                    <a href="log-out" class="dropdown-item" type="button">Log out</a>

                </div>
            </div>
        </c:if>
    </nav>
</body>
<!-- Navbar End -->
