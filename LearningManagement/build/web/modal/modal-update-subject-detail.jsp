<style>
    
    
    .modal-content {
        padding: 20px;
    }

    .close {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 20px;
        cursor: pointer;
    }

    h2 {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 5px;
    }

    input,
    textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    button {
        background-color: #06BBCC;
        color: #fff;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background-color: #007A8D;
    }
.custom-modal {
    
    width: 2000px;
    margin: auto;
}

.custom-modal .modal-content {
    max-height: 600px;
    width: 1000px;
}
</style>


<div class="modal fade" id="chapterModal" tabindex="-1" role="dialog" aria-labelledby="chapterModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="chapterModalLabel">Chapter </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- N?i dung modal -->
                <form action="subject-detail-management?action=update-chapter" method="post">
                    <input type="hidden" name="subjectId" id="subjectId" value="">
                    <input type="hidden" id="chapterId" name="id" value="">
                    <div class="form-group">
                        <label for="chapterTitle">Title:</label>
                        <input type="text" class="form-control" id="chapterTitle" name="title" placeholder="Title">
                    </div>
                    <div class="form-group">
                        <label for="chapterDescription">Description:</label>
                        <textarea class="form-control" id="chapterDescription" name="description" rows="3" placeholder="Description"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Status:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="activeChapter" value="active">
                            <label class="form-check-label" for="activeChapter">Active</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="inactiveChapter" value="inactive">
                            <label class="form-check-label" for="inactiveChapter">Inactive</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="dimensionModal" tabindex="-1" role="dialog">
    <div class="modal-dialog custom-modal modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="dimensionTitleh3">Dimension</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="dimensionForm" action="subject-detail-management?action=update-dimension" method="post">
                    <input type="hidden" name="subjectId" id="subjectIdx" value="">
                    <input type="hidden" name="id" id="dimensionId" value="">
                    <div class="form-group">
                        <label for="dimensionTitle">Type:</label>
                        <input type="text" class="form-control" id="dimensionTitle" name="title" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="dimensionName">N</label>
                        <input  type="text" class="form-control" id="dimensionName" name="name"></input>
                    </div>
                    <div class="form-group">
                        <label for="dimensionDescription">Description:</label>
                        <textarea class="form-control" id="dimensionDescription" name="description"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Status:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="activeDimension" name="status" value="active">
                            <label class="form-check-label" for="activeDimension">Active</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="inactiveDimension" name="status" value="inactive">
                            <label class="form-check-label" for="inactiveDimension">Inactive</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>
