<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.PostDAO" %>
<%@ page import="user.ReWriteDAO" %>
<%@ page import="user.getUserNumberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>웹 사이트</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<link rel="stylesheet" href="./css/searchPage.css">
			<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } 
			.embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
			</style>
<script src="https://kit.fontawesome.com/402914fc57.js" crossorigin="anonymous"></script>
<style>
ul{
        text-align: center;
        list-style: none;
}
li{
	display:inline-block;
	padding: 10px;
}

</style>
</head>
<body>
<%
UserDAO userDAO = new UserDAO();
PostDAO postDAO = new PostDAO();
ReWriteDAO reWriteDAO=new ReWriteDAO();
getUserNumberDAO getusernumberDAO = new getUserNumberDAO();

%>
<script>
	function openWin(num){
		window.open("onClickPage.jsp?num="+num,"", "width=1px,height=1px,left=20000px");
	}
</script>
<!-- 헤더 부분-->
<!-- 헤더 부분-->
<%
String user_Id = null;
int user_Number=0;
int headerSeeState=0;
if(session.getAttribute("user_Id") != null){
	user_Id=(String) session.getAttribute("user_Id");
	user_Number=getusernumberDAO.getUserNumber(user_Id);
}
if(user_Number>0) headerSeeState=1;
//if(관리자페이지면) headerSeeState=2;
%>
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
		<%
		if(headerSeeState==0){
		%>
		<a class="dropdown-item" href="login.jsp">로그인</a>
	    <a class="dropdown-item" href="addMember.jsp">회원가입</a>
		<%
		}else if (headerSeeState==1){
		%>
		<a class="dropdown-item" data-toggle="modal" href="#registerModal">글 올리기</a>
		<a class="dropdown-item" href="#">내가 담은글</a>
		<a class="dropdown-item" href="#">내가 쓴글</a>
		<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
            </div>
            <%	
		}
		%>
         </div>
        </div>
</nav>
<!-- 헤더부분 끝 -->

<!-- 통합검색 글자부분 -->
	<div class="curation">
        <div class="content-header sub-visual">
            <div class="cont-wrap ">
                <div class="cont ">
                    <h2>통합검색</h2>
                    
                    <% 
                    String search=request.getParameter("search");
					%>
					<p><strong>'<%out.print(search);%>'</strong>에 대한
					<span class="searchCo" style="color:rgb(90, 170, 200);"><%=postDAO.searchPostCount(search)- postDAO.deletePostCount(search) %>건</span>의 검색 결과가 있습니다.</p>
					
                </div>
            </div>
        </div>
    </div> 
    
<section>	
	<div class="container-fluid"> 
		<div class="card-header bg-light">
			<div class="row"> 
			<%
			for(int i=1;i<=postDAO.dbCount("post");i++){                    //모든 postDB탐색
				int seeState=postDAO.seeState(i);                           //삭제유무 판별할 변수
				int searchState=postDAO.searchPost(i,search);
			if( seeState==1 && searchState==1){								//삭제가 안된 글만
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
		        
		        <a onclick="openWin(<%=i %>);" href=<%=originalAddress%>  > <%=postTitle%> </a> <!-- 09.29 현강섭,제목 클릭시 유튜브링크로 이동하면서 조회수 증가 -->
		        
				<p>                                                   <!-- 09.29 현강섭,해쉬태그 클릭시 검색 -->
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
	
	
</body>
</html>