<%@include file="header.jsp"%>

<!-- Resolves issues when user press "Back" button after Logging in -->
<script type="text/javascript">
    jQuery(document).ready(function($) {
        if (window.history && window.history.pushState) {
            window.history.pushState('forward', null, './#forward');
            $(window).on('popstate', function() {
                alert('You must login into the system!');
            });
        }
    });
</script>

<br/>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="wrapper">
						<h3>&nbsp&nbsp&nbsp Enter your email and password</h3>
						<form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
							<div class="container-fluid">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
									<input id="username" type="text" class="form-control" name="username" placeholder="Email" required>
								</div><br/>
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<input id="password" type="password" class="form-control" name="password" placeholder="Password" required>
								</div><br/>
								<div class="top5">
									<button type="submit" class="btn btn-success col-md-6 col-md-offset-3">Login</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<div class="alert alert-info">
			<p>Return to the <strong><a href="<c:url value="/"/>">home</a></strong> page</p>
		</div>
		<c:if test="${param.error == 'true'}">
			<div class="alert alert-danger">
				<strong>Error!</strong> Email or password is incorrect or there are no such user.
			</div>
		</c:if>

	</div>
</div>

<%@include file="footer.jsp"%>