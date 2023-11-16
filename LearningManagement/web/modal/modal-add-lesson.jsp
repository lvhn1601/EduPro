<div id="addLessonModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Lesson</h4>
                <a  style="cursor: pointer"
                    data-bs-dismiss="modal"
                    ><i class="fa-solid fa-xmark"></i></a>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="layout-specing">                        
                        <div class="row">
                            <div class="col-lg-12 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <div class="row align-items-center">
                                        <div class="col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h4 class="">Lesson Details</h4>
                                        </div><!--end col-->
                                    </div><!--end row-->

                                    <form class="mt-4" action="lesson-details?action=${param.action}" method="post" onsubmit="return checkEmpty();">
                                        <input type="number" name="lesson-id" value="${lesson.id}" style="display: none"/>
                                        <div class="row">                                                                                       
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Title:</label>
                                                    <input name="title" id="title" type="text" class="form-control" placeholder="Lesson title..." value="${lesson.title}">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Lesson Type:</label>
                                                    <div class="d-flex ms-4">
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2 type-video" value="Video" checked ${lesson.type eq 'Video' ? 'checked' : ''} onchange="switchLessonType()">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Video
                                                            </label>
                                                        </div>

                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2 type-quiz" value="Quiz" ${lesson.type eq 'Quiz' ? 'checked' : ''} onchange="switchLessonType()">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Quiz
                                                            </label>
                                                        </div>
                                                        <div class="form-check pe-4">
                                                            <input class="form-check-input" type="radio" name="type" id="flexRadioDefault2 type-assignment" value="Quiz" ${lesson.type eq 'Assigment' ? 'checked' : ''} onchange="switchLessonType()">
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                Assignment
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!--end col-->                                           
                                        </div><!--end row-->

                                        <div class="tab-content mt-2 m-4" id="pills-tabContent">
                                            <!--assignment tab start-->
                                            <div class="tab-pane fade show" id="tab-assignment" role="tabpanel">
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Title:</label>
                                                        <input name="video" id="video" type="text" class="form-control" placeholder="" value="${lesson.video_link}">
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Description:</label>
                                                        <textarea name="description" id="description" class="form-control" placeholder="Description" rows="5">${lesson.description}</textarea>
                                                    </div>
                                                </div><!--end col-->
                                            </div>
                                            <!--assignment tab end-->
                                            <!--video tab start-->
                                            <div class="tab-pane fade show active" id="tab-video" role="tabpanel">
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Video link:</label>
                                                        <input name="video" id="video" type="text" class="form-control" placeholder="https://www.youtube.com/..." value="${lesson.video_link}">
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Description:</label>
                                                        <textarea name="description" id="description" class="form-control" placeholder="Description" rows="5">${lesson.description}</textarea>
                                                    </div>
                                                </div><!--end col-->
                                            </div>
                                            <!--video tab end-->

                                            <!--quiz tab start-->
                                            <div class="tab-pane fade show" id="tab-quiz" role="tabpanel">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Parent Quiz:</label>
                                                            <select name="quiz" id="quiz" class="form-control department-name select2input bg-white">

                                                            </select>
                                                        </div>
                                                    </div><!--end col-->

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Duration:</label>
                                                            <select name="duration" class="form-control department-name select2input bg-white">
                                                                <option value="90" ${lesson.duration == 90 ? 'selected' : ''}>90 mins</option>
                                                                <option value="60" ${lesson.duration == 60 ? 'selected' : ''}>60 mins</option>
                                                                <option value="45" ${lesson.duration == 45 ? 'selected' : ''}>45 mins</option>
                                                                <option value="30" ${lesson.duration == 30 ? 'selected' : ''}>30 mins</option>
                                                                <option value="15" ${lesson.duration == 15 ? 'selected' : ''}>15 mins</option>
                                                            </select>
                                                        </div>
                                                    </div><!--end col-->

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Value to Pass:</label>
                                                            <input name="pass-val" id="pass-val" type="number" class="form-control" value="${lesson.passValue}">
                                                        </div>
                                                    </div><!--end col-->

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label class="form-label">Max. Attempt:</label>
                                                            <input name="max-attempt" id="max-attempt" type="number" class="form-control" value="${lesson.maxAttempt}">
                                                        </div>
                                                    </div><!--end col-->
                                                </div>
                                            </div>
                                            <!--quiz tab end-->
                                        </div>

                                        <div id="error-mess" style="color: red">${error}</div>

                                        <button type="submit" id="submit-btn" class="btn btn-primary mt-4">${param.action eq 'add' ? 'Add' : 'Save'}</button>
                                    </form>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let subid = document.getElementById('subject').value;
    updateDatas(subid);
    switchLessonType();

    function updateDatas(sid) {
        updateListChapters(sid);
        updateListQuizzes(sid);
    }

    function updateListChapters(sid) {
        let chapterSelect = document.getElementById('chapter');

        chapterSelect.innerHTML = "";

        fetch('getDatas?table=chapter&subject=' + sid)
                .then(response => {
                    if (response.ok)
                        return response.json();
                })
                .then(data => {
                    data.forEach(item => {
                        var option = document.createElement("option");
                        option.value = item.id;
                        option.text = item.title;
                        option.selected = (item.id == ${lesson.chapter.id eq null ? 0 : lesson.chapter.id});
                        chapterSelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.log('Error: ' + error);
                });
    }

    function updateListQuizzes(sid) {
        let quizSelect = document.getElementById('quiz');

        quizSelect.innerHTML = "";

        fetch('getDatas?table=quiz&subject=' + sid)
                .then(response => {
                    if (response.ok)
                        return response.json();
                })
                .then(data => {
                    data.forEach(item => {
                        var option = document.createElement("option");
                        option.value = item.id;
                        option.text = item.title;
                        option.selected = (item.id == ${lesson.quiz.id eq null ? 0 : lesson.quiz.id});
                        quizSelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.log('Error: ' + error);
                });
    }

    function switchLessonType() {
        let type = document.getElementById('flexRadioDefault2 type-video').checked;
        let type1 = document.getElementById('flexRadioDefault2 type-quiz').checked;
        let type2 = document.getElementById('flexRadioDefault2 type-assignment').checked;

        let tabVideo = document.getElementById('tab-video');
        let tabQuiz = document.getElementById('tab-quiz');
        let tabAssignment = document.getElementById('tab-assignment');

        if (type) {
            tabVideo.classList.add("active");
            tabQuiz.classList.remove("active");
            tabAssignment.classList.remove("active");
        }
        if (type1) {
            tabQuiz.classList.add("active");
            tabVideo.classList.remove("active");
            tabAssignment.classList.remove("active");
        }
        if (type2) {
            tabAssignment.classList.add("active");
            tabVideo.classList.remove("active");
            tabQuiz.classList.remove("active");
        }
    }

    function statusLabel(checkbox) {
        let label = document.getElementById("lblStatus");
        if (checkbox.checked)
            label.innerHTML = "Published";
        else
            label.innerHTML = "Unpublished";
    }

    const title_box = document.getElementById('title');
    const video_check = document.getElementById('flexRadioDefault2 type-video');
    const error_text = document.getElementById('error-mess');

    function checkEmpty() {
        let title = title_box.value;
        let video = video_check.checked;

        if (title.trim() == '') {
            error_text.textContent = "You must input Title!";
            return false;
        }

        if (video) {
            let video_link = document.getElementById('video').value;

            if (video_link.trim() == '') {
                error_text.textContent = "You must input video link for lesson!";
                return false;
            }
        } else {
            var passVal = document.getElementById("pass-val").value;
            if (passVal.trim() == '') {
                error_text.textContent = "You must input Value to Pass!";
                return false;
            }

            var maxAttempt = document.getElementById("max-attempt").value;
            if (maxAttempt.trim() == '') {
                error_text.textContent = "You must input Max. Attempt!";
                return false;
            }
        }

        error_text.textContent = "";
        return true;
    }
</script>
