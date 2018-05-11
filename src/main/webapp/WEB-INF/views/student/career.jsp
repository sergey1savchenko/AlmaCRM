<%@include file="/WEB-INF/views/header.jsp"%>

<div class="container-fluid padding-top-20">
    <div class="container-fluid">
        <div class="row panel-center"  style="margin: 5px !important;">
            <div class="main-panel padding-bottom-20">
                <div class="row padding-20 panel-center">
                    <div class="col-md-5" style="background-color: #F5F5F5 !important; margin-left: 25px !important;">
                        <h3>Vacancies for your faculty: </h3>
                        <hr style="border-color: lightblue !important;"/>
                        <table id="vacTable" class="table table-striped table-hover table-bordered" class="width-100p">
                            <thead class="panel-center">
                            <tr style="background-color: #c3e8fa;">
                                <td>Vacancy</td>
                                <td>Description</td>
                                <td>Deadline</td>
                                <td>Company</td>
                                <td data-orderable="false" style="width: 10%;">Apply</td>
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
                                        <p>${v.agent.company}</p>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${map[v.id]}">
                                                Already applied
                                            </c:when>
                                            <c:otherwise>
                                                <a onclick="rememberVacancyId('${v.id}');">
                                                    <button type="button" class="btn btn-xs btn-primary"  data-toggle="modal" data-target="#applyModal">
                                                        <i class="glyphicon glyphicon-plus-sign" aria-hidden="true"></i>
                                                        Apply
                                                    </button>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6" style="background-color: #F5F5F5 !important; margin-left: 50px !important;">
                        <h3>Qualification Programs: </h3>
                        <hr style="border-color: lightblue !important;"/>
                        <table id="qpTable" class="table table-striped table-hover table-bordered" class="width-100p">
                            <thead class="panel-center">
                            <tr style="background-color: #c3e8fa;">
                                <td>Program</td>
                                <td>Description</td>
                                <td>Company</td>
                                <td>Skills</td>
                            </tr>
                            </thead>
                            <tbody class="panel-center">
                            <c:forEach items="${qualificationPrograms}" var="q">
                                <tr>
                                    <td>
                                        <p>${q.name}</p>
                                    </td>
                                    <td>
                                        <p>${q.description}</p>
                                    </td>
                                    <td>
                                        <p>${q.agent.company}</p>
                                    </td>
                                    <td>
                                        <c:forEach items="${q.skills}" var="s">
                                            <c:choose>
                                                <c:when test="${skillMap[s.id]}">
                                                    <font color="green">${s.name}</font>
                                                </c:when>
                                                <c:otherwise>
                                                    <font color="red">${s.name}</font> (<a onclick="showDisciplines('${s.id}');">Disciplines</a>)
                                                </c:otherwise>
                                            </c:choose>
                                            <br/>
                                        </c:forEach>
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

<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel0">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel0">Provide your short CV</h4>
            </div>
            <form onsubmit="sendAppToVac();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="cv">Your main accomplishments</label>
                        <textarea id="cv" cols="79" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Send</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="disciplines" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">Disciplines with this skill: </h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div id="dList"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var default_options = {
        "sScrollY": 475,
        "sScrollX": "100%",
        "sScrollXInner": "100%",
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "bProcessing": true,
        "order": [[ 2, "asc" ]]
    };
    $('#vacTable').DataTable(default_options);
    var default_options_1 = {
        "sScrollY": 475,
        "sScrollX": "100%",
        "sScrollXInner": "100%",
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "bProcessing": true,
    };
    $('#qpTable').DataTable(default_options_1);

    var vacancyId = -1;
    function rememberVacancyId(vacId) {
        vacancyId = vacId;
    }

    function sendAppToVac() {
        var cv = $("#cv").val();

        $.ajax({
            type: "POST",
            url: domainURL + "sendAppToVac",
            dataType: "text",
            async: false,
            data: {cv: cv, vacancyId: vacancyId},
            timeout: 30000
        }).done(function (data) {
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error...");
            document.location.reload();
        });
    }

    function showDisciplines(skillId) {
        $.ajax({
            cache: false,
            timeout: 60000,
            url: domainURL + "/getDisciplinesBySkill/" + skillId,
            method: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: "text json"
        })
            .done(function(tools) {
                $('#dList').empty();
                var result = '';
                result += '<div class="row">';
                tools.forEach(function(item) {
                    result += '<div class="col-md-4">';
                    result += '<p><strong>'+item.name+'</strong>, '+item.specialty.name+'</p>';
                    result += '</div>';
                });
                result += '</div>';
                $('#dList').append(result);
                $('#disciplines').modal('show');
            })
            .fail(function() {
                alert("Connection error...");
            });
    }
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>