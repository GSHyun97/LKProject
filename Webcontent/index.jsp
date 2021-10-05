<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.PostDAO" %>
<%@ page import="user.PostDTO" %>
<%@ page import="user.ReWriteDAO" %>
<%@ page import="user.HashDAO" %>
<%@ page import="user.getUserNumberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>웹 사이트</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
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
HashDAO hashDAO=new HashDAO();
getUserNumberDAO getusernumberDAO = new getUserNumberDAO();

%>

<%
	int pageNumber = 1;
	if(request.getParameter("pageNumber") !=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
%>

<%

String[] hashrank=hashDAO.HashRanking(6);
int loginState=1;

%>
<script>
function BookmarkopenWin(num,userNum){
	window.open("onClickBookmarkPage.jsp?num="+num+"&userNum="+userNum,"", "width=1px,height=1px,left=20000px");
}
function UnBookmarkopenWin(num,userNum){
	window.open("onClickUnBookmarkPage.jsp?num="+num+"&userNum="+userNum,"", "width=1px,height=1px,left=20000px");
}
	
	function openWin(num){
		window.open("onClickPage.jsp?num="+num,"", "width=1px,height=1px,left=20000px");
	}
	function LikeopenWin(num,userNum){
		window.open("onClickLikePage.jsp?num="+num+"&userNum="+userNum,"", "width=1px,height=1px,left=20000px");
	}
	function UnLikeopenWin(num,userNum){
		window.open("onClickUnLikePage.jsp?num="+num+"&userNum="+userNum,"", "width=1px,height=1px,left=20000px");
	}
	function refresh(){
		location.reload();
	}
	function adrressmove(adrress){
		location.href="adrress";
		return true;
	}
</script>
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
		<a class="dropdown-item" href="bookmarkPage.jsp">내가 담은글</a>
		<a class="dropdown-item" href="myWritePage.jsp">내가 쓴글</a>
		<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
            </div>
            <%	
		}
		%>
         </div>
        </div>
</nav>
<!-- 헤더부분 끝 -->


<!-- 태그 삽입 부분 -->
<nav class="hot">
	<span>Hot Trend</span>
</nav>
<nav>
	<ul class="a">
	<%for(int i=0;i<6;i++){ %>
      <li><a href="searchPage.jsp?search=<%=hashrank[i]%>">#<%=hashrank[i] %></a></li>
	  <%} %>
    </ul>
</nav>

<!-- 메인페이지 헤더 부분화면
<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">로고</a>  
    <div class="dropdown">
	  <button class="navbar-toggler" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	    <a class="dropdown-item" href="#">로그인</a>
	    <a class="dropdown-item" href="#">회원가입</a>
	    <a class="dropdown-item" href="#">비인칸</a>
	  </div>
	</div>
   </div>
</nav> -->
<!-- 메인페이지 바디 검색 부분화면 
<nav>
	<div class="container" style="text-align: center; margin: 0auto;" > 
	<div style="display: inline-block; padding-left:0;"> 
	 	<form action="./index.jsp" method="get"
		class="form-inline my-2 my-lg0">
		<input type="text" class="form-control mr-sm-2" name="search"
		placeholder="내용을 입력하세요." aria-label="search">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
		</form>
	</div> 
	</div> -->
	
<!-- 중앙 바디 부분 
</nav>
	<section class="container">
	<div class="container" style="text-align: center; margin: 0auto;" > 
  	<div style="border: 1px solid; display: inline-block;"> 
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="LectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="전공" >예1</option>
				<option value="교양" >예2</option>

			</select> 
			<select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="최신순">조회순</option>
				<option value="최신순">좋아요순</option>
			</select>
			
			<input type="text" name="search" class="form-control mx-1 mt-2"
				placeholder="ex)#삼성#스마트폰">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
				href="#registerModal">등록하기</a> <a class="btn btn-danger mx-1 mt-2"
				data-toggle="modal" href="#reportModal">신고</a>
		</form>
	</div> 
	</div>
</section>
	-->
	<%
		int postCount=postDAO.dbCount("post");
		int mpn=(postCount%8==0)? postCount/8:postCount/8+1;
	%>
