<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {

});
function validate() {
	if ($('#userName').val() == "" || $('#userName').val() == null) {
		alert("Please User Name");
		$("#userName").focus();
		return false;
	}
}
</script>
<style type="text/css">
.userTitle {
	margin-top: 140px;
	font-weight: bold;
	color: cornflowerblue;
}

.form-control.textWidth {
	width: 300px;
}
</style>
</head>
<body>
	<jsp:include page="../menu/header.jsp"></jsp:include>
	<jsp:include page="../menu/menu.jsp"></jsp:include>
	<form:form action="/updateUser" method="POST" modelAttribute="userObj">
		<c:if test="${not empty usersList }">
			<div align="center">
				<div align="center" class="userTitle">
					<h4>UPDATE USER DETAILS</h4>
				</div>
				<div class="form-group">
					<form:hidden path="userId" value='${usersList.userId}' />
					<label for="userName">User Name</label>
					<form:input path="userName" class="form-control textWidth" id="userName" value='${usersList.userName}'/>
					<label for="userEmail">Email</label>
					<form:input path="userEmail" class="form-control textWidth" id="userEmail" value='${usersList.userEmail}'/>
					<label for="userMobile">Mobile Number</label>
					<form:input path="userMobile" class="form-control textWidth" id="userMobile" value='${usersList.userMobile}'/>
				    <form:hidden path="role" value='${usersList.role}' />
					<form:hidden path="password" value='${usersList.password}' />
				</div>
				<form:button type="submit" class="btn btn-default" onclick="return validate();">Update</form:button>
				<a href="/adminHome" class="btn btn-default">Back</a>
			</div>
		</c:if>
	</form:form>
	<jsp:include page="../menu/footer.jsp"></jsp:include>
</body>
</html>