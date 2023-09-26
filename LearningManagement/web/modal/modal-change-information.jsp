<div id="changeInformModal" class="modal fade" role="dialog">
    <div class="modal-dialog" U>
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Change Information</h4>
                <a  style="cursor: pointer"
                    data-bs-dismiss="modal"
                    ><i class="fa-solid fa-xmark"></i></a>
            </div>
            <div class="modal-body">
                <p  id="error-mess" style="color: red">${sessionScope.msgchangeInformation}</p>
                <form action="profile" method="post" id="form-change-nformation">
                    <input type="hidden" name="type" value="changeInformation">
                    <div class="form-group mt-4">
                        <label for="name"> Name:</label>
                        <input
                            type="text"
                            class="form-control"
                            id="name"
                            name="accountName"
                            value="${sessionScope.accountCur.name}"
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="email"> Email:</label>
                        <input
                            type="email"
                            class="form-control"
                            id="email"
                            name="accountEmail"
                            value="${sessionScope.accountCur.email}"
                            />
                         <input
                             type="hidden"
                            class="form-control"
                            name="currentEmail"
                            value="${sessionScope.accountCur.email}"
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="phone"> Phone: </label>
                        <input
                            type="text"
                            class="form-control"
                            id="phone"
                            name="accountPhone"
                            value="${sessionScope.accountCur.phone}"
                            />
                         <input
                             type="hidden"
                            class="form-control"
                            name="currentPhone"
                            value="${sessionScope.accountCur.phone}"
                            />
                    </div>
                    <div class="form-group mt-4">
                        <label for="dob"> Date of Birth:</label>
                        <input
                            type="date"
                            class="form-control"
                            id="dob"
                            name="accountDob"
                            value="${sessionScope.accountCur.dob}"
                            />
                    </div>

                    <button
                        type="button"
                        onclick="checkEmpty()"
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

