<%@include file="../header.jsp"%>

<div class="row" style="height: 700px !important;">
    <div class="col-md-8 col-md-offset-2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h3>Hostel details</h3>
                    <h5>${hostel.address}</h5>
                    <h5>Total rooms number: ${number}</h5>
                    <hr style="border-color: lightblue !important;"/>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table id="hostel" class="table table-striped table-hover table-bordered" class="width-100p">
                                <thead class="panel-center">
                                <tr style="background-color: lightgoldenrodyellow;;">
                                    <td>Room number</td>
                                    <td>Size</td>
                                    <td>Type</td>
                                    <td>Tenants</td>
                                    <td style="width: 20%;" data-orderable="false">Add a new tenant</td>
                                </tr>
                                </thead>
                                <tbody class="panel-center">
                                <c:forEach items="${hostel.rooms}" var="r">
                                    <tr>
                                        <td>
                                            <p>${r.number}</p>
                                        </td>
                                        <td>
                                            <p>${r.size}</p>
                                        </td>
                                        <td>
                                            <c:if test="${r.sex == 1}">
                                                <p>Male</p>
                                            </c:if>
                                            <c:if test="${r.sex == 0}">
                                                <p>Female</p>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:forEach items="${r.students}" var="s">
                                                <p>${s.user.firstname} ${s.user.lastname}
                                                    <button type="button" class="btn btn-xs btn-danger"
                                                            onclick="removeStudentFromRoom('${s.id}','${r.id}');">
                                                        <i class="glyphicon glyphicon-minus-sign" aria-hidden="true"></i>
                                                        Remove
                                                    </button>
                                                </p>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${(r.size-r.students.size()) > 0}">
                                                    <a onclick="rememberRoomId('${r.id}');">
                                                        <button type="button" class="btn btn-xs btn-success"  data-toggle="modal" data-target="#chooseStudent">
                                                            <i class="glyphicon glyphicon-plus-sign" aria-hidden="true"></i>
                                                            Add student
                                                        </button>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <p><font color="red">No free places</font></p>
                                                </c:otherwise>
                                            </c:choose>
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

<div class="modal fade" id="chooseStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add New Qualification Program</h4>
            </div>
            <form onsubmit="setStudentToRoomAndArchiveApp();">
                <div class="modal-body">
                    <div class="form-group">
                        <p><label for="appId">Choose student (from new requests) </label></p>
                        <select id = "appId" required>
                            <c:forEach var="app" items="${apps}">
                                <c:if test="${app.status.id == 1}">
                                    <option value="${app.id}">${app.student.user.firstname} ${app.student.user.lastname}</option>
                                </c:if>
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
        "sScrollY": 375,
        "sScrollX": "100%",
        "sScrollXInner": "100%",
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "bProcessing": true
    };
    $('#hostel').DataTable(default_options);

    function removeStudentFromRoom(studentId, roomId) {
        $.ajax({
            type: "POST",
            url: domainURL + "removeStudentFromRoom",
            dataType: "text",
            async: false,
            data: {studentId: studentId, roomId: roomId},
            timeout: 30000
        }).done(function (data) {
            location.reload();
        }).fail(function (error) {
            alert("Connection error...");
        });
    }

    var roomToSetId = -1;
    function rememberRoomId(id) {
        roomToSetId = id;
    }

    function setStudentToRoomAndArchiveApp(appId) {
        var appId = $("#appId").val();

        $.ajax({
            type: "POST",
            url: domainURL + "setStudentToRoomAndArchiveApp",
            dataType: "text",
            async: false,
            data: {appId: appId, roomToSetId: roomToSetId},
            timeout: 30000
        }).done(function (data) {
            location.reload();
        }).fail(function (error) {
            alert("Connection error...");
        });
    }
</script>

<%@include file="../footer.jsp"%>