<div id="addClassModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Class</h4>
                <a  style="cursor: pointer"
                    data-bs-dismiss="modal"
                    ><i class="fa-solid fa-xmark"></i></a>
            </div>
            <div class="modal-body">
                <p  id="error-mess" style="color: red">${sessionScope.msgAddClass}</p>
                <form action="/LearningManagement/manager/class" method="post" id="form-add-class">
                    <input type="hidden" name="type" value="addClass">
                    <div class="form-group mt-9">
                        <label for="className"> Class Name:</label>
                        <input
                            type="text"
                            class="form-control"
                            id="className"
                            name="className"
                            value=""
                            required=""
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="subject"> Subject: </label>
                        <select class="form-control" id="subject" name="subject">
                            <c:forEach items="${listSubject}" var="ls">
                                <option value="${ls.id}">${ls.name}</option>
                            </c:forEach> 
                        </select>       
                    </div>
                    <div class="form-group mt-4">
                        <label for="semester"> Semester: </label>
                        <select class="form-control" id="semester" name="semester">
                            <c:forEach items="${listSemester}" var="l">
                                <option value="${l.id}">${l.title}</option>
                            </c:forEach> 
                        </select>                     
                    </div>
                    <div class="form-group mt-4">
                        <label for="trainer"> Trainer: </label>
                        <select class="form-control" id="trainer" name="trainer">
                            <c:forEach items="${listTrainer}" var="t">
                                <option value="${t.id}">${t.email} - ${t.name}</option>
                            </c:forEach> 
                        </select>       
                    </div>
                    <div class="form-group mt-4">
                        <label for="dateStart">Date Start:</label>
                        <input
                            type="date"
                            class="form-control"
                            id="dateStart"
                            name="dateStart"
                            value=""
                           required=""
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="dateEnd">Date End:</label>
                        <input
                            type="date"
                            class="form-control"
                            id="dateEnd"
                            name="dateEnd"
                            value=""
                            required=""
                            />
                    </div>

                    <div class="form-group mt-4">

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="status" id="status" value="active" checked="">
                            <label class="form-check-label" for="active">Active</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="status" id="status" value="inactive" >
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

