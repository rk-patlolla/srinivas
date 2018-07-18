<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>

</head>
<body>
	<jsp:include page="../menu/header.jsp"></jsp:include>

	<div align="center"
		style="font-weight: bold; font-size: 20px; color: cornflowerblue; margin-top: 22px;">Sample
		Group And Users Application</div>
	<div align="center" style="margin-top: 120px;">
		<div class="">
			<form method="POST" action="/adminHome">
				<div class="form-group">
					<label for="uesrId">UserId:</label> <input type="text" id="userId"
						class="form-control" name="uesrId" placeholder="Enter UserId"
						style="width: 350px;" />
				</div>
				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password"
						class="form-control" id="pwd" name="pwd"
						placeholder="Enter password" style="width: 350px;" />
				</div>
<%--  				<input type="hidden" name="${_csrf.parameterName}"    value="${_csrf.token}" />
 --%> 				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
	<jsp:include page="../menu/footer.jsp"></jsp:include>

</body>
</html>

