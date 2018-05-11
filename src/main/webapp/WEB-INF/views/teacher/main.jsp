<%@include file="/WEB-INF/views/header.jsp"%>

<div class="row" style="height: 700px !important;">
    <div class="col-md-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <h3>Last News </h3>
                    <hr style="border-color: lightblue !important;"/>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <c:forEach var="temp" items="${news}">
                                <p><strong>${temp.title}</strong></p>
                                <p>${temp.text}</p>
                                <p>Posted by ${temp.author.firstname} ${temp.author.lastname}, ${temp.date}</p>
                                <hr/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <p><strong>Add News </strong></p>
                            <hr style="border-color: lightblue !important;"/>
                            <form onsubmit="addNews();">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="newsTitle">Title</label>
                                        <input type="text" class="form-control" maxlength="255" id="newsTitle" required />
                                    </div>
                                    <div class="form-group">
                                        <label for="newsText">Text</label>
                                        <textarea rows="8" cols="47" id="newsText" required></textarea>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-11">
                    <h3>My Disciplines </h3>
                    <hr style="border-color: lightblue !important;"/>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table id="disciplineTable" class="table table-striped table-hover table-bordered" class="width-100p">
                                <thead class="panel-center">
                                <tr style="background-color: #BDBDBD;;">
                                    <td>Discipline</td>
                                    <td>Specialty</td>
                                    <td style="width: 15%;" data-orderable="false">Add Classes</td>
                                    <td style="width: 10%;" data-orderable="false">Skills</td>
                                </tr>
                                </thead>
                                <tbody class="panel-center">
                                <c:forEach items="${disciplines}" var="d">
                                    <tr>
                                        <td>
                                            <p>${d.name}</p>
                                        </td>
                                        <td>
                                            <p>${d.specialty.name}</p>
                                        </td>
                                        <td>
                                            <a onclick="rememberDisciplineId('${d.id}');">
                                                <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#addClassModal">
                                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                                    Add Class
                                                </button>
                                            </a>
                                        </td>
                                        <td>
                                            <a onclick="rememberDisciplineId('${d.id}');">
                                                <button type="button" class="btn btn-xs btn-primary" onclick="loadDataShowModal('${d.id}');">
                                                    <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                                                    Manage Skills
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-11">
                    <h3>My Classes </h3>
                    <hr style="border-color: lightblue !important;"/>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table id="classTable" class="table table-striped table-hover table-bordered" class="width-100p">
                                <thead class="panel-center">
                                <tr style="background-color: #BDBDBD;;">
                                    <td style="width: 20%">Date</td>
                                    <td>Discipline</td>
                                    <td>Type</td>
                                    <td>Information</td>
                                    <td style="width: 10%" data-orderable="false">Class</td>
                                </tr>
                                </thead>
                                <tbody class="panel-center">
                                <c:forEach items="${classes}" var="c">
                                    <tr>
                                        <td>
                                            <p>${c.date}</p>
                                        </td>
                                        <td>
                                            <p>${c.discipline.name}</p>
                                        </td>
                                        <td>
                                            <p>${c.classType.type}</p>
                                        </td>
                                        <td>
                                            <p>${c.info}</p>
                                        </td>
                                        <td>
                                            <a class="btn btn-xs btn-primary" href="<c:url value="/teacher/showClass/${c.id}"/>">
                                                <i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i>
                                                Class page
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



<div class="modal fade" id="addClassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel0">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel0">Create Class</h4>
            </div>
            <form onsubmit="addClass();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="classInfo">Information</label>
                        <input type="text" class="form-control" maxlength="255" id="classInfo" value="Additional information" required />
                    </div>
                    <div class="form-group">
                        Choose class type
                        <select id = "classType" required>
                            <c:forEach var="type" items="${classTypes}">
                                <option value="${type.id}">${type.type}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="classDate">Date</label>
                        <input type="date" class="form-control" id="classDate" required />
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

<!-- SKILLS -->
<div class="modal fade" id="skillsModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Discipline skills</h4>
            </div>
            <div class="modal-body">
                <div id="setted"></div>
                <hr/>
                <div id="notSetted"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
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
    $('#disciplineTable').DataTable(default_options);
    $('#classTable').DataTable(default_options);

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

    var addClassDisciplineId = -1;
    function rememberDisciplineId(disciplineId) {
        addClassDisciplineId = disciplineId;
    }

    function addClass() {
        var classDisciplineId = addClassDisciplineId;
        var classInfo = $("#classInfo").val();
        var classTypeId = $("#classType").val();
        var classDate = $("#classDate").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addNewClass",
            dataType: "text",
            async: false,
            data: {classDisciplineId: classDisciplineId, classInfo: classInfo,
                classTypeId: classTypeId, classDate: classDate},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            document.location.reload();
        });
    }

    function loadDataShowModal(disciplineId) {

        var allSkills = new Array();
        <c:forEach items="${allSkills}" var="skill">
        var temp = {
            id: ${skill.id},
            name: '${skill.name}'
        };
        allSkills.push(temp);
        </c:forEach>

        $.ajax({
            cache: false,
            timeout: 60000,
            url: domainURL + "/getDisciplineSkills/" + disciplineId,
            method: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "text json"
        })
            .done(function(tools) {
                $('#setted').empty();
                $('#notSetted').empty();
                var result = '';
                var all = '';
                var enrolledIds = new Array();
                result += '<div class="row">';
                tools.forEach(function(item) {
                    enrolledIds.push(item.id);
                    result += '<div class="col-md-4">';
                    result += '<label class="checkbox-inline">';
                    result += '<input type="checkbox" onchange="changeSkillState('+item.id+', '+disciplineId+', false);" id="'+item.id+'" checked>';
                    result += item.name;
                    result += ' </label>';
                    result += '</div>';
                });
                result += '</div>';
                all += '<div class="row">';
                allSkills.forEach(function(entry) {
                    if(enrolledIds.indexOf(entry.id) < 0){
                        all += '<div class="col-md-4">';
                        all += '<label class="checkbox-inline">';
                        all += '<input type="checkbox" onchange="changeSkillState('+entry.id+', '+disciplineId+', true);" id="'+entry.id+'">';
                        all += entry.name;
                        all += ' </label>';
                        all += '</div>';
                    }
                });
                all += '</div>';
                $('#setted').append(result);
                $('#notSetted').append(all);
                $('#skillsModal').modal('show');
            })
            .fail(function() {
                alert("ERROR");
                document.location.reload();
            });
    }

    function changeSkillState(skill, discipline, state) {
        if(state){          // SET
            $.ajax({
                type: "POST",
                url: domainURL + "setSkillToDiscipline",
                dataType: "text",
                async: false,
                data: {skillId: skill, disciplineId: discipline},
                timeout: 30000
            }).done(function (data) {
            }).fail(function (error) {
                alert("Connection error...");
            });
        }else{              // UNSET
            $.ajax({
                type: "POST",
                url: domainURL + "removeSkillFromDiscipline",
                dataType: "text",
                async: false,
                data: {skillId: skill, disciplineId: discipline},
                timeout: 30000
            }).done(function (data) {
            }).fail(function (error) {
                alert("Connection error...");
            });
        }
        loadDataShowModal(discipline);
    }
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>