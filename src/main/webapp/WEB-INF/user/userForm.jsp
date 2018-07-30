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

<style type="text/css">
.form-control.textWidth {
	width: 300px;
}
.error {
	color: #ff0000;
	font-weight: bold;
}
.userTitle {
	margin-top: 140px;
	font-weight: bold;
	color: cornflowerblue;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#userEmail').keyup(function(){
			var email=$(this).val();
			if(email.length>=3){
				$.ajax({
					type:"post",
					url: "/checkNameOrMobileOrEmail",
					data:"name="+email,
					success:function(response){	
						if(response=="available"){
						$('#emailTest').html("Email Already Exists!");
						}else{
						$('#emailTest').html("Available");
						}
					},
					error:function(err){
						$('#emailTest').html("ERROR");
					}
				});
			}
		})
		$('#userMobile').keyup(function(){
			var mobile=$(this).val();
			if(mobile.length==10){
				$.ajax({
					type:"post",
					url: "/checkNameOrMobileOrEmail",
					data:"name="+mobile,
					success:function(response){	
						if(response=="available"){
						$('#mobileTest').html("Mobile Numbers Already Exists!");
						}else{
						$('#mobileTest').html("Available");
						}
					},
					error:function(err){
						$('#mobileTest').html("ERROR");
						alert(err);
					}
				});
			}
		})
	});


	function validate() {
		if ($('#userName').val() == "" || $('#userName').val() == null) {
			alert("Please User Name");
			$("#userName").focus();
			return false;
		}
		if ($('#userEmail').val() == "" || $('#userEmail').val() == null) {

			alert("Please Email Address");
			$("#userEmail").focus();
			return false;
		}
		if ($('#userMobile').val() == "" || $('#userMobile').val() == null) {
			alert("Please Enter Mobile Number");
			$("#userMobile").focus();
			return false;
		}
		if ($('#role').val() == "NONE" || $('#role').val() == null) {
			alert("Please select role");
			$("#role").focus();
			return false;
		}
		if ($('#password').val() == "" || $('#password').val() == null) {
			alert("Please enter password");
			$("#password").focus();
			return false;
		}
		/* if ($('#userMobile').val().length != 10) {

			alert("Please Enter 10 digit Mobile Number");
			$("#userMobile").focus();
			return false;
		} */
	}
</script>
</head>
<body>
	<jsp:include page="../menu/header.jsp"></jsp:include>
	<jsp:include page="../menu/menu.jsp"></jsp:include>
	<form:form action="/addUser" method="POST" modelAttribute="userObj">
		<div align="center">
			<div align="center" class="userTitle">
				<h3>UESER FORM</h3>
			</div>
			<%-- <c:if test="${not empty errMsg}">
				<div style="color: red; font-weight: bold;font-size: 15px;">
					${errMsg}
				</div>
			</c:if --%>

			<div class="form-group">
				<form:hidden path="groupModel" value="${groupId}" />
				<label for="userName">User Name:</label>
				<form:input path="userName" class="form-control textWidth" id="userName" placeholder="Enter user name" />
				<form:errors path="userName" class="error"></form:errors>
			</div>
			<div class="form-group">
				<label for="email">Email:</label>
				<form:input path="userEmail" type="email" class="form-control textWidth" id="userEmail" placeholder="Enter email" />
				<div class="form-group" id="emailTest" class="error"></div>
			</div>
			<div class="form-group">
				<label for="mobile">Mobile:</label>
				<form:input path="userMobile" class="form-control textWidth" id="userMobile" placeholder="Enter Mobile Number" />
				<form:errors path="userMobile" class="error"></form:errors>
				<div class="form-group" id="mobileTest" class="error"></div>
			</div>
			<div class="form-group">
			<label for="role">Select Role:</label>
			<form:select path="role" id="role">
			 	<form:option value="NONE">-SELECT-</form:option>
                <form:option value="ROLE_ADMIN">ADMIN</form:option>
                <form:option value="ROLE_USER">USER</form:option>  
            </form:select>
            </div>
            <div class="form-group">
				<label for="password">Create Password:</label>
				<form:input path="password" class="form-control textWidth" id="password" placeholder="create password" />
				<form:errors path="password" class="error"></form:errors>
			</div>
			<form:button type="submit" class="btn btn-default" onclick="return validate();">Submit</form:button>
			<a href="/adminHome" class="btn btn-default">Back</a>
		</div>
	</form:form>
	<jsp:include page="../menu/footer.jsp"></jsp:include>
</body>
</html>