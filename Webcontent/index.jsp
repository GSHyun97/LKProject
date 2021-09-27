<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
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
.form-inline{
	padding-left:100px;
}
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

<!-- 회원가입, 로그인 jsp에도 넣어야함! , 2행 printwriter 추가해야해-->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand flex-grow-1" href="#">로고</a>
        <div class="flex-grow-1 d-flex">
            <form class="form-inline flex-nowrap bg-light mx-0 mx-lg-auto rounded p-2">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit"><i class="fa fa-search"></i></button>
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

		<a class="dropdown-item" href="#">로그인</a>
	    <a class="dropdown-item" href="#">회원가입</a>

		<a class="dropdown-item" href="#">내가 담은글</a>
		<a class="dropdown-item" href="#">내가 쓴글</a>
		<a class="dropdown-item" href="#">로그아웃</a>

            </div>
         </div>
        </div>
    </nav>
</header>

<!-- 태그 삽입 부분 -->
<div class="menu">
    <ul>
      <li><a href="#">태그1</a></li>
	  <li><a href="#">태그2</a></li>
	  <li><a href="#">태그3</a></li>
	  <li><a href="#">태그4</a></li>
	  <li><a href="#">태그5</a></li>
	  <li><a href="#">태그6</a></li>
    </ul>
</div>
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
		<!-- 2세션 
	<div class="container jumbotron"> 
		<div class="row"> <div class="col-sm-3 col-sm-offset-1">2-1세션</div> 
		<div class="col-sm-3 col-sm-offset-1">2-2세션</div> 
		<div class="col-sm-3 col-sm-offset-1">2-3세션</div> 
		<div class="col-sm-3 col-sm-offset-1">2-4세션</div> 

	</div> 
	-->
	

		<div class="container-fluid"> 
			<div class="card-header bg-light">
			<div class="row"> 
			<div class="col-sm-3 col-sm-offset-1" style="border:1px solid gray; background-color:#eee;"> 
			<p><div class='embed-container'>
			<iframe src='https://www.youtube.com/embed/QILiHiTD3uc' frameborder='0' allowfullscreen>
			</iframe>
			</div></p>
			<p>Title</p>
			<p>#태그1 #태그2</p>
			<div class="col-sm-12 col-sm-offset-1" style="background-color:#eee;">
				<div class="row"> 
					<div class="col-3 text-left" >
					<a onclick="return confirm('담으시겠습니까?')" href="./likeAction.jsp?user_Id=">담기</a>
					</div>
					<div class="col-9 text-right">
					<span style="color: green;">Like 20</span>
					<span style="color: green;">View 20</span>
						<a onclick="return confirm('좋아요를 누르시겠습니까?')" href="./likeAction.jsp?user_Id=">좋아요</a>
						<a onclick="return confirm('신고 하시겠습니까?')" style="color: red;" href="./reportAction.jsp?user_Id=">신고</a>
					</div>
				</div> 
			</div>
			</div> 
			<div class="col-sm-3 col-sm-offset-1" style="border:1px solid gray; background-color:#eee;"><p>2seesion</p></div> 
			<div class="col-sm-3 col-sm-offset-1" style="border:1px solid gray; background-color:#eee;"><p>3seesion</p></div>
			<div class="col-sm-3 col-sm-offset-1" style="border:1px solid gray; background-color:#eee;"><p>4seesion</p></div>  
			</div> 
			</div> 
			<div class="card-header bg-light">
			<div class="row"> 
			<div class="col-lg-3 col-lg-offset-1" style="border:1px solid gray; background-color:#eee;"><p>5seesion</p></div> 
			<div class="col-lg-3 col-lg-offset-1" style="border:1px solid gray; background-color:#eee;"><p>6seesion</p></div> 
			<div class="col-lg-3 col-lg-offset-1" style="border:1px solid gray; background-color:#eee;"><p>7seesion</p></div> 
			<div class="col-lg-3 col-lg-offset-1" style="border:1px solid gray; background-color:#eee;"><p>8seesion</p></div>
			</div> 
			</div> 
			
		</div>

		


	
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
	<footer id = footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2021 2조 All Rights Reserves. <a href="adminpage.jsp">관리자</a></footer>

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