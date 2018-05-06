<%@include file="../header.jsp"%>

<div class="row" style="height: 700px !important;">
    <div class="col-md-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h3>Hostels </h3>
                    <hr style="border-color: lightblue !important;"/>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table id="hostels" class="table table-striped table-hover table-bordered" class="width-100p">
                                <thead class="panel-center">
                                <tr style="background-color: #BDBDBD;;">
                                    <td>Hostel Address</td>
                                    <td>Free places</td>
                                    <td style="width: 20%;" data-orderable="false">Go to hostel</td>
                                </tr>
                                </thead>
                                <tbody class="panel-center">
                                <c:forEach items="${hostels}" var="h">
                                    <tr>
                                        <td>
                                            <p>${h.address}</p>
                                        </td>
                                        <td>
                                            <p>${h.free}</p>
                                        </td>
                                        <td>
                                            <a href="/worker/hostel/${h.id}">
                                                <button type="button" class="btn btn-xs btn-primary">
                                                    <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                                                    Manage
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
    <div class="col-md-7">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h3>Requests from students </h3>
                    <hr style="border-color: lightblue !important;"/>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table id="apps" class="table table-striped table-hover table-bordered" class="width-100p">
                                <thead class="panel-center">
                                <tr style="background-color: #BDBDBD;;">
                                    <td>Student</td>
                                    <td>Reason</td>
                                    <td>Wishes</td>
                                    <td style="width: 20%;">Status</td>
                                </tr>
                                </thead>
                                <tbody class="panel-center">
                                <c:forEach items="${apps}" var="app">
                                    <tr>
                                        <td>
                                            <p>${app.student.user.firstname} ${app.student.user.lastname}</p>
                                            <p>${app.student.faculty.name}, ${app.student.course}</p>
                                        </td>
                                        <td>
                                            <p>${app.info}</p>
                                        </td>
                                        <td>
                                            <p>${app.wanted}</p>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${app.status.id == '2'}">
                                                    <font color="#ff7f50">archived</font>
                                                </c:when>
                                                <c:otherwise>
                                                    <p><font color="green">NEW</font></p>
                                                    <button type="button" class="btn btn-xs btn-info" onclick="archive(${app.id});">
                                                        Archive
                                                    </button>
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
    <div class="col-md-8 col-md-offset-2">
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
    $('#hostels').DataTable(default_options);
    $('#apps').DataTable(default_options);

    function archive(roomChangeAppId) {
        $.ajax({
            type: "POST",
            url: domainURL + "markRoomChangeAppIdArchived",
            dataType: "text",
            async: false,
            data: {roomChangeAppId: roomChangeAppId},
            timeout: 30000
        }).done(function (data) {
            location.reload();
        }).fail(function (error) {
            alert("Connection error...");
        });
    }
</script>

<%@include file="../footer.jsp"%>