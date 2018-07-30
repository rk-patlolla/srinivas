<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
<style type="text/css">
table.th, td {
	text-align: center;
}

.textAlign {
	text-align: center;
	background-color: gray;
	color: white;
}

.loginTitle {
	font-weight: bold;
	font-size: 15px;
	margin-left: 100px;
	color: cornflowerblue;
}
.userTitle {
	font-weight: bold;
	color: cornflowerblue;
}

}
</style>
<script type="text/javascript">
function ConfirmDelete(userId,userName) {
		var confirmToDelete = confirm("Are you sure you want to delete? "+userName );
		if (confirmToDelete)
			{
			  $.ajax({
			    url: '/deleteUser/' + userId,
			    type: 'DELETE',
			    success: function(result) {
			        return true;
			    }
			}); 
			 setTimeout(function(){
                 location.reload(); 
            }, 100);
			 alert("User Deleted Successfully")
			return true;
			}
			
		else
			return false;
	}
</script>
</head>
<body>

	<jsp:include page="../menu/header.jsp"></jsp:include>
		<jsp:include page="../menu/menu.jsp"></jsp:include>
	
	<div align="center" class="userTitle">
		USERS DETAILS
		<hr>
	</div>
	<sec:authorize access="isAuthenticated()">
	<div class="loginTitle">
		<b>Welcome <sec:authentication property="principal.username" /></b>
	</div>
	</sec:authorize>
	<c:if test="${not empty Msg}">
		<div align="center" style="color: red; font-weight: bold; font-size: 15px;">${Msg}
		</div>
	</c:if>
	<c:if test="${not empty usersList }">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="textAlign">User Id</th>
					<th class="textAlign">User Name</th>
					<th class="textAlign">Email</th>
					<th class="textAlign">Mobile</th>
					<!-- <th class="textAlign">Created Date</th>
					<th class="textAlign">Updated Date</th> -->
					<th class="textAlign">GroupName</th>
					<th class="textAlign">Role</th>
					<th class="textAlign">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="userList" items="${usersList}">
					<tr>
						<td>${userList.userId}</td>
						<td>${userList.userName}</td>
						<td>${userList.userEmail}</td>
						<td>${userList.userMobile}</td>
						<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${userList.createdDate}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${userList.updatedDate}" /></td> --%>
						<td>${userList.groupModel.groupName}</td>
						<td>${userList.role}</td>
						<td>
						 <sec:authorize access="hasRole('ADMIN')"><a href="<c:url value='/editUser/${userList.userId}' />" class="btn btn-primary">Edit</a></sec:authorize> 
						 <sec:authorize access="hasRole('ADMIN')"><a href="#" class="btn btn-danger" onclick="return ConfirmDelete(${userList.userId},'${userList.userName}');">Delete</a></sec:authorize>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</c:if>
	<div align="center">
		<a href="/adminHome" class="btn btn-success">Back</a>
	</div>
	<jsp:include page="../menu/footer.jsp"></jsp:include>
</body>
</html>