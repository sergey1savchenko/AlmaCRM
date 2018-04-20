<%@include file="header.jsp"%>

<div class="row">
	<center>
		<img src="<c:url value="/resources/img/top.png"/>" alt="" width="75%" height="auto"/>
	</center>
</div>

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
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-10 col-md-offset-0">
					<h3>Have a question? </h3><h4>Leave it here! </h4>
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="wrapper">
								<div class="container-fluid">
									<form onsubmit="sendReport();">
										<div class="input-group">
											<input id="authorName" type="text" class="form-control" placeholder="Your name" required />
										</div><br/>
										<div class="input-group">
											Choose topic
											<select id = "title" required>
												<option value="General">General</option>
												<option value="Admission">Admission</option>
												<option value="Courses">Courses</option>
											</select>
										</div><br/>
										<div class="input-group">
											<textarea id="text" rows="7" cols="60" placeholder="Your question" required></textarea>
										</div><br/>
										<div class="input-group">
											<input id="email" type="email" class="form-control"  placeholder="Your email address" required />
										</div><br/>
										<div class="input-group">
											Choose faculty
											<select id = "facultyId" required>
												<c:forEach var="faculty" items="${faculties}">
													<option value="${faculty.id}">${faculty.name}</option>
												</c:forEach>
											</select>
										</div><br/>
										<div>
											<button type="submit" class="btn btn-primary">Send</button>
										</div>
									</form>
									<div class="alert alert-info" id="infoSuccess" style="display: none;">
										<strong>Your message has been sent!</strong>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	function sendReport() {
        var authorName = $("#authorName").val();
        var title = $("#title").val();
        var text = $("#text").val();
        var email = $("#email").val();
        var facultyId = $("#facultyId").val();

        $.ajax({
            type: "POST",
            url: domainURL + "sendAppApp",
            dataType: "text",
            async: false,
            data: { authorName: authorName, title: title, text: text , email: email, facultyId: facultyId},
            timeout: 30000
        }).done(function (data) {
            document.getElementById("infoSuccess").style.display = "";
            setTimeout(redirect, 1000);
            function redirect() { document.location.href = domainURL; }
        }).fail(function (error) {
            alert("Connection error or such entity already exists.");
            setTimeout(redirect, 500);
            function redirect() { document.location.href = domainURL; }
        });
    }
</script>

<%@include file="footer.jsp"%>