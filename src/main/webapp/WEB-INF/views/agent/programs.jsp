<%@include file="/WEB-INF/views/header.jsp"%>

<div class="container-fluid padding-top-5 padding-bottom-5" style="margin-top: 5px !important;">
    <div class="row">
        <div class="col-md-4 col-md-offset-1">
            <h3>Skills</h3>
            <hr/>
            <table id="allSkillsTable" class="table table-striped table-hover table-bordered">
                <thead class="panel-center">
                <tr style="background-color: lightblue;">
                    <td style="width: 40%;">Name</td>
                    <td>Description</td>
                </tr>
                </thead>
                <tbody class="panel-center">
                <c:forEach items="${skills}" var="s">
                    <tr>
                        <td>
                            <p>${s.name}</p>
                        </td>
                        <td>
                            <p>${s.description}</p>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-5 col-md-offset-1">
            <h3>Programs</h3>
            <hr/>
            <table id="progsTable" class="table table-striped table-hover table-bordered">
                <thead class="panel-center">
                <tr style="background-color: lightblue;">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Core Skills</td>
                </tr>
                </thead>
                <tbody class="panel-center">
                <c:forEach items="${qualificationPrograms}" var="p">
                    <tr>
                        <td>
                            <p>${p.name}</p>
                        </td>
                        <td>
                            <p>${p.description}</p>
                        </td>
                        <td>
                            <c:forEach var="skill" items="${p.skills}">
                                ${skill.name} <br/>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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
    $('#allSkillsTable').DataTable(default_options);
    $('#progsTable').DataTable(default_options);





</script>


<%@include file="/WEB-INF/views/footer.jsp"%>