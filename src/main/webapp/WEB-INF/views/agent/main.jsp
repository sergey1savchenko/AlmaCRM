<%@include file="/WEB-INF/views/header.jsp"%>

<center>
    <button type="button" class="btn btn-md btn-success" data-toggle="modal" data-target="#addProgramModal" style="margin-bottom:10px !important;">
        <i class="fa fa-plus-circle" aria-hidden="true"></i>
        Add New Program
    </button>
    <button type="button" class="btn btn-md btn-primary" data-toggle="modal" data-target="#findStudentsModal" style="margin-bottom:10px !important;">
        <i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i>
        Find Students By Skills
    </button>
</center>

<div class="container-fluid padding-top-5 padding-bottom-5" style="margin-top: 5px !important;">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="wrap">
                <main>
                    <aside>
                        <h3>Last news</h3>
                        <hr style="border-color: lightblue !important;"/>
                        <c:forEach var="temp" items="${news}">
                            <p><strong>${temp.title}</strong></p>
                            <p>${temp.text}</p>
                            <p>Posted by ${temp.author.firstname} ${temp.author.lastname}, ${temp.date}</p>
                            <hr/>
                        </c:forEach>
                    </aside>
                    <aside>
                        <h3>Students responses</h3>
                        <hr style="border-color: lightblue !important;"/>
                        <c:forEach var="response" items="${responses}">
                            <p>${response.vacancy.title} (${response.status.status})</p>
                            <p>${response.resume}</p>
                            <p><a onclick="loadStudentShowModal('${response.student.id}');">${response.student.user.firstname} ${response.student.user.lastname}</a> (${response.student.faculty.name}, ${response.student.course})</p>
                            <c:if test="${response.status.status != 'archived'}">
                                <a onclick="markResponseArchived('${response.id}');"><button class="btn btn-sm btn-success">Archive</button></a>
                            </c:if>
                            <hr/>
                        </c:forEach>
                    </aside>
                    <aside>
                        <h3>Questions from students</h3>
                        <hr style="border-color: lightblue !important;"/>
                        <c:forEach var="q" items="${questionFromStudents}">
                            <p><a onclick="loadStudentShowModal('${q.student.id}');">${q.student.user.firstname} ${q.student.user.lastname}</a> (${q.status.status})</p>
                            <p>${q.text}</p>
                            <p>Faculty: ${q.student.faculty.name}</p>
                            <c:if test="${q.status.status != 'archived'}">
                                <a onclick="markQuestionArchived('${q.id}');"><button class="btn btn-sm btn-success">Archive</button></a>
                            </c:if>
                            <hr/>
                        </c:forEach>
                    </aside>
                </main>
            </div>
        </div>
    </div>
</div>

<!-- Student Details Modal -->
<div class="modal fade" id="skillsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">Student details</h4>
            </div>
            <div class="modal-body">
                <div id="info"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Find Students Modal -->
<div class="modal fade" id="findStudentsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabe2">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">Find Students</h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-md-6">
                        <h4>Choose skills</h4>
                        <c:forEach var="skill" items="${allSkills}">
                            <p>
                                <label class="checkbox-inline" onclick="searchIds('${skill.id}', '${skill.name}');" id="find${skill.id}">
                                    <a>${skill.name}</a>
                                </label>
                            </p>
                        </c:forEach>
                    </div>
                    <div class="col-md-6">
                        <h4>Choosen Skills: </h4>
                        <div id="choosenSkills"></div>
                    </div>
                </div>
                <button type="button" class="btn btn-default" onclick="find();">Find</button>
                <hr/>
                <div id="students"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload();">Close</button>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="addProgramModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add New Qualification Program</h4>
            </div>
            <form onsubmit="addProgram();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="pTitle">Title</label>
                        <input type="text" class="form-control" maxlength="255" id="pTitle" placeholder="Position name" required />
                        <label for="pDescription">Description</label>
                        <textarea class="form-control" rows="8" id="pDescription" placeholder="Short description" required></textarea>
                        <label>Skills: </label>
                            <c:forEach var="skill" items="${allSkills}">
                                <a onclick="addId('${skill.id}');" id="${skill.id}">
                                    <p><label class="checkbox-inline">
                                        <input type="checkbox"> ${skill.name}
                                    </label></p>
                                </a>
                            </c:forEach>
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



