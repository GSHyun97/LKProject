<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.PostDAO" %>
<%@ page import="user.AdminDAO" %>
<%@ page import="user.ReWriteDAO" %>
<%@ page import="user.HashDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>adminPage</title>
<link rel="stylesheet" href="./css/adminpage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
			<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } 
			.embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
			</style>
<script src="https://kit.fontawesome.com/402914fc57.js"></script>
<style>
ul{
        text-align: center;
        list-style: none;
}
li{
	display:inline-block;
	padding: 10px;
}
body{
	 padding-top:70px;
}
</style>
</head>
<body>

<% 
AdminDAO adminDAO = new AdminDAO();
PostDAO postDAO = new PostDAO();
UserDAO userDAO = new UserDAO();
ReWriteDAO reWriteDAO=new ReWriteDAO();
HashDAO hashDAO=new HashDAO();
%>
<%
String[] hashrank=hashDAO.HashRanking(10);
String[] hashrankView=hashDAO.HashRankingView(10);
%>
	<!-- ADMIN 삽입 부분 0 -->
	<body id="body-pd">
        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> 관리자 권한 페이지</div>
        </header>
        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div> <a href="#" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> 
                    <span class="nav_logo-name">ADMIN</span></a>
                    <div class="nav_list"> <a href="adminpage.jsp" class="nav_link active"> 
                    <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">홈</span> </a> 
                    <!-- <a href="#" class="nav_link"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">회원 관리</span> </a>  --> 
                    <a href="hashtag.jsp" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">조회 수 관리</span> </a>
                	</div>
                </div>
            </nav>
        </div> 

	
<script>
	function openWin(num){
		window.open("onClickPage.jsp?num="+num,"", "width=1px,height=1px,left=20000px");
	}
</script>
<!-- 헤더 부분-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand flex-grow-1" href="index.jsp"><span>HOT KEYWORD</span></a>
        <div class="flex-grow-1 d-flex">
            <form action="./searchPage.jsp" method="get"
				class="form-inline my-2 my-lg0">
				<input type="text" class="form-control mr-sm-2" name="search"
					placeholder="내용을 입력하세요." aria-label="search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
        </div>
        <div class="dropdown">
        <button class="navbar-toggler" type="button" 
        data-toggle="collapse" 
        data-target="#navbarNavAltMarkup" 
        aria-controls="navbarNavAltMarkup" 
        aria-label="Toggle navigation" 
        aria-expanded="false" >
            <span class="navbar-toggler-icon" style="font-size:0.5rem;"></span>            
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav ml-auto">
         </div>
         </div>
        </div>
</nav>

<section>	
	<div class="container-fluid"> 
		<div class="card-header bg-light">
			<div class="row"> 
				<%for(int i=1;i<=postDAO.dbCount();i++){
					int seeState=postDAO.seeState(i);                             //삭제유무 판별할 변수
					if( seeState==1){
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
		        <div class="col-sm-12" style="background-color:#eee;">
		        		<div class="row"> 
		        	<p><%=postTitle%></p>
		        			<div class="col-12 text-right">
					        <a onclick="return confirm('삭제 하시겠습니까?')"href="./deleteAction.jsp?post_Number=<%= i%>">삭제</a>
					        <a >신고된 횟수 <%=postReport%></a>
					        </div>
		        		</div> 
					</div>
	            </div>
	            <%} }%> 
			</div> 
		</div>
	</div>
</section>	

<!-- 페이지 버튼 -->
<section>
	<div class="pageMove" style="margin:30px;">
		<nav>
			<ul class="page">
		      <li><a href="#" style="color:#;">이전</a></li>
		      <li><a href="#">1</a></li>
			  <li><a href="#">2</a></li>
			  <li><a href="#">3</a></li>
			  <li><a href="#">4</a></li>
			  <li><a href="#">5</a></li>
			  <li><a href="#">다음 페이지</a></li>
	    	</ul>
		</nav>
	</div>
</section>	
	
<!-- 모달 안쪽 세션 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dailog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-tittle" id="modal">글 올리기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./userRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>해쉬태그 넣기</label> 
		
								<input type="text" name="post_Hashtag"
									class="form-control" placeholder="ex)#삼성#스마트폰"maxlength="20">
							</div>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" name="post_Title"
								class="form-control" maxlength="40">
							<label>링크</label> <input type="text" name="post_Link"
								class="form-control" maxlength="80">		
							<label>업로드 날짜</label> <input type="text" name="post_UploadDate"
								class="form-control" maxlength="80">								
														

						</div>			
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="reportModal" tabindex="-1" role="dailog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-tittle" id="modal">신고 하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./repoartAction.jsp" method="post">
						<div class="form-group">
							<label>신고 제목</label> <input type="text" name="reportTtitle"
								class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control"
								maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 푸터 부분 -->
	<%@ include file="footer.jsp" %>
<!-- js 스크립 부분 -->
	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="./js/adminpage.js" ></script> 
        <script type="text/javascript" src="adminpage.js" ></script> 
    </body>

</body>
</html>