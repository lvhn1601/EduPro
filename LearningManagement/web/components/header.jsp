<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .slide-in {
        animation: slideIn 0.5s forwards;
    }

    .slide-out {
        animation: slideOut 0.5s forwards;
    }

    @keyframes slideIn {
        from {
            transform: translateX(100%);
        }
        to {
            transform: translateX(0);
        }
    }

    @keyframes slideOut {
        from {
            transform: translateX(0);
        }
        to {
            transform: translateX(100%);
        }
    }
</style>

<div class="top-header">
    <div class="header-bar d-flex justify-content-between border-bottom">
        <c:if test="${sessionScope.accountCur == null}">
            <h4 class="m-0 text-primary"><a href="/LearningManagement/"><img src="/LearningManagement/assets/img/logo.png" class="img-fluid avatar avatar-md-sm rounded"> EduPro</a></h4>
            <a href="sign-in" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Join Now<i class="fa fa-arrow-right ms-3"></i></a>
            </c:if>

        <c:if test="${sessionScope.accountCur != null}">
            <div class="d-flex align-items-center">
                <h4 class="m-0 text-primary"><a href="/LearningManagement/"><img src="/LearningManagement/assets/img/logo.png" class="img-fluid avatar avatar-md-sm rounded"> EduPro</a></h4>
                <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                    <i class="uil uil-bars"></i>
                </a>
            </div>

            <ul class="list-unstyled mb-0">
                <li class="list-inline-item mb-0 ms-1">
                    <div class="dropdown dropdown-primary">
                        <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${sessionScope.accountCur.avatar_url}" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                        <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                            <a class="dropdown-item d-flex align-items-center text-dark" href="/LearningManagement/profile">
                                <img src="${sessionScope.accountCur.avatar_url}" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                <div class="flex-1 ms-2">
                                    <span class="d-block mb-1">${sessionScope.accountCur.name}</span>
                                    <small class="text-muted">${sessionScope.accountCur.role.title}</small>
                                </div>
                            </a>
                            <div class="dropdown-divider border-top"></div>
                            <a class="dropdown-item text-dark" href="/LearningManagement/log-out"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                        </div>
                    </div>
                </li>
            </ul>
        </c:if>
    </div>
    
    <c:if test="${alert != null}">
        <div class="alert alert-${alert.type ? 'success' : 'danger'} alert-dismissible fade show slide-in position-absolute end-0 mt-3 me-2 h-75" id="auto-close-alert" role="alert">
            <div class="pe-3"><strong>${alert.type ? 'Success' : 'Fail'}!</strong> ${alert.message}</div>
            <button type="button" class="btn-close btn-sm p-2" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
</div>

<script>
    setTimeout(function() {
            var alert = document.getElementById('auto-close-alert');
            if (alert != undefined) {
                alert.classList.remove('slide-in');
                alert.classList.add('slide-out');
                setTimeout(function() {
                    alert.remove();
                }, 1000);
            }
        }, 3000);
</script>