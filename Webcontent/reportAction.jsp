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
int num=Integer.parseInt(request.getParameter("num"));
%>
<%reWriteDAO.ReportReWrite(num);%>            
<script>
	window.close();//닫힘
</script>
</body>
</html>