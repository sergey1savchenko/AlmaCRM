<%@include file="/WEB-INF/views/header.jsp"%>

<!-- Buttons -->
<div class="container-fluid padding-top-20">
    <div class="row panel-center">
        <div class="col-md-10 col-md-offset-1 main-panel padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
            <div class="main-panel padding-bottom-20">
                <div class="row padding-20 panel-center">
                    <center>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addStudentModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Add Student
                        </button>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addTeacherModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Add Teacher
                        </button>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addAgentModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Add Company Representative
                        </button>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addWorkerModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Add Housing Worker
                        </button>
                    </center>
                </div>
            </div>
        </div>
    </div>
    <div class="row panel-center"  style="margin: 5px !important;">
        <div class="col-md-10 col-md-offset-1 main-panel padding-top-10 padding-bottom-10 padding-left-10 padding-right-10" >
            <div class="main-panel padding-bottom-20">
                <div class="row padding-20 panel-center">
                    <center>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addFacultyModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Add Faculty
                        </button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSpecialtyModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Add Specialty
                        </button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addDisciplineModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Add Discipline
                        </button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#teacherDisciplineModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Set Teacher to Discipline
                        </button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#hostelRoomModal">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                            Add Hostel or Room
                        </button>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Main body -->
