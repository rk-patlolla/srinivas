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
.textWidth {
	width: 430px;
}

.error {
	color: #ff0000;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#userEmail').keyup(function(){
			var email=$(this).val();
			//alert(email);
			if(email.length>=3){
				$.ajax({
					type:"post",
					url: "${pageContext.request.contextPath}/checkNameOrMobileOrEmail",
					data:"name="+email,
					success:function(response){	
						if(response=="available"){
							//alert("inside if: "+response);
						$('#emailTest').html("Email Already Exists!");
						}else{
							//alert("inside else: "+response);
						$('#emailTest').html("Available");
						}
					},
					error:function(err){
						$('#emailTest').html("ERROR");
						alert(err);
					}
				});
				
			}
			
		})
		$('#userMobile').keyup(function(){
			var mobile=$(this).val();
			//alert(email);
			if(mobile.length>=5){
				$.ajax({
					type:"post",
					url: "${pageContext.request.contextPath}/checkNameOrMobileOrEmail",
					data:"name="+mobile,
					success:function(response){	
						if(response=="available"){
							//alert("inside if: "+response);
						$('#mobileTest').html("Mobile Numbers Already Exists!");
						}else{
							//alert("inside else: "+response);
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

			alert("Please select role");
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
	<form:form action="/addUser" method="POST" modelAttribute="userObj">
		<div align="center" style="margin-top: 140px;">
			<div align="center"
				style="margin-top: 140px; font-weight: bold; color: cornflowerblue;">
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
				<form:input path="userName" class="form-control textWidth"
					id="userName" placeholder="Enter user name" style="width: 300px;" />
				<form:errors path="userName" class="error"></form:errors>
			</div>
			<div class="form-group">
				<label for="email">Email:</label>
				<form:input path="userEmail" type="email"
					class="form-control textWidth" id="userEmail"
					placeholder="Enter email" style="width: 300px;" />
					<div class="form-group" id="emailTest" style="color:red;"></div>
			</div>
			
			<div class="form-group">
				<label for="mobile">Mobile:</label>
				<form:input path="userMobile" class="form-control textWidth"
					id="userMobile" placeholder="Enter Mobile Number"
					style="width: 300px;" />
				<form:errors path="userMobile" class="error"></form:errors>
				<div class="form-group" id="mobileTest" style="color:red;"></div>
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
				<form:input path="password" class="form-control textWidth"
					id="password" placeholder="create password"
					style="width: 300px;" />
				<form:errors path="password" class="error"></form:errors>
			</div>
			<form:button type="submit" class="btn btn-default"
				onclick="return validate();">Submit</form:button>
			<a href="/adminHome" class="btn btn-default">Back</a>
		</div>
	</form:form>
	<jsp:include page="../menu/footer.jsp"></jsp:include>
</body>
</html>