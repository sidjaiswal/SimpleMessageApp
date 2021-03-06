<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
 <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">
<title>Main Page</title>
<style type="text/css">
	#leftside{
		padding-top: 100px;
		float: left;
		width: 400px;
	}
	#rightside{
		float: left;
	}
	ul
{
    list-style-type: none;
}
</style>
</head>
<body>
<div id="leftside">
	<ul>

	
	<a href="${pageContext.servletContext.contextPath}/search.htm"><li>Search</li></a><br />
		<a href="${pageContext.servletContext.contextPath}/showMessages.htm"><li>ShowMessages</li></a><br />		
		<a href="${pageContext.servletContext.contextPath}/viewContacts.htm"><li>View Contacts</li></a><br />
		<a href="${pageContext.servletContext.contextPath}/changePassword.htm"><li>Change Password</li></a><br />
	</ul>
</div>
	
<div id="rightside">

	<h2>Welcome <c:out value="${ sessionScope.uName}"></c:out></h2>
	<br />
	<h3>Message Inbox</h3>
	<form:form action="/reply.htm">
	<table id="messageTable" class="table table-bordered">
	<tr>
		<th>Message ID</th>
		<th>From User</th>
		<th>Message</th>
		<th>Date</th>
		<th>Reply to User</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${result}" var="message" step="1">
		
	<tr>
		<td><c:out value="${message.messageID }"></c:out></td>
		<td><c:out value="${message.fromUser}"></c:out></td>
		<td><c:out value="${message.message}"></c:out></td>
		<td><c:out value="${message.messageDate}"></c:out></td>
		<td><a href="${pageContext.servletContext.contextPath}/reply.htm?to=${message.fromUser}">Reply</a></td>
		<td><input type="checkbox" name="delete"></td>
	</tr>
	</c:forEach>
	</table>
	
	</form:form>
</div>
	
</body>
</html>