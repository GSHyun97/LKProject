<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.PostDAO" %>
<%@ page import="user.ReWriteDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
UserDAO userDAO = new UserDAO();
PostDAO postDAO = new PostDAO();
ReWriteDAO reWriteDAO=new ReWriteDAO();
%>
<script>
	function openWin(num){
		window.open("onClickPage.jsp?num="+num,"", "width=100px,height=100px");
	}
</script>
<a onclick="openWin(3);" href="#">ddd</a>
</body>
</html>