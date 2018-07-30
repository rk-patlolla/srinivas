<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
</style>
<script type="text/javascript">
	function ConfirmDelete(groupId,groupName) {
	//alert("Group Id:"+groupId)
		var confirmToDelete = confirm("Are you sure you want to delete? "+groupName );
		if (confirmToDelete)
			{
			//alert("Inside function")
			  $.ajax({
			    url: '/deleteGroup/' + groupId,
			    type: 'DELETE',
			    success: function(result) {
			        return true;
			    }
			}); 
			 setTimeout(function(){// wait for 1 secs
                 location.reload(); // then reload the page
            }, 100);
			 alert("Group Deleted Successfully")
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
	<sec:authorize access="isAuthenticated()">
		<div
			style="font-weight: bold; font-size: 15px; margin-left: 100px; color: cornflowerblue;">
			<b>Welcome <sec:authentication property="principal.username" /></b>
		</div>
	</sec:authorize>
	<br>
	<c:if test="${not empty Msg}">
		<div align="center"
			style="color: green; font-weight: bold; font-size: 15px;">
			${Msg}</div>
	</c:if>
	<c:if test="${not empty groupList }">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="textAlign">Group Id</th>
					<th class="textAlign">Group Name</th>
					<!-- <th class="textAlign">Created Date</th>
					<th class="textAlign">Updated Date</th> -->
					<th class="textAlign">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${groupList}">
					<tr>
						<td>${list.groupId}</td>
						<td>${list.groupName}</td>
						<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.createdDate}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.updatedDate}" /></td> --%>
						<td><sec:authorize access="hasRole('ADMIN')"><a href="<c:url value='/getUserForm/${list.groupId}' />" class="btn btn-success">Add User</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMIN')"><a href="<c:url value='/getByGroupId/${list.groupId}' />" class="btn btn-primary">Edit</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMIN')"><a href="#" class="btn btn-danger" onclick=" return ConfirmDelete(${list.groupId},'${list.groupName}');">Delete</a>
							</sec:authorize>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<jsp:include page="../menu/footer.jsp"></jsp:include>
</body>
</html>