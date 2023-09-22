<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="shortcut icon" href="assets/img/logo1.png" type="image/x-icon" />
        <title>QSneaker</title>

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet"
            />
        <!--FontAwesome-->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <!--css file-->
        <link rel="stylesheet" href="assets/css/profile.css" />
        <link href="assets/css/style_profile.css" rel="stylesheet" />
    </head>

    <body>
       <%@include file="components/header.jsp" %>
        <!-- Topbar End -->
        <div class="container emp-profile">
            <div class="row">
                <div class="col-md-3">
                    <div class="profile-img">
                        <img src="${sessionScope.accountCur.avatar_url}" alt="" />
                        <div class="file btn btn-lg btn-primary">
                            Change Photo
                            <input type="file" name="file" />
                        </div>
                    </div>
                </div>
                <div class="row col-md-9">
                    <div class="col-md-9">
                        <div class="profile-head">
                            <h5>${sessionScope.accountCur.name}</h5>
                            <h6>Email: ${sessionScope.accountCur.email}</h6>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <a
                            class="profile-edit-btn"
                            data-toggle="modal"
                            data-target="#changeInformModal"
                            href="javascript:void(0)"
                            >edit profile</a
                        >
                    </div>
                    <div class="col-md-12" style="margin-top: -50px;">
                        <ul
                            class="nav nav-tabs"
                            id="myTab"
                            role="tablist"
                            style="margin-top: 50px"
                            >
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="home-tab"
                                    data-toggle="tab"
                                    href="#home"
                                    role="tab"
                                    aria-controls="home"
                                    aria-selected="true"
                                    >About</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="class-join-tab"
                                    data-toggle="tab"
                                    href="#class-join"
                                    role="tab"
                                    aria-controls="address"
                                    aria-selected="false"
                                    >Class join</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                    class="nav-link"
                                    id="my-certificate-tab"
                                    data-toggle="tab"
                                    href="#my-certificate"
                                    role="tab"
                                    aria-controls="delivering"
                                    aria-selected="false"
                                    >My certificate</a
                                >
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <!---------------- START TAB ABOUT------------->
                        <div
                            class="tab-pane fade"
                            id="home"
                            role="tabpanel"
                            aria-labelledby="home-tab"
                            >
                            <div class="row">
                                <div class="col-md-6">
                                    <label><i class="fa-solid fa-envelope icon"></i>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${sessionScope.accountCur.email}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label><i class="fa-solid fa-signature icon"></i> Name</label>
                                </div>
                                <div class="col-md-4">
                                    <p>${sessionScope.accountCur.name}</p>
                                </div>
                                <div class="col-md-2">
                                    <p><i class="fa-regular fa-pen-to-square"></i></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label
                                        ><i class="fa-solid fa-calendar-days icon"></i> Date Of
                                        Birth</label
                                    >
                                </div>
                                <div class="col-md-4">
                                    <p><fmt:formatDate value="${sessionScope.accountCur.dob}" pattern="dd/MM/yyyy" /><p>
                                </div>
                                <div class="col-md-2">
                                    <p><i class="fa-regular fa-pen-to-square"></i></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label><i class="fa-solid fa-lock icon"></i> Pass Word</label>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <a
                                            data-toggle="modal"
                                            data-target="#changePasswordModal"
                                            href="javascript:void(0)"
                                            >Change</a
                                        >
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!---------------- END TAB ABOUT------------->
                        <!----------------START TAB CLASS JOIN------------->
                      
                        <div
                            class="tab-pane fade"
                            id="class-join"
                            role="tabpanel"
                            aria-labelledby="class-join-tab"
                            >
                            <table class="table shadow table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Name Contact</th>
                                        <th scope="col">Phone Contact</th>
                                        <th scope="col">Order Date</th>
                                        <th scope="col">Expected Date</th>
                                        <th scope="col">View</th>
                                        <th scope="col">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.lstNewOrder}" var="o" varStatus="i">
                                        <tr>
                                            <td>${i.count}</td>
                                            <td>${o.orderNameContact}</td>
                                            <td>${o.orderPhoneContact}</td>
                                            <td>${o.orderCreateDate}</td>
                                            <td>${o.orderExpectedDate}</td>
                                            <td><a data-toggle="modal" data-target="#modal-order-detail" href="javascript:void(0)" onclick="getAllOrderDetail(${o.orderId});"><i class="fa-solid fa-eye"></i></a></td>
                                            <td>
                                                <form action="profile" method="post">
                                                    <input type="hidden" name="orderId" value="${o.orderId}">
                                                    <input type="hidden" name="type" value="deleteNewOrder">
                                                    <button type="submit" class="btn"><i class="fa-solid fa-trash text-danger"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!----------------END TAB CLASS JOIN------------->
                        <!------------------START TAB MY CERTIFICATE----------------------->

                        <div
                            class="tab-pane fade"
                            id="my-certificate"
                            role="tabpanel"
                            aria-labelledby="my-certificate-tab"
                            >
                            <table class="table shadow table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Name Contact</th>
                                        <th scope="col">Phone Contact</th>
                                        <th scope="col">Order Date</th>
                                        <th scope="col">Expected Date</th>
                                        <th scope="col">View</th>
                                        <th scope="col">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.lstNewOrder}" var="o" varStatus="i">
                                        <tr>
                                            <td>${i.count}</td>
                                            <td>${o.orderNameContact}</td>
                                            <td>${o.orderPhoneContact}</td>
                                            <td>${o.orderCreateDate}</td>
                                            <td>${o.orderExpectedDate}</td>
                                            <td><a data-toggle="modal" data-target="#modal-order-detail" href="javascript:void(0)" onclick="getAllOrderDetail(${o.orderId});"><i class="fa-solid fa-eye"></i></a></td>
                                            <td>
                                                <form action="profile" method="post">
                                                    <input type="hidden" name="orderId" value="${o.orderId}">
                                                    <input type="hidden" name="type" value="deleteNewOrder">
                                                    <button type="submit" class="btn"><i class="fa-solid fa-trash text-danger"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!------------------END  MY CERTIFICATE----------------------->
                    </div>
                </div>
            </div>
        </div>

        <!------------------------MODAL CHANGE PASSWORD-------------------------->   
        <%@include file="modal/modal-change-password.jsp" %>
        <!------------------------MODAL CHANGE INFORMATION-------------------------->
        <%@include file="modal/modal-change-information.jsp" %>

         <%@include file="components/footer.jsp" %>
    </body>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script>
                                                $("#home-tab").addClass("active");
                                                $("#home").addClass("show active");
                                                const msgUpdate = '<%= session.getAttribute("msgUpdate") %>';
                                                if (msgUpdate === 'addressContact') {
                                                    $("#home-tab").removeClass("active");
                                                    $("#home").removeClass("show active");
                                                    $("#address-tab").addClass("active");
                                                    $("#address").addClass("show active");
                                                }
                                                if (msgUpdate === 'deleteNewOrder') {
                                                    $("#home-tab").removeClass("active");
                                                    $("#home").removeClass("show active");
                                                    $("#new-order-tab").addClass("active");
                                                    $("#new-order").addClass("show active");
                                                }
    </script>

    <script>
        const msgchangePassword = '<%= session.getAttribute("msgchangePassword") %>';
        if (msgchangePassword !== 'null') {
            var myModal = new bootstrap.Modal(document.getElementById("changePasswordModal"), {});
            document.onreadystatechange = function () {
                myModal.show();
            };
        }
    </script>

    <script>
        const msgchangeInformation = '<%= session.getAttribute("msgchangeInformation") %>';
        if (msgchangeInformation !== 'null') {
            const myModal = new bootstrap.Modal(document.getElementById("changeInformModal"), {});
            document.onreadystatechange = function () {
                myModal.show();
            };
        }
    </script>
    <script>
        function getAllOrderDetail(orderId) {
            const request = new XMLHttpRequest();
            request.open("GET", "api/orderDetail?orderId=" + orderId, true);
            request.onload = function () {
                if (this.readyState === 4 && this.status === 200) {
                    let lstOrderDetailHtml = '';
                    const lstOrderDetail = JSON.parse(this.responseText);
                    let sum = 0;
                    for (let orderDetail of lstOrderDetail) {
                        lstOrderDetailHtml += `
                            <div class="d-flex flex-row mb-4 pb-2">
                                <div class="flex-fill">
                                    <h5 class="bold"><a class="text-danger" href="product-detail?productId=` + orderDetail.productId + `">` + orderDetail.orderDetailProductName + `</a></h5>
                                    <p class="text-muted"> Qt: ` + orderDetail.orderDetailQuantity + ` item</p> 
                                    <p class="text-muted"> Color: ` + orderDetail.orderDetailColorValue + `</p> 

                                    <h4 class="mb-3"><span class="small text-muted"> Unit Price: </span> ` + orderDetail.orderDetailPriceProduct + ` VND</h4>
                                </div>
                                <div>
                                    <img class="align-self-center img-fluid"
                                         src="` + orderDetail.orderDetailProductImg + `" width="250">
                                </div>
                            </div>
                            <hr>
                        `;
                        sum = sum + orderDetail.orderDetailPriceProduct * orderDetail.orderDetailQuantity;
                    }
                    document.getElementById('modal-order-detail-body').innerHTML = lstOrderDetailHtml;
                    document.querySelector('#modal-order-detail .modal-footer').innerHTML = '<h3>Total Money: ' + sum + 'VND</h3>';
                } else {
                    console.log(2);
                }
            };
            request.send(null);
            let myModal = new bootstrap.Modal(document.getElementById("modal-order-detail"), {});
            document.onreadystatechange = function () {
                myModal.show();
            };
        }
    </script>
    <%
        request.getSession().removeAttribute("msgchangePassword");
        request.getSession().removeAttribute("msgchangeInformation");
        request.getSession().removeAttribute("msgUpdate");
    %>
</html>
