<%@include file="/WEB-INF/views/header.jsp"%>

<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="myModal">Write your question </h4>
        </div>
        <form onsubmit="addQuestionFromStudent();">
            <div class="modal-body">
                <div class="form-group">
                    <label for="question">Your question: </label>
                    <textarea class="form-control" id="question" rows="21" required></textarea>
                </div>
                <div class="form-group">
                    <label for="agentId">Short description</label>
                    <select id="agentId" required>
                        <c:forEach var="a" items="${agents}">
                            <option value="${a.id}">${a.company}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-warning">Send</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function addQuestionFromStudent() {
        var question = $("#question").val();
        var agentId = $("#agentId").val();
        $.ajax({
            type: "POST",
            url: domainURL + "addQuestionFromStudent",
            dataType: "text",
            async: false,
            data: {question: question, agentId: agentId},
            timeout: 30000
        }).done(function (data) {
            alert("Your question has been sent successfully.")
            document.location.reload();
        }).fail(function (error) {
            alert("Connection error...");
            document.location.reload();
        });
    }
</script>

<%@include file="/WEB-INF/views/footer.jsp"%>