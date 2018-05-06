<%@include file="/WEB-INF/views/header.jsp"%>

<div class="row" style="height: 700px !important;">
        <div class="col-md-5 col-md-offset-1">
            <div class="container-fluid">
                <h3>Leave review on discipline <br/>
                It is anonymous</h3>
                <hr style="border-color: lightblue !important;"/>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="wrapper">
                            <div class="container-fluid">
                                <form onsubmit="sendReview();">
                                    <div class="input-group">
                                        <textarea class="form-control" id="good" rows="3" cols="61" placeholder="Strengths" required></textarea><br/>
                                    </div><br/>
                                    <div class="input-group">
                                        <textarea class="form-control" id="bad" rows="3" cols="61" placeholder="Weaknesses" required></textarea><br/>
                                    </div><br/>
                                    <div class="input-group">
                                        <p>total score from 0 to 10: </p>
                                        <input class="form-control" id="score"  type="number" min="0" max="10" placeholder="Grade" required><br/>
                                    </div><br/>
                                    <div class="input-group">
                                        <p>Choose discipline: </p>
                                        <select class="form-control" id = "disciplineId" required>
                                            <c:forEach var="d" items="${disciplines}">
                                                <option value="${d.id}">${d.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div><br/>
                                    <div>
                                        <button type="submit" class="btn btn-primary">Send</button>
                                    </div>
                                </form>
                                <div class="alert alert-info" id="infoSuccess" style="display: none;">
                                    <strong>Your review has been sent!</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="wrapper">
                            <div class="container-fluid">
                                <h3>Your last reviews: </h3>
                                <hr style="border-color: lightblue !important;"/>
                                <c:forEach var="r" items="${reviews}">
                                    <p>${r.discipline.name}</p>
                                    <p>Good points: ${r.strnghts}</p>
                                    <p>Bad points: ${r.weaknesses}</p>
                                    <p>Total grade: ${r.score}</p>
                                    <hr/>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <h3>Your current room is: <br/> ${room}</h3>
            <hr style="border-color: lightblue !important;"/>
            <div class="container-fluid">
                <h3>Send room change request: </h3>
                <hr style="border-color: lightblue !important;"/>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="wrapper">
                            <div class="container-fluid">
                                <form onsubmit="sendRoomRequest();">
                                    <div class="form-group">
                                        <label for="addInfo">Reason: </label>
                                        <input type="text" class="form-control" id="addInfo" value="Primary settlement" required/><br/>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="roomSex">Choose room size</label><br/>
                                                <select id = "size" required>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">2</option>
                                                    <option value="4">2</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="roomSex">Choose room type</label><br/>
                                                <select id = "roomSex" required>
                                                    <option value="1">male</option>
                                                    <option value="0">female</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="hostelId">Choose hostel</label><br/>
                                                <select id = "hostelId" required>
                                                    <c:forEach var="hostel" items="${hostels}">
                                                        <option value="${hostel.id}">${hostel.address}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div><br/>
                                    <div>
                                        <button type="submit" class="btn btn-primary">Send</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>







<script type="text/javascript">
    function sendReview() {
        var good = $("#good").val();
        var bad = $("#bad").val();
        var score = $("#score").val();
        var disciplineId = $("#disciplineId").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addStudentReview",
            dataType: "text",
            async: false,
            data: { good: good, bad: bad, score: score, disciplineId: disciplineId },
            timeout: 30000
        }).done(function (data) {
            document.getElementById("infoSuccess").style.display = "";
            setTimeout(redirect, 5000);
            function redirect() { location.reload(); }
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            setTimeout(redirect, 500);
            function redirect() { location.reload(); }
        });
    }

    function sendRoomRequest() {
        var addInfo = $("#addInfo").val();
        var size = $("#size").val();
        var roomSex = $("#roomSex").val();
        var hostelId = $("#hostelId").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addRoomChangeApp",
            dataType: "text",
            async: false,
            data: { addInfo: addInfo, size: size, roomSex: roomSex, hostelId: hostelId },
            timeout: 30000
        }).done(function (data) {
            setTimeout(redirect, 5000);
            function redirect() { location.reload(); }
        }).fail(function (error) {
            alert("Connection error occurred...");
            setTimeout(redirect, 500);
            function redirect() { location.reload(); }
        });
    }
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>