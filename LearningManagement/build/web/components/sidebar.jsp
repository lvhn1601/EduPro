<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
        <div class="sidebar-brand d-flex align-items-center">
            <img src="/LearningManagement/assets/img/LogoFPT.png" class="h-100"/>
        </div>

        <ul class="sidebar-menu pt-3">
            <c:if test="${sessionScope.accountCur.role.id eq 1}">
                <!--<li><a href="#"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>-->
                <li><a href="/LearningManagement/admin/users"><i class="uil uil-user me-2 d-inline-block"></i>Users</a></li>
                <li><a href="/LearningManagement/admin/subjects"><i class="uil uil-file me-2 d-inline-block"></i>Subjects</a></li>

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
                <li><a href="/LearningManagement/manager/subject-list"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                <li><a href="/LearningManagement/manager/question-detail-management"><i class="uil uil-file-question me-2 d-inline-block"></i>Questions</a></li>
                <li><a href="/LearningManagement/manager/quizzes"><i class="uil uil-lightbulb-alt me-2 d-inline-block"></i>Quizzes</a></li>
                <li><a href="/LearningManagement/manager/lessons"><i class="uil uil-file-landscape-alt me-2 d-inline-block"></i>Lessons</a></li>
                <li><a href="/LearningManagement/manager/class"><i class="uil uil-users-alt me-2 d-inline-block"></i>Classes</a></li>
            </c:if>
                
            <c:if test="${sessionScope.accountCur.role.id eq 3}">
                <li><a href="/LearningManagement/dashboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                <c:if test="${classList != null}">
                    <div class="mb-0 position-relative w-75 ms-4">
                        <select class="form-control bg-white rounded-md" onchange="changeClass(this.value)">
                                <c:forEach items="${classList}" var="c">
                                    <option value="${c.class_id}" ${c.class_id == classId ? 'selected' : ''}>${c.class_name}</option>
                                </c:forEach>
                        </select>
                    </div>
                </c:if>
                <c:if test="${classId != null}">
                    <li class="sidebar-dropdown active">
                        <a href="javascript:void(0)"><i class="uil uil-apps me-2 d-inline-block"></i>Class Materials</a>
                        <div class="sidebar-submenu d-block">
                            <ul>
                                <c:forEach items="${materials}" var="m">
                                    <li><a href="/LearningManagement/class-dashboard?subject=${param.subject}&classid=${classId}&chapter=${m.display_order}">${m.title}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </li>
                    <li><a href="/LearningManagement/assignment?subject=${param.subject}&classId=${classId}"><i class="il uil-files-landscapes-alt me-2 d-inline-block"></i>Assignments</a></li>
                    <li><a href="/LearningManagement/trainee/assignment-submited?subject=${param.subject}&classId=${classId}"><i class="uil uil-table me-2 d-inline-block"></i>Grades</a></li>
                    <li><a href="#"><i class="uil uil-comments-alt me-2 d-inline-block"></i>Discussions</a></li>
                    <!--<li><a href="/LearningManagement/practice-quizzes?classid=${param.classid}"><i class="uil uil-swatchbook me-2 d-inline-block"></i>Practice Quizzes</a></li></ul>-->
                </c:if>
                <li><a href="/LearningManagement/trainer/class-trainee"><i class="uil uil-users-alt me-2 d-inline-block"></i>Trainee</a></li>
            </c:if>
                
            <c:if test="${sessionScope.accountCur.role.id eq 4}">
                <li><a href="/LearningManagement/dashboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                <c:if test="${classList != null}">
                    <div class="mb-0 position-relative w-75 ms-4">
                        <select class="form-control bg-white rounded-md">
                                <c:forEach items="${classList}" var="c">
                                    <option value="${c.class_id}" ${c.class_id == classId ? 'selected' : ''}>${c.class_name}</option>
                                </c:forEach>
                        </select>
                    </div>
                </c:if>
                <c:if test="${classId != null}">
                    <li class="sidebar-dropdown active">
                        <a href="javascript:void(0)"><i class="uil uil-apps me-2 d-inline-block"></i>Class Materials</a>
                        <div class="sidebar-submenu d-block">
                            <ul>
                                <c:forEach items="${materials}" var="m">
                                    <li><a href="/LearningManagement/class-dashboard?subject=${param.subject}&classid=${classId}&chapter=${m.display_order}">${m.title}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </li>
                    <li><a href="/LearningManagement/assignment?subject=${param.subject}&classId=${classId}"><i class="il uil-files-landscapes-alt me-2 d-inline-block"></i>Assignments</a></li>
                    <li><a href="/LearningManagement/trainee/assignment-submited?subject=${param.subject}&classId=${classId}"><i class="uil uil-table me-2 d-inline-block"></i>Grades</a></li>
                    <li><a href="#"><i class="uil uil-comments-alt me-2 d-inline-block"></i>Discussions</a></li>
                    <!--<li><a href="/LearningManagement/practice-quizzes?classid=${param.classid}"><i class="uil uil-swatchbook me-2 d-inline-block"></i>Practice Quizzes</a></li></ul>-->
                </c:if>
            </c:if>
        </ul>
        <!-- sidebar-menu  -->
    </div>
</nav>

<script>
    function changeClass(classId) {
        location.href = "/LearningManagement/class-dashboard?subject=${param.subject}&classid=" + classId;
    }
</script>
<!-- sidebar-wrapper  -->