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
UserDAO userDAO = new UserDAO();
PostDAO postDAO = new PostDAO();
ReWriteDAO reWriteDAO=new ReWriteDAO();
AdminDAO adminDAO=new AdminDAO(); 

int num=Integer.parseInt(request.getParameter("num"));
%>
<%reWriteDAO.ViewReWrite(num);%>                        <!-- 온클릭페이지 열리면 조회수 오르는 메소드 실행 -->
<%reWriteDAO.hashtagViewReWrite(num);%>					<!-- 온클릭페이지 열리면 해쉬태그조회수 오르는 메소드 실행  -->
<%adminDAO.addTotalView();%>
<script>
	window.close();
</script>
</body>
</html>