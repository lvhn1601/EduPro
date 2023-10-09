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
                <form action="profile" method="post" id="reused_form">
                    <input type="hidden" name="type" value="changeAvatar">
                    <div class="form-group mt-4">
                        <label for="avatar_url"> </label>
                        <input
                            type="text"
                            class="form-control"
                            id="avatar_url"
                            name="accoutAvatarUrl"
                            value="${sessionScope.accountCur.avatar_url}"
                            />
                    </div>            
                    <button
                        type="submit"
                        class="btn-grad mt-3"
                        id="btnChangeInf"
                        style="width: 100%; border: none"
                        >
                        Submit
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>