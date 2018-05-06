<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
    <title>AlmaCRM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="description" content="AlmaCRM is a Customer Relationship Management system specially designed for use in universities" />
    <meta name="keywords" content="CRM, Customer Relationship Management, AlmaCRM, university" />
    <!-- jQuery -->
    <script src="<c:url value="/resources/js/jquery-2.2.4.js"/>"></script>
    <!-- jQuery DataTable -->
    <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <!-- Bootstrap DataTable JavaScript -->
    <script src="<c:url value="/resources/js/dataTables.bootstrap.min.js"/>"></script>
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <!-- Bootstrap DataTable CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/dataTables.bootstrap.min.css"/>">
    <!-- Icons -->
    <script src="<c:url value="/resources/js/fontawesome.js"/>"></script>
    <!-- CSS -->
    <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/img/shortcut.ico"/>"/>
    <!-- root path -->
    <script type="text/javascript"> var domainURL = window.location.protocol + "//"  + window.location.host + /* "" + window.location.pathname; */ "/"; </script>
    <!-- Go Back Button -->
    <script type="text/javascript">
        var context = '${pageContext.request.contextPath}';
        function goBack() {
            window.history.back();
        }
    </script>
</head>
<body>

<!-- HEADER -->
<nav class="navbar navbar-inverse" style="border-radius: 0 !important; background-color: darkblue !important;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="<c:url value="/home"/>" style="color:white;">AlmaCRM</a>
        </div>
        <ul class="nav navbar-nav">
            <!-- ADMIN menu -->
            <sec:authorize access="hasRole('ADMIN')">
                <li><a href="<c:url value="/admin/main"/>" style="color:white;">Admin page</a></li>
                <li><a href="<c:url value="/admin/reviews"/>" style="color:white;">Reviews</a></li>
            </sec:authorize>
            <!-- TEACHER menu -->
            <sec:authorize access="hasRole('TEACHER')">
                <li><a href="<c:url value="/teacher/main"/>" style="color:white;">Teacher page</a></li>
                <li><a data-toggle="modal" data-target="#addSkillModal" style="color:white;">Add new skill</a></li>
            </sec:authorize>
            <!-- STUDENT menu -->
            <sec:authorize access="hasRole('STUDENT')">
                <li><a href="<c:url value="/student/main"/>" style="color:white;">Student page</a></li>
                <li><a href="<c:url value="/student/feedback"/>" style="color:white;">Feedbacks & Housing Fund</a></li>
                <li><a href="<c:url value="/student/career"/>" style="color:white;">My Career</a></li>
                <li><a href="<c:url value="/student/questions"/>" style="color:white;">Ask a question to a company agent</a></li>
            </sec:authorize>
            <!-- AGENT menu -->
            <sec:authorize access="hasRole('AGENT')">
                <li><a href="<c:url value="/agent/main"/>" style="color:white;">Agent page</a></li>
                <li><a href="<c:url value="/agent/vacancies"/>" style="color:white;">Vacancies</a></li>
                <li><a href="<c:url value="/agent/programs"/>" style="color:white;">Skills and Programs</a></li>
                <li><a data-toggle="modal" data-target="#addSkillModal" style="color:white;">Add new skill</a></li>
            </sec:authorize>
            <!-- TEACHER menu -->
            <sec:authorize access="hasRole('WORKER')">
                <li><a href="<c:url value="/worker/main"/>" style="color:white;">Main page</a></li>
            </sec:authorize>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a data-toggle="modal" data-target="#bug" style="color:white;"><span class="fa fa-bug"></span> Report a bug</a></li>
            <sec:authorize access="isAnonymous()">
                <li><a href="<c:url value="/login"/>" style="color:white;"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li><a href="<c:url value="/logout"/>" style="color:white;"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
            </sec:authorize>
        </ul>
    </div>
</nav>

<!-- MODALS -->
<div class="modal fade" id="bug" tabindex="-1" role="dialog" aria-labelledby="modalBug">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modalBug">Report a bug</h4>
            </div>
            <form onsubmit="reportBug();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="problem">Describe your problem</label>
                        <textarea name="problem" id="problem" cols="80" rows="10" class="form-control" required ></textarea>
                    </div>
                    <div class="form-group">
                        <label for="yourName">Enter your name</label>
                        <input type="text" class="form-control" maxlength="255" id="yourName"
                               placeholder="your name" required />
                    </div>
                    <div class="form-group">
                        <label for="yourEmail">Enter your email</label>
                        <input type="email" class="form-control" maxlength="255" id="yourEmail"
                               placeholder="email" required />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning">Send</button>
                </div>
            </form>
            <div class="alert alert-info" id="bugSendSuccess" style="display: none;">
                <strong>Your report has been sent!</strong>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addSkillModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add new skill</h4>
            </div>
            <form onsubmit="addSkill();">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="skillName">Skill name</label>
                        <input type="text" class="form-control" maxlength="255" id="skillName" required />
                    </div>
                    <div class="form-group">
                        <label for="skillDesc">Short description</label>
                        <textarea class="form-control" id="skillDesc" required></textarea>
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
    function reportBug() {
        var problem = $("#problem").val();
        var authorName = $("#yourName").val();
        var email = $("#yourEmail").val();

        $.ajax({
            type: "POST",
            url: domainURL + "reportBug",
            dataType: "text",
            async: false,
            data: { problem: problem , authorName: authorName, email: email},
            timeout: 30000
        }).done(function (data) {
            document.getElementById("bugSendSuccess").style.display = "";
            setTimeout(redirect, 1500);
            function redirect() { document.location.href = domainURL; }
        }).fail(function (error) {
            alert("Network connection error...");
            setTimeout(redirect, 500);
            function redirect() { document.location.href = domainURL; }
        });
    }

    function addSkill() {
        var skillName = $("#skillName").val();
        var skillDesc = $("#skillDesc").val();

        $.ajax({
            type: "POST",
            url: domainURL + "addSkill",
            dataType: "text",
            async: false,
            data: { skillName: skillName , skillDesc: skillDesc},
            timeout: 30000
        }).done(function (data) {
            location.reload();
        }).fail(function (error) {
            alert("Network connection error...");
            setTimeout(redirect, 500);
            function redirect() { document.location.href = domainURL; }
        });
    }
</script>
