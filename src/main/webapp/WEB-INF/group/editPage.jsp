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
	
	//alert("Edit Page"+$('#groupName').val());

	if ($('#groupName').val() == "" || $('#groupName').val() == null) {
		alert("Group Name should not blank");
		$("#groupName").focus();
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
	<form:form action="/updateGroup" method="POST" modelAttribute="groupObj">
		<c:if test="${not empty editGroupObj }">
			<div align="center">
				<div align="center" class="userTitle">
				<h3>UPDATE GROUP DETAILS</h3>
				</div>
				<div class="form-group">
					<form:hidden path="groupId"  value='${editGroupObj.groupId}'/>
     				<label for="groupName">Group Name</label>
					<form:input path="groupName" class="form-control textWidth" id="groupName" value='${editGroupObj.groupName}'/>
				</div>
				<form:button type="submit" class="btn btn-default" onclick="return validate();">Update</form:button>
				<a href="/adminHome" class="btn btn-default">Back</a>
			</div>
		</c:if>
	</form:form>
	<jsp:include page="../menu/footer.jsp"></jsp:include>
</body>
</html>