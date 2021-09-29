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
<!--<script>
	function openWin(num){
		window.open("onClickPage.jsp?num="+num,"", "width=100px,height=100px");
	}
</script>
<a onclick="openWin(3);" href="#">ddd</a>
-->
<script>
	function openWin(num){
		window.open("onClickPage.jsp?num="+num,"", "width=1px,height=1px,left=20000px");
		
	}
	
</script>
<section>	

	<div class="container-fluid"> 
		<div class="card-header bg-light">
			<div class="row"> 
				<%for(int i=1;i<=postDAO.dbCount("post");i++){                    //모든 postDB탐색
			int seeState=postDAO.seeState(i);                             //삭제유무 판별할 변수
			if( seeState==1){											//삭제가 안된 글만
				String originalAddress=postDAO.seeVideo(i);
				String playerAddress=originalAddress.replace("watch?v=", "embed/");
				String postTitle=postDAO.seeTitle(i);
				String postHashtag=postDAO.seeHashtag(i);
				String postView=postDAO.seeView(i);
				String postLike=postDAO.seeLike(i);
				String postReport=postDAO.seeReport(i);
		%>
				<div class="col-lg-3" style="border:1px solid gray; background-color:#eee;"> 
		        <p></p>
		        <div class='embed-container'>
		        <iframe src=<%=playerAddress%>>
				</iframe>
		        </div>
		       
		       
		        <a onclick="openWin(<%=i %>,<%=postHashtag %>);" href=<%=originalAddress %>  > <%=postTitle%> </a>
				<p>
				<%String[] array=postHashtag.split("#"); %>
					<% int j=1 ;%>
					<%for(j=1;j<array.length;j++){%>
					<a href="searchPage.jsp?search=<%=array[j]%>" >#<%=array[j]%></a>
					<%} %>
				</p>
				
				
		        	<div class="col-sm-12" style="background-color:#eee;">
		        		<div class="row"> 
		        		<div class="col-3 text-left" >
		        		<a onclick="return confirm('담으시겠습니까?')" href="./likeAction.jsp?user_Id=">담기</a>
		        		</div>
		        			<div class="col-9 text-right">
					        <span style="color: green;"><%=postView %>View</span>
							<span style="color: green;"><%=postLike %>Like</span>
					        <a onclick="return confirm('좋아요를 누르시겠습니까?')" href="./likeAction.jsp?user_Id=">좋아요</a>
					        <a onclick="return confirm('신고 하시겠습니까?')" style="color: red;" href="./reportAction.jsp?user_Id=">신고</a>
					        </div>
		        		</div> 
		        	</div>
	            </div>
	            <%} }%> 
			</div> 
		</div> 
	</div>
</section>

</body>
</html>