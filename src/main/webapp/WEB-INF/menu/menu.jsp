<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
        <sec:authorize access="hasRole('ADMIN')">
        </sec:authorize>
    </div>
<div align="right">
		   <sec:authorize access="hasRole('ADMIN')"><a href="/getGroups" class="btn btn-success">VIEW GROUPS</a></sec:authorize>
		   <sec:authorize access="hasRole('ADMIN')"> <a href="/getGroupForm" class="btn btn-success">ADD GROUP</a></sec:authorize>
		   <sec:authorize access="hasAnyRole('ADMIN','USER')"><a href="/getUsers" class="btn btn-success">VIEW USERS</a></sec:authorize>
		   <sec:authorize access="hasAnyRole('ADMIN','USER')"><a href="logout" class="btn btn-success">LOGOUT</a></sec:authorize>
		<hr>
	</div>
</body>
</html>