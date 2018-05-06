<%@include file="/WEB-INF/views/header.jsp"%>

<div class="row" style="height: 700px !important;">
    <div class="col-md-2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
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
    <div class="col-md-5" style="background-color: #F5F5F5 !important;">
        <h3>My Grades </h3>
        <hr style="border-color: lightblue !important;"/>
        <table id="gradesTable" class="table table-striped table-hover table-bordered" class="width-100p">
            <thead class="panel-center">
            <tr style="background-color: #c3e8fa;">
                <td>Discipline</td>
                <td>Date</td>
                <td>Type</td>
                <td>Information</td>
                <td>Mark</td>
                <td data-orderable="false">Presence</td>
            </tr>
            </thead>
            <tbody class="panel-center">
                <c:forEach items="${grades}" var="g">
                    <tr>
                        <td>
                            <p>${g.clazz.discipline.name}</p>
                        </td>
                        <td>
                            <p>${g.clazz.date}</p>
                        </td>
                        <td>
                            <p>${g.clazz.classType.type}</p>
                        </td>
                        <td>
                            <p>${g.clazz.info}</p>
                        </td>
                        <td>
                            <p>${g.mark}</p>
                        </td>
                        <td>
                            <c:if test="${g.presence == 1}">
                                <span class="glyphicon glyphicon-ok"></span>
                            </c:if>
                            <c:if test="${g.presence == 0}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-md-4">
        <h3>My Disciplines </h3>
        <hr style="border-color: lightblue !important;"/>
        <table id="disciplinesTable" class="table table-striped table-hover table-bordered" class="width-100p">
            <thead class="panel-center">
            <tr style="background-color: #c3e8fa;">
                <td>Discipline</td>
                <td data-orderable="false">Skills</td>
            </tr>
            </thead>
            <tbody class="panel-center">
                <c:forEach items="${disciplines}" var="d">
                    <tr>
                        <td>
                            <p>${d.name}</p>
                        </td>
                        <td>
                            <c:forEach items="${d.skills}" var="s">
                                <p>${s.name} (${s.description})</p>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
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
        "order": [[ 1, "desc" ]]
    };
    $('#gradesTable').DataTable(default_options);
    var default_options_1 = {
        "sScrollY": 475,
        "sScrollX": "100%",
        "sScrollXInner": "100%",
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "bProcessing": true
    };
    $('#disciplinesTable').DataTable(default_options_1);
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>