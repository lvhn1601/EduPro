<div class="modal" id="classDetailModal" tabindex="-1" role="dialog">
    <div class="modal-dialog custom-modal modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Class Detail</h4>
                <a style="cursor: pointer" data-bs-dismiss="modal"><i class="fa-solid fa-xmark"></i></a>
            </div>
            <div class="modal-body">
                <p id="error-mess" style="color: red">${sessionScope.msgUpdateClass}</p>
                <form action="/LearningManagement/manager/class" method="post" id="form-class-detail">
                    <input type="hidden" name="type" value="updateClassDetail">
                    <input type="hidden" name="subjectId" id="subjectId" value="">

                    <div class="form-group mt-4">
                        <label for="className">Class Name:</label>
                        <input type="text" class="form-control" id="className" name="className" value="AI-1578"/>
                    </div>

                    <div class="form-group mt-4">
                        <label for="classSubject">Subject:</label>
                        <select class="form-control" id="classSubject" name="classSubject">
                            <option>Elementary Japanese 1-A1.1</option>
                            <c:forEach items="${listSubject}" var="ls">
                                <option value="${ls.id}">${ls.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group mt-4">
                        <label for="classSemester">Semester:</label>
                        <select class="form-control" id="classSemester" name="classSemester">
                            <option>SPRING-2023</option>
                            <c:forEach items="${listSemester}" var="l">
                                <option value="${l.id}">${l.title}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group mt-4">
                        <label for="classTrainer">Trainer:</label>
                        <select class="form-control" id="classTrainer" name="classTrainer">
                            <option>duytn@gmail.com</option>
                            <c:forEach items="${listTrainer}" var="t">
                                <option value="${t.id}">${t.email} - ${t.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group mt-4">
                        <label for="classStart">Date Start:</label>
                        <input type="date" class="form-control" id="classStart" name="classStart" required />
                    </div>

                    <div class="form-group mt-4">
                        <label for="classEnd">Date End:</label>
                        <input type="date" class="form-control" id="classEnd" name="classEnd" required />
                    </div>

                    <div class="form-group mt-4">
                        <label>Status:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="classStatus" id="active" value="active" checked>
                            <label class="form-check-label" for="active">Active</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="classStatus" id="inactive" value="inactive">
                            <label class="form-check-label" for="inactive">Inactive</label>
                        </div>
                    </div>

                    <br>

                    <button type="submit" class="btn btn-primary btn-sm" style="width: 100%; border: none; height: 45px">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
