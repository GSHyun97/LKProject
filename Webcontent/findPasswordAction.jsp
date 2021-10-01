<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<html>
<head>
<title>비밀번호 찾기</title>

</head>
<%
UserDAO userDAO = new UserDAO();
String name = new String(request.getParameter("user_Name").getBytes("ISO-8859-1"),"UTF-8");
String id = new String(request.getParameter("user_Id").getBytes("ISO-8859-1"),"UTF-8");
String email = request.getParameter("user_Email");
String password = userDAO.findPassword(name, id, email);
%>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">HOT KEYWORD</a>
		</div>
	</nav>
	<div class="container" align="center">
			<h3>비밀번호 찾음</h3>
			비밀번호는<%=password%>입니다.
			<a href="IdFind.jsp">아이디 찾기</a>
	</div>
</body>
</html>