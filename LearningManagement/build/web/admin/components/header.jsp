<div class="top-header">
    <div class="header-bar d-flex justify-content-between border-bottom">
        <div class="d-flex align-items-center">
            <h4 class="m-0 text-primary"><a href="../">EduPro</a></h4>
            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                <i class="uil uil-bars"></i>
            </a>
        </div>

        <ul class="list-unstyled mb-0">

            <li class="list-inline-item mb-0 ms-1">
                <div class="dropdown dropdown-primary">
                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${sessionScope.accountCur.avatar_url}" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                        <a class="dropdown-item d-flex align-items-center text-dark" href="#">
                            <img src="${sessionScope.accountCur.avatar_url}" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                            <div class="flex-1 ms-2">
                                <span class="d-block mb-1">${sessionScope.accountCur.name}</span>
                                <small class="text-muted">${sessionScope.accountCur.role.title}</small>
                            </div>
                        </a>
                        <a class="dropdown-item text-dark" href="../profile"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> View Profile </a>
                        <div class="dropdown-divider border-top"></div>
                        <a class="dropdown-item text-dark" href="lock-screen.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>