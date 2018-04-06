<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello <c:out value="${role}"></c:out>!</h1>
	<a href="<c:url value="/login"/>">login</a><br/>
	<a href="<c:url value="/logout"/>">logout</a>
</body>
</html>