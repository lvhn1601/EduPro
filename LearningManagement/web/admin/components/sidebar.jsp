<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
        <div class="sidebar-brand">
            <h3 class="m-0 text-primary"><a href="../"><i class="fa fa-book me-3"></i>EduPro</a></h3>
        </div>

        <ul class="sidebar-menu pt-3">
            <c:if test="${sessionScope.accountCur.role.id eq 1}">
                <li><a href="#"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                <li><a href="users"><i class="uil uil-user me-2 d-inline-block"></i>Users</a></li>
                <li><a href="subjects"><i class="uil uil-file me-2 d-inline-block"></i>Subjects</a></li>

                <li class="sidebar-dropdown">
                    <a href="javascript:void(0)"><i class="uil uil-setting me-2 d-inline-block"></i>System</a>
                    <div class="sidebar-submenu">
                        <ul>
                            <li><a href="system-setting">Semesters</a></li>
                            <li><a href="system-setting">User roles</a></li>
                            <li><a href="system-setting">Email domains</a></li>
                        </ul>
                    </div>
                </li>
            </c:if>
            
            <c:if test="${sessionScope.accountCur.role.id eq 2}">
                <li><a href="#"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                <li><a href="subject-detail-management"><i class="uil uil-file me-2 d-inline-block"></i>Subjects Setting</a></li>
                <li><a href="question-detail-management"><i class="uil uil-file-question me-2 d-inline-block"></i>Questions</a></li>
                <li><a href="quizzes"><i class="uil uil-lightbulb-alt me-2 d-inline-block"></i>Quizzes</a></li>
                <li><a href="lessons"><i class="uil uil-file-landscape-alt me-2 d-inline-block"></i>Lessons</a></li>
            </c:if>
            
        </ul>
        <!-- sidebar-menu  -->
    </div>
</nav>
<!-- sidebar-wrapper  -->