<script type="text/javascript">
    var sIds = [];
    function searchIds(id, name) {
        sIds.push(id);
        document.getElementById('find'+id).style.display = "none";
        $('#choosenSkills').append('<p>'+name+' </p>');
    }
    function find() {
        var skillsIdsString = sIds.toString();
        $('#students').empty();

        $.ajax({
            cache: false,
            timeout: 60000,
            url: domainURL + "/findStudentsBySkillsId/" + skillsIdsString,
            method: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "text json"
        }).done(function(students) {
            var result = '';
            students.forEach(function (student) {
                result += '<hr/>';
                result += '<p><strong>' + student.user.firstname + ' ' + student.user.patronymic + ' ' + student.user.lastname + '</strong></p>';
                result += '<p>' + student.user.email + ', ' + student.user.phone + '</p>';
                result += '<p>' + 'Year: ' + student.course + '</p>';
                result += '<p>' + 'Skills: ';
                result += student.skillsAsString;
                result += '</p>';
            });
            $('#students').append(result);
        }).fail(function() {
            alert("ERROR");
            document.location.reload();
        });
    }

    var ids = [];
    function addId(id) {
        ids.push(id);
        document.getElementById(id).style.display = "none";
    }
    function addProgram() {
        var pTitle = $("#pTitle").val();
        var pDescription = $("#pDescription").val();
        var newProgramId = -1;

        $.ajax({
            type: "POST",
            url: domainURL + "addNewProgram",
            dataType: "text",
            async: false,
            data: {pTitle: pTitle, pDescription: pDescription},
            timeout: 30000
        }).done(function (data) {
            newProgramId = data;
        }).fail(function (error) {
            alert("Connection error...");
            location.reload();
        });

        //alert(newProgramId);

        ids.forEach(function(skillId) {
            $.ajax({
                type: "POST",
                url: domainURL + "setSkillToProgram",
                dataType: "text",
                async: false,
                data: {skillId: skillId, newProgramId: newProgramId},
                timeout: 30000
            }).done(function (data) {
            }).fail(function (error) {
                alert("Connection error...");
                location.reload();
            });
        });
    }

    function markResponseArchived(responseId){
        $.ajax({
            type: "POST",
            url: domainURL + "markResponseArchived",
            dataType: "text",
            async: false,
            data: {responseId: responseId},
            timeout: 30000
        }).done(function (data) {
            location.reload();
        }).fail(function (error) {
            alert("Connection error...");
        });
    }

    function markQuestionArchived(questionId) {
        $.ajax({
            type: "POST",
            url: domainURL + "markQuestionArchived",
            dataType: "text",
            async: false,
            data: {questionId: questionId},
            timeout: 30000
        }).done(function (data) {
            location.reload();
        }).fail(function (error) {
            alert("Connection error...");
        });
    }

    function loadStudentShowModal(studentId) {
        $.ajax({
            cache: false,
            timeout: 60000,
            url: domainURL + "/getStudentInfo/" + studentId,
            method: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "text json"
        }).done(function(student) {
            $('#info').empty();
            var result = '';
            result += '<p>' + student.user.firstname + ' ' + student.user.patronymic + ' ' + student.user.lastname + '</p>';
            result += '<p>' + student.user.email + ', ' + student.user.phone + '</p>';
            result += '<p>' + 'Year: ' + student.course + '</p>';
            result += '<p>' + 'Skills: ';
            result += student.skillsAsString;
            result += '</p>';
            $('#info').append(result);
            $('#skillsModal').modal('show');
        }).fail(function() {
            alert("ERROR");
            document.location.reload();
        });
    }
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>