<section>	
	<div class="container-fluid"> 
		<div class="card-header bg-light">
			<div class="row" id="post"> 
				
				<%
					int[][] post=postDAO.postnum(mpn);
				/*for(int i=0;i<mpn;i++) {
					for(int j=0;j<8;j++) {
						System.out.println("["+i+"]"+"["+j+"]:"+post[i][j]);
					}
				}*/
				%>
				
				<%for(int i=0; i<8;i++){                    //모든 postDB탐색
					int seei=post[pageNumber-1][i];
			if( postDAO.seeState(seei)==1){											//삭제가 안된 글만
				String originalAddress=postDAO.seeVideo(seei);
				String playerAddress=originalAddress.replace("watch?v=", "embed/");
				String postTitle=postDAO.seeTitle(seei);
				String postHashtag=postDAO.seeHashtag(seei);
				String postView=postDAO.seeView(seei);
				String postLike=postDAO.seeLike(seei);
				String postReport=postDAO.seeReport(seei);
				%>
				<div class="col-lg-3" style="border:1px solid gray; background-color:#eee;"> 
		        <p></p>
		        <div class='embed-container'>
		        <iframe src=<%=playerAddress%>>
				</iframe>
		        </div>
		       
		       
		        <a onclick="openWin(<%=i %>); refresh();"href=<%=originalAddress%> target="_blank"> <%=postTitle%> </a> <!-- 09.29 현강섭,제목 클릭시 유튜브링크로 이동하면서 조회수 증가 -->
		        
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
		        		
		        		
		        		<%if(user_Number==0) {%>  
		        		<a onclick="if(!confirm('로그인 상태에서 가능합니다 로그인 페이지로 이동하시겠습니까?')){return false;}" href="./login.jsp">담기</a>
		        		<%}else{ %>
		        			<%if(reWriteDAO.BookmarkUserInquiry(seei,user_Number)) {%>      <!-- 담기 되어있으면 -->
		        				<a onclick="UnBookmarkopenWin(<%=seei %>,<%=user_Number %>); refresh();  " href="#">담기 취소</a>
		        			<%}else{ %>
		        				<a onclick="BookmarkopenWin(<%=seei %>,<%=user_Number %>); refresh();  " href="#">담기</a>
		        			<%} %>
		        		<%} %>
		        		</div>
		        			<div class="col-9 text-right">
					        <span style="color: green;"><%=postView %>View</span>
							<span style="color: green;"><%=postLike %>Like</span>
							
							<%
							if(user_Number==0) {%>                                  <!-- 10.02현강섭 좋아요 -->
								<a onclick="if(!confirm('로그인 상태에서 가능합니다 로그인 페이지로 이동하시겠습니까?')){return false;}" href="./login.jsp">좋아요</a>
							<%}else{ %>
								<%if(reWriteDAO.LikeUserInquiry(seei,user_Number)) {%>      <!-- 좋아요 되어있으면 -->
								<a onclick="UnLikeopenWin(<%=seei %>,<%=user_Number %>); refresh();  " href="#">좋아요취소</a>
								<%}else{ %>
					       		 <a onclick="LikeopenWin(<%=seei %>,<%=user_Number %>); refresh(); " href="#">좋아요</a>
					       		<%} %>
					        <%} %>
					        
					        <a onclick="if(!confirm('신고 하시겠습니까?')){return false;}" href="./reportAction.jsp?num=<%=seei%>"rel="noopener" target="_blank" moveTo(10000,1000)>신고</a>
					        </div>
		        		</div> 
		        	</div>
	            </div>
	            <% 
	            
					} //if끝
			
				}//for끝
				%> 
			</div> 
		</div> 
	</div>
</section>

<section>
	<div class="pageMove" style="margin:30px;">
		<nav>
			<ul class="page">
		      <li>
		      <%if(pageNumber!=1){ %><a href="index.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a><%} %>
		      <%for(int i=1;i<=mpn;i++){ %><li><a href="index.jsp?pageNumber=<%=i%>"><%=i %></a></li> <%} %>				<!-- 페이지번호나오는 for문 -->
			  <%if(pageNumber!=mpn){ %> <a href="index.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">다음</a><%} %>
			  </li>
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