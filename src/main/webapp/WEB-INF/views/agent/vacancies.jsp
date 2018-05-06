<%@include file="/WEB-INF/views/header.jsp"%>

<center>
    <button type="button" class="btn btn-md btn-success" data-toggle="modal" data-target="#addVacancyModal">
        <i class="fa fa-plus-circle" aria-hidden="true"></i>
        Add New Vacancy
    </button>
</center>

<div class="container-fluid padding-top-5 padding-bottom-5" style="margin-top: 5px !important;">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel-body">
                        <table id="vacTable" class="table table-striped table-hover table-bordered" class="width-100p">
                            <thead class="panel-center">
                            <tr style="background-color: lightblue;">
                                <td>Title</td>
                                <td>Description</td>
                                <td>End date</td>
                                <td style="width: 10%;" data-orderable="false">Delete</td>
                            </tr>
                            </thead>
                            <tbody class="panel-center">
                            <c:forEach items="${vacancies}" var="v">
                                <tr>
                                    <td>
                                        <p>${v.title}</p>
                                    </td>
                                    <td>
                                        <p>${v.description}</p>
                                    </td>
                                    <td>
                                        <p>${v.endDate}</p>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-xs btn-danger" onclick="deleteVacancy('${v.id}');">
                                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                            Remove
                                        </button>
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



<div class="modal fade" id="addVacancyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">Add Vacancy</h4>
            </div>
            <form onsubmit="addVacancy();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="title">Position</label>
                        <input type="text" class="form-control" maxlength="255" id="title" placeholder="Position name" required />
                        <label for="description">Description</label>
                        <textarea class="form-control" rows="8" id="description" placeholder="Short description" required></textarea>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="endDate">End date</label>
                                <input type="date" class="form-control" id="endDate" required />
                            </div>
                        </div>
                        <label for="faculty">Faculty: </label>
                        <select id = "faculty" class="form-control" required>
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



<script type="text/javascript">
    var default_options = {
        "sScrollY": 400,
        "sScrollX": "100%",
        "sScrollXInner": "100%",
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "bProcessing": true
    };
    $('#vacTable').DataTable(default_options);
    
    function addVacancy() {
        var title = $("#title").val();
        var description = $("#description").val();
        var endDate = $("#endDate").val();
        var facultyId = $("#faculty").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addVacancy",
            dataType: "text",
            async: false,
            data: {title: title, description: description, endDate: endDate, facultyId: facultyId},
            timeout: 30000
        }).done(function (data) {
            location.reload();
        }).fail(function (error) {
            alert("Connection error...");
        });
    }
    
    function deleteVacancy(vacancyId) {
        $.ajax({
            type: "POST",
            url: domainURL + "deleteVacancy",
            dataType: "text",
            async: false,
            data: {vacancyId: vacancyId},
            timeout: 30000
        }).done(function (data) {
            location.reload();
        }).fail(function (error) {
            alert("You can not remove vacancy with students' responses!");
        });
    }
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>