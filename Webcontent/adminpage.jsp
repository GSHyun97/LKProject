<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.PostDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<table style="width: 80%">

	<tr style="background-color: #ccbbcc; text-align: center;" >

		<td><a href="../index.jsp">Main</a></td>

		<td><a href="#">회원관리</a></td>

		<td><a href="#">조회 수 관리</a></td>

		<td><a href="#">주문관리</a></td>
		
		<td><a href="#">로그아웃</a></td>
	</tr>
</table>
<%
UserDAO userDAO = new UserDAO();
PostDAO postDAO = new PostDAO();
%>
<section>	
	<div class="container-fluid"> 
		<div class="card-header bg-light">
			<div class="row"> 
				<%for(int i=1;i<=postDAO.dbCount("post");i++){
				String originalAddress=postDAO.seeVideo(i);
				String playerAddress=originalAddress.replace("watch?v=", "embed/");
				String postTitle=postDAO.seeTitle(i);
				String postReport=postDAO.seeReport(i);
				%> 
				<div class="col-lg-3" style="border:1px solid gray; background-color:#eee;"> 
		        <p></p>
		        <div class='embed-container'>
		        <iframe src=<%=playerAddress%>>
				</iframe>
		        </div>
		        	<p><%=postTitle%></p>
		        			<div class="col-9 text-right">
					        <a onclick="return confirm('삭제 하시겠습니까?')"href="./deleteAction.jsp?post_Number=<%= i%>">삭제</a>
					        <a >신고된 횟수 <%=postReport%></a>
					        </div>
		        		</div> 
		        	</div>
	            </div>
	            <%}%> 
			</div> 
</section>
</body>
</html>