<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../menu/header.jsp"></jsp:include>
	<jsp:include page="../menu/menu.jsp"></jsp:include>
	<h1>Group List</h1>
	<table>
		<tr>
			<th>Group Id</th>
			<th>Group Name</th>
			<th>Created Date</th>
		</tr>
		<tr>
			<c:if test="${not empty groupList }">
				<c:forEach var="list" items="${groupList}">
					<td>${list.groupId}</td>
					<td>${list.groupName}</td>
					<td>${list.createdDate}</td>
				</c:forEach>
			</c:if>
		</tr>
	</table>
	<jsp:include page="../menu/footer.jsp"></jsp:include>
</body>
</html>