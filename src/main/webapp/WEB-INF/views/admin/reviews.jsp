<%@include file="/WEB-INF/views/header.jsp"%>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="wrapper">
                        <h3>Reviews</h3>
                        <hr style="border-color: lightblue !important;"/>
                        <c:forEach var="rev" items="${reviews}">
                            <p>${rev.discipline.name} (${rev.discipline.specialty.name}, ${rev.discipline.specialty.faculty.name})</p>
                            <p>Good points: </p>
                            <p>${rev.strnghts}</p>
                            <p>Bad points: </p>
                            <p>${rev.weaknesses}</p>
                            <p>Total grade: ${rev.score}</p>
                            <hr style="border-color: black !important;"/>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/footer.jsp"%>