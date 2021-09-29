<%@ page contentType="text/html;"%>
<%@ page pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.PostDAO" %>
<html>
<head>
<title>메인페이지</title>
<style>
#header{
	background-color: aqua;
	height: 30px;
}

#nav{
	background-color: gray;
	height: 80px;
	text-align: center;
}

#section{
	background-color: fuchsia;
	height: 500px;
	
}

#footer{
	background-color: purple;
	height: 80px;
}
</style>
</head>
<body>

<%
UserDAO userDAO = new UserDAO();
PostDAO postDAO = new PostDAO();
%>
<header id=header>
<a href="index.jsp">로고</a>
<a> <input type="text" size="20"></a>
<a><input type="button" value="검색"></a>
</header>

<nav id=nav>
통합검색
<%
	String search=request.getParameter("search");
%>
<p><%out.print(search);%>에 대한 <%=postDAO.searchPostCount(search)- postDAO.deletePostCount(search) %>건의 검색 결과가 있습니다.
</nav>

<section>
		<%
		for(int i=1;i<=postDAO.dbCount("post");i++){                    //모든 postDB탐색
			int seeState=postDAO.seeState(i);                             //삭제유무 판별할 변수
			int searchState=postDAO.searchPost(i,search);
			if( seeState==1 && searchState==1){											//삭제가 안된 글만
				String originalAddress=postDAO.seeVideo(i);
				String playerAddress=originalAddress.replace("watch?v=", "embed/");
				String postTitle=postDAO.seeTitle(i);
				
				String postReport=postDAO.seeReport(i);
		%>
	
		<div class="container-fluid"> 
			<div class="card-header bg-light">
				<div class="row"> 
					<div class="col-lg-3" style="border:1px solid gray; background-color:#eee;"> 			
						<p></p><div class='embed-container'>
						<iframe src=<%=playerAddress %> frameborder="0">
						</iframe>
						</div>
						<p><%=postTitle %></p>
						
						<div class="col-lg-12 col-lg-offset-1" style="background-color:#eee;">
							<div class="row"> 
								<div class="col-3 text-left" >
								<a onclick="return confirm('담으시겠습니까?')" href="./likeAction.jsp?user_Id=">담기</a>
								</div>
								<div class="col-9 text-right">
								
									<a onclick="return confirm('좋아요를 누르시겠습니까?')" href="./likeAction.jsp?user_Id=">좋아요</a>
									<a onclick="return confirm('신고 하시겠습니까?')" style="color: red;" href="./reportAction.jsp?user_Id=">신고</a>
								</div>
							</div> 
						</div>
					</div> 

				</div> 
			</div> 
		</div>
	 <%} } %>
	 </section>

<footer id=footer>
이곳은 푸터
</footer>

</body>
</html>