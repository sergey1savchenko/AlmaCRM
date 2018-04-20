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
                                        <textarea rows="8" cols="41" id="newsText" required></textarea>
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
                                                <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#addClassModal">
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
                                            <a class="btn btn-xs btn-primary" onclick="showDisciplines('${student.id}');">
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
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>