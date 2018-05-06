<%@include file="/WEB-INF/views/header.jsp"%>

<div class="row" style="height: 700px !important;">
    <div class="col-md-10 col-md-offset-1">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-9">
                    <h3>${clazz.discipline.name}, ${clazz.classType.type}, ${clazz.date}</h3>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btn-lg btn-success" data-toggle="modal" data-target="#addStudentsModal">
                        <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        Add Students
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-11">
                            <h3>Grades </h3>
                            <hr style="border-color: lightblue !important;"/>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <table id="gradesTable" class="table table-striped table-hover table-bordered" class="width-100p">
                                        <thead class="panel-center">
                                        <tr style="background-color: #BDBDBD;;">
                                            <td style="width: 20%">Student</td>
                                            <td>Presence</td>
                                            <td>Grade</td>
                                            <td style="width: 10%" data-orderable="false">Set Presence</td>
                                            <td style="width: 15%" data-orderable="false">Add/Change Grade</td>
                                        </tr>
                                        </thead>
                                        <tbody class="panel-center">
                                        <c:forEach items="${grades}" var="g">
                                            <tr>
                                                <td>
                                                    <p>${g.student.user.firstname} ${g.student.user.lastname}</p>
                                                </td>
                                                <td>
                                                    <c:if test="${g.presence == 1}">
                                                        <span class="glyphicon glyphicon-ok"></span>
                                                    </c:if>
                                                    <c:if test="${g.presence == 0}">
                                                        <span class="glyphicon glyphicon-remove"></span>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <p>${g.mark}</p>
                                                </td>
                                                <td>
                                                    <a onclick="rememberStudentId('${g.student.id}');">
                                                        <button type="button" class="btn btn-xs btn-primary" onclick=""
                                                                data-toggle="modal" data-target="#managePresence">
                                                            <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                                                            Presence
                                                        </button>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a onclick="rememberStudentId('${g.student.id}');">
                                                        <button type="button" class="btn btn-xs btn-primary" onclick=""
                                                                data-toggle="modal" data-target="#manageGrade">
                                                            <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                                                            Grade
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="addStudentsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel0">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel0">Add Students</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="facultyId">Faculty: </label>
                    <select id = "facultyId" class="form-control" required>
                        <c:forEach var="faculty" items="${faculties}">
                            <option value="${faculty.id}">${faculty.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="year">Course: </label>
                    <select id = "year" class="form-control" required>
                        <c:forEach var="year" items="${years}">
                            <option value="${year}">${year}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-warning" onclick="showStudents('${clazz.id}');">Show</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="studentsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">Choose Students</h4>
            </div>
            <div class="modal-body">
                <div class="form-group" >
                    <div id="studentsList">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-warning" onclick="location.reload();">Close and show</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="managePresence" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">Set Presence</h4>
            </div>
            <form onsubmit="setPresence('${clazz.id}');">
                <div class="modal-body">
                    <div class="form-group">
                        <select id = "isPresent" required>
                            <option value="1">Present</option>
                            <option value="0">Absent</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="manageGrade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel3">Set Grade</h4>
            </div>
            <form onsubmit="setGrade('${clazz.id}');">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="number" min="0" max="100"  id="grade" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script type="text/javascript">
    var default_options = {
        "sScrollY": 250,
        "sScrollX": "100%",
        "sScrollXInner": "100%",
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "bProcessing": true
    };
    $('#gradesTable').DataTable(default_options);

    function showStudents(classId) {
        var facultyId = $("#facultyId").val();
        var year = $("#year").val();

        $.ajax({
            cache: false,
            timeout: 60000,
            url: domainURL + "/getNotYetAddedToClassStudents/" + classId + "/" + facultyId +"/" + year,
            method: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "text json"
        })
            .done(function(tools) {
                $('#studentsList').empty();
                var result = '';
                var all = '';
                var enrolledIds = new Array();
                result += '<div class="row">';
                tools.forEach(function(item) {
                    enrolledIds.push(item.id);
                    result += '<div class="col-md-4">';
                    result += '<label class="checkbox-inline" id="'+item.id+'">';
                    result += '<input type="checkbox" onchange="addStudentToClass('+item.id+', '+classId+');" >';
                    result += item.user.firstname;
                    result += " "+item.user.lastname;
                    result += ' </label>';
                    result += '</div>';
                });
                result += '</div>';
                $('#studentsList').append(result);
                $('#addStudentsModal').modal('hide');
                $('#studentsModal').modal('show');
            })
            .fail(function() {
                alert("ERROR!!!");
            });
    }

    function addStudentToClass(studentId, classId) {
        $.ajax({
            type: "POST",
            url: domainURL + "addStudentToClass",
            dataType: "text",
            async: false,
            data: {studentId: studentId, classId: classId},
            timeout: 30000
        }).done(function (data) {
            document.getElementById(studentId).style.display = "none";
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    var selectedStudentId = -1;
    function rememberStudentId(id) {
        selectedStudentId = id;
    }

    function setPresence(classId) {
        var isPresent = $("#isPresent").val();

        $.ajax({
            type: "POST",
            url: domainURL + "setStudentClassPresence",
            dataType: "text",
            async: false,
            data: {classId: classId, studentId: selectedStudentId, isPresent: isPresent},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function setGrade(classId) {
        var grade = $("#grade").val();

        $.ajax({
            type: "POST",
            url: domainURL + "setStudentClassGrade",
            dataType: "text",
            async: false,
            data: {classId: classId, studentId: selectedStudentId, grade: grade},
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