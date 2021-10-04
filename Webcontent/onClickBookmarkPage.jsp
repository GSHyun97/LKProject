<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.PostDAO" %>
<%@ page import="user.ReWriteDAO" %>
<%@ page import="user.AdminDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
ReWriteDAO reWriteDAO=new ReWriteDAO();
int num=Integer.parseInt(request.getParameter("num"));   
int userNum=Integer.parseInt(request.getParameter("userNum"));
%>

<%
		reWriteDAO.BookmarkUserReWrite(num,userNum);
%>
opener.location.reload();
<script>
	window.close();
</script>
</body>
</html>