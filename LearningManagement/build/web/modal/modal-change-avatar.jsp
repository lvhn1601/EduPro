
<div id="changeAvatarModal" class="modal fade" role="dialog">
    <div class="modal-dialog" U>
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Change Avatar</h4>
                <a  style="cursor: pointer"
                    data-bs-dismiss="modal"
                    ><i class="fa-solid fa-xmark"></i></a>
            </div>
            <div class="modal-body">
                <p style="color: red">${sessionScope.msgchangeAvatar}</p>             
                <form action="profile" method="post" id="reused_form"  enctype="multipart/form-data">
                    <input type="hidden" name="type" value="changeAvatar">
                    <input type="hidden" name="accountId" value="${sessionScope.accountCur.id}">
                    <div class="form-group mt-4">
                        <label for="file"> </label>
                        <input type="file" name="file" size="60" />
                    </div>            
                    <button
                        type="submit"
                        class="btn-grad mt-3"
                        id="btnChangeInf"
                        style="width: 100%; border: none"
                        >
                        Upload
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>