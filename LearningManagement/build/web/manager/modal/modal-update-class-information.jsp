<c:forEach items="${requestScope.listClass}" var="c">
    <div class="modal fade" id="classDetailModal${c.class_id}" tabindex="-1" role="dialog">
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
                        <input type="hidden" name="classId" id="classId" value="${c.class_id}">

                        <div class="form-group mt-4">
                            <label for="className">Class Name:</label>
                            <input type="text" class="form-control" id="className" name="className" value="${c.class_name}" pattern="^[A-Z]{2}\d{4}$"/>
                        </div>
                        <div class="form-group mt-4">
                            <label for="classSubject">Subject:</label>
                            <select class="form-control" id="classSubject" name="classSubject">
                                <c:forEach items="${listSubject}" var="ls">
                                    <option value="${ls.id}" ${ls.name == c.class_subject_name ? 'selected' : ''}>${ls.name}</option>
                                </c:forEach>
                            </select>
                        </div>


                        <div class="form-group mt-4">
                            <label for="classSemester">Semester:</label>
                            <select class="form-control" id="classSemester" name="classSemester">
                                <c:forEach items="${listSemester}" var="l">
                                    <option value="${l.id}" ${l.title == c.class_semester_name ? 'selected' : ''}>${l.title}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group mt-4">
                            <label for="classTrainer">Trainer:</label>
                            <select class="form-control" id="classTrainer" name="classTrainer">
                                <c:forEach items="${listTrainer}" var="t">
                                    <option value="${t.id}" ${t.email == c.class_trainer_name ? 'selected' : ''}>${t.email} - ${t.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group mt-4">
                            <label for="classStart">Date Start:</label>
                            <input type="date" class="form-control" id="classStart" name="classStart" value="${c.class_start}" />
                        </div>

                        <div class="form-group mt-4">
                            <label for="classEnd">Date End:</label>
                            <input type="date" class="form-control" id="classEnd" name="classEnd" value="${c.class_end}" />
                        </div>

                        <div class="form-group mt-4">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="classStatus" id="active" value="true" ${c.class_status == 'true' ? 'checked' : ''}>
                                <label class="form-check-label" for="active">Active</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="classStatus" id="inactive" value="false" ${c.class_status == 'false' ? 'checked' : ''}>
                                <label class="form-check-label" for="inactive">Inactive</label>
                            </div>
                        </div>
                        <br>
                        <c:if test="${c.update_by != null && c.update_at != null}">
                            <ul class="list-unstyled mb-0">
                                <li>
                                    <em class="text-muted mb-0" id="info-update-by">Last update by ${c.update_by}</em>
                                    <em class="text-muted" id="info-update-at"> at ${c.update_at} </em>
                                </li>
                            </ul>
                        </c:if>

                        <br>

                        <button type="submit" class="btn btn-primary btn-sm" style="width: 100%; border: none; height: 45px">Change</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

