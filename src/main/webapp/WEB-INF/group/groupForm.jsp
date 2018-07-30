<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
<script src="jquery-3.3.1.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
#groupName {
	width: 430px;
}
.error {
    color: #ff0000;
    font-weight: bold;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#groupName").keyup(function(){
			var groupName=$(this).val();
			if(groupName.length>=3){
				$.ajax({
					type:"post",
					url: "/checkGroupName",
					data:"name="+groupName,
					success:function(response){	
						if(response=="available"){
						$('#groupNameTest').html("Group Name Already Exists!");
						}else{
						$('#groupNameTest').html("Available");
						}
					},
					error:function(err){
						$('#groupNameTest').html("ERROR");
						alert(err);
					}
				});
				
			}
			
		})
	});

	function validate() {

		if ($('#groupName').val() == "" || $('#groupName').val() == null) {

			alert("Please Enter Group Name");
			$("#groupName").focus();

			return false;
		}
	}

</script>
</head>
<body>
	<jsp:include page="../menu/header.jsp"></jsp:include>
	<jsp:include page="../menu/menu.jsp"></jsp:include>
	<div align="center">
		<form:form action="/addGroup" method="POST" modelAttribute="groupObj">
			<div align="center"
				style="margin-top: 140px; font-weight: bold; color: cornflowerblue;">
				<h3>GROUP FORM</h3>
			</div>
			<div class="form-group">
				<label for="groupName">Enter Group Name</label>
				<form:input path="groupName" class="form-control textWidth" id="groupName" placeholder="Enter Group name" />
				<div id="groupNameTest" class="error"></div>
				<form:errors path="groupName" class="error"></form:errors>
			</div>	
			<form:button type="submit" class="btn btn-default" onclick="return validate();">Submit</form:button>
			<a href="/adminHome" class="btn btn-default">Back</a>
		</form:form>
	</div>
	<jsp:include page="../menu/footer.jsp"></jsp:include>
</body>
</html>