<%@include file="/WEB-INF/views/header.jsp"%>

<div class="row" style="height: 700px !important;">
    <div class="col-md-7">
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
    <div class="col-md-5">
    </div>
</div>









<%@include file="/WEB-INF/views/footer.jsp"%>