<div class="container-fluid padding-top-5 padding-bottom-5" style="margin-top: 5px !important;">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="wrap">
                <main>
                    <aside>
                        <h3>Add news</h3>
                        <hr style="border-color: lightblue !important;"/>
                        <form onsubmit="addNews();">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="newsTitle">Title</label>
                                    <input type="text" class="form-control" maxlength="255" id="newsTitle" required />
                                </div>
                                <div class="form-group">
                                    <label for="newsText">Text</label>
                                    <textarea rows="8" cols="64" id="newsText" required></textarea>
                                </div>
                                <div class="form-group">
                                    Faculty:
                                    <select id = "newsFaculty" required>
                                        <option value="-1">All (Home page)</option>
                                        <c:forEach var="faculty" items="${faculties}">
                                            <option value="${faculty.id}">${faculty.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    For whom (user role):
                                    <select id = "newsRoleId" required>
                                        <option value="-1">All (Home page)</option>
                                        <c:forEach var="role" items="${roles}">
                                            <c:if test="${role.role != 'ADMIN'}">
                                                <option value="${role.id}">${role.role}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-default">Add</button>
                            </div>
                        </form>
                    </aside>
                    <aside>
                        <h3>Error reports</h3>
                        <hr style="border-color: lightblue !important;"/>
                        <c:forEach var="report" items="${reports}">
                            <p>${report.text}</p>
                            <p>by: ${report.authorName}, email: ${report.email}</p>
                            <hr/>
                        </c:forEach>
                    </aside>
                    <aside>
                        <h3>Questions from applicants</h3>
                        <hr style="border-color: lightblue !important;"/>
                        <c:forEach var="app" items="${apps}">
                            <p>${app.title} (${app.faculty.name})</p>
                            <p>${app.text}</p>
                            <p>by: ${app.authorName}, email: ${app.email}</p>
                            <hr/>
                        </c:forEach>
                    </aside>
                </main>
            </div>
        </div>
    </div>
</div>



<!-- Modals -->
<div class="modal fade" id="addFacultyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel0">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel0">Add Faculty</h4>
            </div>
            <form onsubmit="addFaculty();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="newFacultyName">Enter a new faculty name</label>
                        <input type="text" class="form-control" maxlength="255" id="newFacultyName"
                               placeholder="faculty name" required />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="addSpecialtyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">Add Specialty</h4>
            </div>
            <form onsubmit="addSpecialty();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="newSpecialtyName">Enter a new specialty name</label>
                        <input type="text" class="form-control" maxlength="255" id="newSpecialtyName"
                               placeholder="specialty name" required />
                    </div>
                    Choose faculty
                    <select id = "facultyId" required>
                        <c:forEach var="faculty" items="${faculties}">
                            <option value="${faculty.id}">${faculty.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="addDisciplineModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">Add Discipline</h4>
            </div>
            <form onsubmit="addDiscipline();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="newDisciplineName">Enter a new discipline name</label>
                        <input type="text" class="form-control" maxlength="255" id="newDisciplineName"
                               placeholder="discipline name" required />
                    </div>
                    Choose specialty
                    <select id = "specialtyId" required>
                        <c:forEach var="specialty" items="${specialties}">
                            <option value="${specialty.id}">${specialty.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="addStudentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel3">Add Student</h4>
            </div>
            <form onsubmit="addStudent();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="studentEmail">Email</label>
                        <input type="email" class="form-control" maxlength="255" id="studentEmail" placeholder="email" required />
                        <label for="studentPassword">Password</label>
                        <input type="password" class="form-control" maxlength="255" id="studentPassword" placeholder="password" required />
                        <label for="studentFirstname">First name</label>
                        <input type="text" class="form-control" maxlength="255" id="studentFirstname" placeholder="" required />
                        <label for="studentPatronymic">Patronymic</label>
                        <input type="text" class="form-control" maxlength="255" id="studentPatronymic" placeholder="" required />
                        <label for="studentLastname">Last name</label>
                        <input type="text" class="form-control" maxlength="255" id="studentLastname" placeholder="" required />
                        <label for="studentPhone">Phone number</label>
                        <input type="number" class="form-control" maxlength="255" id="studentPhone" placeholder="+380961234567" required />
                        <div class="row">
                            <div class="col-md-6">
                                <label for="studentDateOfBirth">Date of birth</label>
                                <input type="date" class="form-control" id="studentDateOfBirth" required />
                            </div>
                            <div class="col-md-6">
                                <label for="studentEntryDate">Entry date</label>
                                <input type="date" class="form-control" id="studentEntryDate" required />
                            </div>
                        </div>
                        <label for="studentSex">Sex: </label>
                        <select id = "studentSex" class="form-control" required>
                            <option value="1">male</option>
                            <option value="0">female</option>
                        </select>
                        <label for="studentCourse">Course: </label>
                        <select id = "studentCourse" class="form-control" required>
                            <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option>
                        </select>
                        <label for="studentFacultyId">Faculty: </label>
                        <select id = "studentFacultyId" class="form-control" required>
                            <c:forEach var="faculty" items="${faculties}">
                                <option value="${faculty.id}">${faculty.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="addTeacherModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel4">Add Teacher</h4>
            </div>
            <form onsubmit="addTeacher();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="teacherEmail">Email</label>
                        <input type="email" class="form-control" maxlength="255" id="teacherEmail" placeholder="email" required />
                        <label for="teacherPassword">Password</label>
                        <input type="password" class="form-control" maxlength="255" id="teacherPassword" placeholder="password" required />
                        <label for="teacherFirstname">First name</label>
                        <input type="text" class="form-control" maxlength="255" id="teacherFirstname" placeholder="" required />
                        <label for="teacherPatronymic">Patronymic</label>
                        <input type="text" class="form-control" maxlength="255" id="teacherPatronymic" placeholder="" required />
                        <label for="teacherLastname">Last name</label>
                        <input type="text" class="form-control" maxlength="255" id="teacherLastname" placeholder="" required />
                        <label for="teacherPhone">Phone number</label>
                        <input type="number" class="form-control" maxlength="255" id="teacherPhone" placeholder="+380961234567" required />
                        <label>Hours for consultations: </label>
                        <textarea id="hoursForConsultations" rows="4" cols="80" required></textarea>
                        <label for="studentFacultyId">Faculty: </label>
                        <select id = "teacherFacultyId" class="form-control" required>
                            <c:forEach var="faculty" items="${faculties}">
                                <option value="${faculty.id}">${faculty.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="addAgentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel5">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel5">Add Agent</h4>
            </div>
            <form onsubmit="addAgent();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="agentEmail">Email</label>
                        <input type="email" class="form-control" maxlength="255" id="agentEmail" placeholder="email" required />
                        <label for="agentPassword">Password</label>
                        <input type="password" class="form-control" maxlength="255" id="agentPassword" placeholder="password" required />
                        <label for="agentFirstname">First name</label>
                        <input type="text" class="form-control" maxlength="255" id="agentFirstname" placeholder="" required />
                        <label for="agentPatronymic">Patronymic</label>
                        <input type="text" class="form-control" maxlength="255" id="agentPatronymic" placeholder="" required />
                        <label for="agentLastname">Last name</label>
                        <input type="text" class="form-control" maxlength="255" id="agentLastname" placeholder="" required />
                        <label for="agentPhone">Phone number</label>
                        <input type="number" class="form-control" maxlength="255" id="agentPhone" placeholder="+380961234567" required />
                        <label for="agentCompany">Company name</label>
                        <input type="text" class="form-control" maxlength="255" id="agentCompany" placeholder="" required />
                        <label>Short description: </label>
                        <textarea id="companyDescription" rows="4" cols="80" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="addWorkerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel6">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel6">Add Worker</h4>
            </div>
            <form onsubmit="addWorker();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="workerEmail">Email</label>
                        <input type="email" class="form-control" maxlength="255" id="workerEmail" placeholder="email" required />
                        <label for="workerPassword">Password</label>
                        <input type="password" class="form-control" maxlength="255" id="workerPassword" placeholder="password" required />
                        <label for="workerFirstname">First name</label>
                        <input type="text" class="form-control" maxlength="255" id="workerFirstname" placeholder="" required />
                        <label for="workerPatronymic">Patronymic</label>
                        <input type="text" class="form-control" maxlength="255" id="workerPatronymic" placeholder="" required />
                        <label for="workerLastname">Last name</label>
                        <input type="text" class="form-control" maxlength="255" id="workerLastname" placeholder="" required />
                        <label for="workerPhone">Phone number</label>
                        <input type="number" class="form-control" maxlength="255" id="workerPhone" placeholder="+380961234567" required />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="teacherDisciplineModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel7">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel7">Connect teacher to discipline</h4>
            </div>
            <form onsubmit="teacherDiscipline();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="teacher">Choose teacher </label>
                        <select id = "teacher" required>
                            <c:forEach var="teacher" items="${teachers}">
                                <option value="${teacher.id}">${teacher.user.firstname} ${teacher.user.lastname}</option>
                            </c:forEach>
                        </select><br/>
                        <label for="discipline">Choose discipline </label>
                        <select id = "discipline" required>
                            <c:forEach var="discipline" items="${disciplines}">
                                <option value="${discipline.id}">${discipline.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="hostelRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel8">Add Hostel and Rooms</h4>
            </div>
            <form onsubmit="addHostel();">
                <div class="modal-body">
                    <h3>Add Hostel</h3>
                    <div class="form-group">
                        <label for="hostelAddress">Address</label>
                        <input type="text" class="form-control" maxlength="255" id="hostelAddress"
                               placeholder="address" required />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Add Hostel</button>
                </div>
            </form>
            <c:if test="${hostels.size() > 0}">
                <form onsubmit="addRoom();">
                    <div class="modal-body">
                        <h3>Add Room</h3>
                        <div class="form-group">
                            <label for="roomNumber">Number</label>
                            <input type="number" class="form-control" maxlength="255" id="roomNumber" placeholder="" required />
                            <label for="roomNumber">Size</label>
                            <input type="number" class="form-control" maxlength="255" id="roomSize" placeholder="" required /><br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="roomSex">Choose room type</label>
                                    <select id = "roomSex" required>
                                        <option value="1">male</option>
                                        <option value="0">female</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="hostelId">Choose hostel</label>
                                    <select id = "hostelId" required>
                                        <c:forEach var="hostel" items="${hostels}">
                                            <option value="${hostel.id}">${hostel.address}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-warning">Add Room</button>
                    </div>
                </form>
            </c:if>
        </div>
    </div>
</div>

<script type="text/javascript">
    function addFaculty() {
        var name = $("#newFacultyName").val();
        $.ajax({
            type: "POST",
            url: domainURL + "addNewFaculty",
            dataType: "text",
            async: false,
            data: {name: name},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addSpecialty() {
        var name = $("#newSpecialtyName").val();
        var facultyId = $("#facultyId").val();
        $.ajax({
            type: "POST",
            url: domainURL + "addNewSpecialty",
            dataType: "text",
            async: false,
            data: {name: name, facultyId: facultyId},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addDiscipline() {
        var name = $("#newDisciplineName").val();
        var specialtyId = $("#specialtyId").val();
        $.ajax({
            type: "POST",
            url: domainURL + "addNewDiscipline",
            dataType: "text",
            async: false,
            data: {name: name, specialtyId: specialtyId},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addStudent() {
        var studentEmail = $("#studentEmail").val();
        var studentPassword = $("#studentPassword").val();
        var studentFirstname = $("#studentFirstname").val();
        var studentPatronymic = $("#studentPatronymic").val();
        var studentLastname = $("#studentLastname").val();
        var studentPhone = $("#studentPhone").val();

        var studentDateOfBirth = $("#studentDateOfBirth").val();
        var studentSex = $("#studentSex").val();
        var studentEntryDate = $("#studentEntryDate").val();
        var studentCourse = $("#studentCourse").val();
        var studentFacultyId = $("#studentFacultyId").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addNewStudent",
            dataType: "text",
            async: false,
            data: {studentEmail: studentEmail,
                studentPassword: studentPassword,
                studentFirstname: studentFirstname,
                studentPatronymic: studentPatronymic,
                studentLastname: studentLastname,
                studentPhone: studentPhone,
                studentDateOfBirth: studentDateOfBirth,
                studentSex: studentSex,
                studentEntryDate: studentEntryDate,
                studentCourse: studentCourse,
                studentFacultyId: studentFacultyId},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addTeacher() {
        var teacherEmail = $("#teacherEmail").val();
        var teacherPassword = $("#teacherPassword").val();
        var teacherFirstname = $("#teacherFirstname").val();
        var teacherPatronymic = $("#teacherPatronymic").val();
        var teacherLastname = $("#teacherLastname").val();
        var teacherPhone = $("#teacherPhone").val();

        var hoursForConsultations = $("#hoursForConsultations").val();
        var teacherFacultyId = $("#teacherFacultyId").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addNewTeacher",
            dataType: "text",
            async: false,
            data: {teacherEmail: teacherEmail,
                teacherPassword: teacherPassword,
                teacherFirstname: teacherFirstname,
                teacherPatronymic: teacherPatronymic,
                teacherLastname: teacherLastname,
                teacherPhone: teacherPhone,
                hoursForConsultations: hoursForConsultations,
                teacherFacultyId: teacherFacultyId},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addAgent() {
        var agentEmail = $("#agentEmail").val();
        var agentPassword = $("#agentPassword").val();
        var agentFirstname = $("#agentFirstname").val();
        var agentPatronymic = $("#agentPatronymic").val();
        var agentLastname = $("#agentLastname").val();
        var agentPhone = $("#agentPhone").val();

        var agentCompany = $("#agentCompany").val();
        var companyDescription = $("#companyDescription").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addNewAgent",
            dataType: "text",
            async: false,
            data: {agentEmail: agentEmail,
                agentPassword: agentPassword,
                agentFirstname: agentFirstname,
                agentPatronymic: agentPatronymic,
                agentLastname: agentLastname,
                agentPhone: agentPhone,
                agentCompany: agentCompany,
                companyDescription: companyDescription},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addWorker() {
        var workerEmail = $("#workerEmail").val();
        var workerPassword = $("#workerPassword").val();
        var workerFirstname = $("#workerFirstname").val();
        var workerPatronymic = $("#workerPatronymic").val();
        var workerLastname = $("#workerLastname").val();
        var workerPhone = $("#workerPhone").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addNewWorker",
            dataType: "text",
            async: false,
            data: {workerEmail: workerEmail,
                workerPassword: workerPassword,
                workerFirstname: workerFirstname,
                workerPatronymic: workerPatronymic,
                workerLastname: workerLastname,
                workerPhone: workerPhone},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function teacherDiscipline() {
        var teacherId = $("#teacher").val();
        var disciplineId = $("#discipline").val();
        $.ajax({
            type: "POST",
            url: domainURL + "setTeacherDiscipline",
            dataType: "text",
            async: false,
            data: {teacherId: teacherId, disciplineId: disciplineId},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addHostel() {
        var hostelAddress = $("#hostelAddress").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addNewHostel",
            dataType: "text",
            async: false,
            data: {hostelAddress: hostelAddress},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addRoom() {
        var roomNumber = $("#roomNumber").val();
        var roomSize = $("#roomSize").val();
        var roomSex = $("#roomSex").val();
        var hostelId = $("#hostelId").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addNewRoom",
            dataType: "text",
            async: false,
            data: {roomNumber: roomNumber, roomSize: roomSize,
                    roomSex: roomSex, hostelId: hostelId},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function addNews() {
        var newsTitle = $("#newsTitle").val();
        var newsText = $("#newsText").val();
        var newsFaculty = $("#newsFaculty").val();
        var newsRoleId = $("#newsRoleId").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addNewNews",
            dataType: "text",
            async: false,
            data: {newsTitle: newsTitle, newsText: newsText,
                newsFaculty: newsFaculty, newsRoleId: newsRoleId},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

</script>

<%@include file="/WEB-INF/views/footer.jsp"%>