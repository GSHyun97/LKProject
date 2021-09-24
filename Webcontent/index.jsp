<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, inital-scale=1, shrink-to-fit=no">
<title>웹 사이트</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
			<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } 
			.embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
			</style>
</head>
<body>
<!-- 메인페이지 화면 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">로고</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">메인</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown" href="#"> 회원관리 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">


					</div></li>
			</ul>
			<form action="./index.jsp" method="get"
				class="form-inline my-2 my-lg0">
				<input type="text" class="form-control mr-sm-2" name="search"
					placeholder="내용을 입력하세요." aria-label="search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>

		</div>

	</nav>
	<section class="container">
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

	</section>
	<!-- 1세션 -->
	<div class="container jumbotron"> 
		<div class="row"> <div class="col-sm-2 col-sm-offset-1">1-1세션</div> 
		<div class="col-sm-2 col-sm-offset-1">1-2세션</div> 
		<div class="col-sm-2 col-sm-offset-1">1-3세션</div> 
		<div class="col-sm-2 col-sm-offset-1">1-4세션</div> 
		<div class="col-sm-2 col-sm-offset-1">1-5세션</div> 
		<div class="col-sm-2 col-sm-offset-1">1-6세션</div> 
		</div> 
	</div>
	
		<!-- 2세션 -->
	<div class="container jumbotron"> 
		<div class="row"> <div class="col-sm-3 col-sm-offset-1">2-1세션</div> 
		<div class="col-sm-3 col-sm-offset-1">2-2세션</div> 
		<div class="col-sm-3 col-sm-offset-1">2-3세션</div> 
		<div class="col-sm-3 col-sm-offset-1">2-4세션</div> 

		</div> 
	</div>
	
	<div class="container"> 
		<div class="container-fluid"> 
			<div class="card-header bg-light">
			<div class="row"> 
			<div class="col-sm-4 col-sm-offset-1" style="border:1px solid gray; background-color:#eee;"> 
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
			<div class="col-sm-4 col-sm-offset-1" style="border:1px solid gray; background-color:#eee;"><p>3seesion</p></div> 
			<div class="col-sm-4 col-sm-offset-1" style="border:1px solid gray; background-color:#eee;"><p>4seesion</p></div> 
			</div> 
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


	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2021 이동희 All Rights Reserves. </footer>



	<script src="./js/jquery.min.js"></script>
	<script src="./js/pooper.js"></script>
	<script src="./js/bootstrap.min.js"></script>



</body>
</html>