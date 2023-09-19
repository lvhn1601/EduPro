<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>EduPro- Online Learning</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

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
        href="index.html"
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
          <a href="index.html" class="nav-item nav-link active">Home</a>
          <a href="courses.html" class="nav-item nav-link">Lesson</a>
          <div class="nav-item dropdown">
            <a
              href="#"
              class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"
              >Class</a
            >
            <div class="dropdown-menu fade-down m-0"></div>
          </div>
          <a href="contact.html" class="nav-item nav-link">Contact</a>
        </div>
        <a href="" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block"
          >Join Now<i class="fa fa-arrow-right ms-3"></i
        ></a>
      </div>
    </nav>
    <!-- Navbar End -->

    <!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5">
      <div class="owl-carousel header-carousel position-relative">
        <div class="owl-carousel-item position-relative">
          <img class="img-fluid" src="assets/img/sanhAlpha.png" alt="" />
          <div
            class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
            style="background: rgba(24, 29, 56, 0.7)"
          >
            <div class="container">
              <div class="row justify-content-start">
                <div class="col-sm-10 col-lg-8">
                  <h5
                    class="text-primary text-uppercase mb-3 animated slideInDown"
                  >
                    EduPro
                  </h5>
                  <h1 class="display-3 text-white animated slideInDown">
                    Exchanging between Students and Lecturers
                  </h1>
                  <p class="fs-5 text-white mb-4 pb-2">
                    The website serves the convenience needs of Lecturers and
                    Students
                  </p>
                  <a
                    href=""
                    class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft"
                    >Hire class</a
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="owl-carousel-item position-relative">
          <img class="img-fluid" src="assets/img/sanhAlpha2.png" alt="" />
          <div
            class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
            style="background: rgba(24, 29, 56, 0.7)"
          >
            <div class="container">
              <div class="row justify-content-start">
                <div class="col-sm-10 col-lg-8">
                  <h5
                    class="text-primary text-uppercase mb-3 animated slideInDown"
                  >
                    EduPro
                  </h5>
                  <h1 class="display-3 text-white animated slideInDown">
                    Learnning everything from everywhere
                  </h1>
                  <p class="fs-5 text-white mb-4 pb-2">
                    Learnning knowledge whether you are at school or anywhere
                    else
                  </p>
                  <a
                    href=""
                    class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft"
                    >Hire lesson</a
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Carousel End -->

    <!-- Service Start -->
    <div class="container-xxl py-5">
      <div class="container">
        <div class="row g-4">
          <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
            <div class="service-item text-center pt-3">
              <div class="p-4">
                <i class="fa fa-3x fa-graduation-cap text-primary mb-4"></i>
                <h5 class="mb-3">Skilled Lecturers</h5>
                <p>
                  All are teachers with 10 years or more experience, lecturers,
                  masters, and doctors from prestigious universities across the
                  country.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
            <div class="service-item text-center pt-3">
              <div class="p-4">
                <i class="fa fa-3x fa-globe text-primary mb-4"></i>
                <h5 class="mb-3">Online Classes</h5>
                <p>
                  Online classes are arranged by the school with no more than 20
                  students to ensure instructors stay as close to students as
                  possible.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
            <div class="service-item text-center pt-3">
              <div class="p-4">
                <i class="fa fa-3x fa-home text-primary mb-4"></i>
                <h5 class="mb-3">Learning Time</h5>
                <p>
                  Online classes are arranged by the school with no more than 20
                  students to ensure instructors stay as close to students as
                  possible.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
            <div class="service-item text-center pt-3">
              <div class="p-4">
                <i class="fa fa-3x fa-book-open text-primary mb-4"></i>
                <h5 class="mb-3">Online Documents</h5>
                <p>
                  Materials and exercises are selected by the school and
                  lecturers to suit the subject the student is studying and
                  wants to learn about other subjects.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Service End -->

    <!-- Lesson Start -->
    <div class="container-xxl py-5 category">
      <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
          <h6 class="section-title bg-white text-center text-primary px-3">
            Lesson
          </h6>
          <h1 class="mb-5">Subject Lesson</h1>
        </div>
        <div class="row g-3">
          <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
            <a class="position-relative d-block overflow-hidden" href="">
              <img
                class="img-fluid"
                src="assets/img/MAE101.ee704482946a2485d1e5.png"
                alt=""
              />
            </a>
          </div>
          <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
            <a class="position-relative d-block overflow-hidden" href="">
              <img
                class="img-fluid"
                src="assets/img/NWC203c.6ecd3d55eee2cb73258a.png"
                alt=""
              />
            </a>
          </div>
          <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
            <a class="position-relative d-block overflow-hidden" href="">
              <img
                class="img-fluid"
                src="assets/img/SSG104.a516ba469c28c817dfa5.png"
                alt=""
              />
            </a>
          </div>
          <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
            <a class="position-relative d-block overflow-hidden" href="">
              <img
                class="img-fluid"
                src="assets/img/DBI202.bbdf62f3484cdc415fcd.png"
                alt=""
              />
            </a>
          </div>
          <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
            <a class="position-relative d-block overflow-hidden" href="">
              <img
                class="img-fluid"
                src="assets/img/OSG202.7af0e6b0a252d2a5dc5f.png"
                alt=""
              />
            </a>
          </div>
          <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
            <a class="position-relative d-block overflow-hidden" href="">
              <img
                class="img-fluid"
                src="assets/img/CSI104.2184a7868fa678077f03.png"
                alt=""
              />
            </a>
          </div>
          <!-- <div class="col-lg-7 col-md-6">
            <div class="row g-3">
              <div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
                <a class="position-relative d-block overflow-hidden" href="">
                  <img
                    class="img-fluid"
                    src="assets/img/SWP391.5fdddbd15263f212b41a.png"
                    alt=""
                  />
                </a>
              </div>
              <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.3s">
                <a class="position-relative d-block overflow-hidden" href="">
                  <img
                    class="img-fluid"
                    src="assets/img/IOT102.ef1a367c326adba8decc.png"
                    alt=""
                  />
                </a>
              </div>
              <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.5s">
                <a class="position-relative d-block overflow-hidden" href="">
                  <img
                    class="img-fluid"
                    src="assets/img/MAS291.17a4b62d776f5586dd44.png"
                    alt=""
                  />
                </a>
              </div>
            </div>
          </div>
          <div
            class="col-lg-5 col-md-6 wow zoomIn"
            data-wow-delay="0.7s"
            style="min-height: 10px"
          >
            <a class="position-relative d-block h-100 overflow-hidden" href="">
              <img
                class="img-fluid position-absolute w-100 h-100"
                src="assets/img/cat-4.jpg"
                alt=""
                style="object-fit: cover"
              />
            </a>
          </div> -->
        </div>
      </div>
    </div>
    <!-- Categories Start -->

    <!-- Courses Start -->
    <div class="container-xxl py-5">
      <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
          <h6 class="section-title bg-white text-center text-primary px-3">
            Group class
          </h6>
          <h1 class="mb-5">Class</h1>
        </div>
        <div class="row g-4 justify-content-center">
          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
            <div class="course-item bg-light">
              <div class="position-relative overflow-hidden">
                <img
                  class="img-fluid"
                  src="assets/img/CEA201.726e8249a187ad5531b6.png"
                  alt=""
                />
                <div
                  class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4"
                >
                  <a
                    href="#"
                    class="flex-shrink-0 btn btn-sm btn-primary px-3"
                    style="border-radius: 0 30px 30px 0"
                    >Join Now</a
                  >
                </div>
              </div>
              <div class="text-center p-4 pb-0">
                <h5 class="mb-4">
                  Computer Architecture & Computer Organization- SE1741 -
                  Fall2023
                </h5>
              </div>
              <div class="d-flex border-top">
                <small class="flex-fill text-center border-end py-2"
                  ><i class="fa fa-user-tie text-primary me-2"></i>John
                  Doe</small
                >
                <small class="flex-fill text-center py-2"
                  ><i class="fa fa-user text-primary me-2"></i>30
                  Students</small
                >
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
            <div class="course-item bg-light">
              <div class="position-relative overflow-hidden">
                <img
                  class="img-fluid"
                  src="assets/img/MAD101.20b9f72d53ca43e48a53.png"
                  alt=""
                />
                <div
                  class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4"
                >
                  <a
                    href="#"
                    class="flex-shrink-0 btn btn-sm btn-primary px-3"
                    style="border-radius: 0 30px 30px 0"
                    >Join Now</a
                  >
                </div>
              </div>
              <div class="text-center p-4 pb-0">
                <h5 class="mb-4">Discrete Mathematics - SE1741 - Fall2023</h5>
              </div>
              <div class="d-flex border-top">
                <small class="flex-fill text-center border-end py-2"
                  ><i class="fa fa-user-tie text-primary me-2"></i>John
                  Doe</small
                >

                <small class="flex-fill text-center py-2"
                  ><i class="fa fa-user text-primary me-2"></i>30
                  Students</small
                >
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
            <div class="course-item bg-light">
              <div class="position-relative overflow-hidden">
                <img
                  class="img-fluid"
                  src="assets/img/PRF192.175d27716986ea8c2f05.png"
                  alt=""
                />
                <div
                  class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4"
                >
                  <a
                    href="#"
                    class="flex-shrink-0 btn btn-sm btn-primary px-3"
                    style="border-radius: 0 30px 30px 0"
                    >Join Now</a
                  >
                </div>
              </div>
              <div class="text-center p-4 pb-0">
                <h5 class="mb-4">
                  Programming Fundamentals - SE1741 - Fall2023
                </h5>
              </div>
              <div class="d-flex border-top">
                <small class="flex-fill text-center border-end py-2"
                  ><i class="fa fa-user-tie text-primary me-2"></i>John
                  Doe</small
                >

                <small class="flex-fill text-center py-2"
                  ><i class="fa fa-user text-primary me-2"></i>30
                  Students</small
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Courses End -->

    <!-- Footer Start -->
    <div
      class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
      data-wow-delay="0.1s"
    >
      <div class="container py-5">
        <div class="row g-5">
          <div class="col-lg-3 col-md-6">
            <h4 class="text-white mb-3">Quick Link</h4>
            <a class="btn btn-link" href="">About Us</a>
            <a class="btn btn-link" href="">Contact Us</a>
            <a class="btn btn-link" href="">Privacy Policy</a>
            <a class="btn btn-link" href="">Terms & Condition</a>
            <a class="btn btn-link" href="">FAQs & Help</a>
          </div>
          <div class="col-lg-3 col-md-6">
            <h4 class="text-white mb-3">Contact</h4>
            <p class="mb-2">
              <i class="fa fa-map-marker-alt me-3"></i>FPT University
            </p>
            <p class="mb-2">
              <i class="fa fa-phone-alt me-3"></i>+012 345 67890
            </p>
            <p class="mb-2"><i class="fa fa-envelope me-3"></i>fpt.edu.vn</p>
            <div class="d-flex pt-2">
              <a class="btn btn-outline-light btn-social" href=""
                ><i class="fab fa-twitter"></i
              ></a>
              <a class="btn btn-outline-light btn-social" href=""
                ><i class="fab fa-facebook-f"></i
              ></a>
              <a class="btn btn-outline-light btn-social" href=""
                ><i class="fab fa-youtube"></i
              ></a>
              <a class="btn btn-outline-light btn-social" href=""
                ><i class="fab fa-linkedin-in"></i
              ></a>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <h4 class="text-white mb-3">NewsLetter</h4>
            <p>Thank you for visit our website</p>
            <div class="position-relative mx-auto" style="max-width: 400px">
              <input
                class="form-control border-0 w-100 py-3 ps-4 pe-5"
                type="text"
                placeholder="Your email"
              />
              <button
                type="button"
                class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2"
              >
                SignUp
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="copyright">
          <div class="row">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
              &copy; <a class="border-bottom" href="#">EduPro</a>, All Right
              Reserved. Designed By
              <a class="border-bottom" href="">Group 5 - SE1741</a>
            </div>
            <div class="col-md-6 text-center text-md-end">
              <div class="footer-menu">
                <a href="">Home</a>
                <a href="">Cookies</a>
                <a href="">Help</a>
                <a href="">FQAs</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"
      ><i class="bi bi-arrow-up"></i
    ></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/lib/wow/wow.min.js"></script>
    <script src="assets/lib/easing/easing.min.js"></script>
    <script src="assets/lib/waypoints/waypoints.min.js"></script>
    <script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="assets/js/main.js"></script>
  </body>
</html>
