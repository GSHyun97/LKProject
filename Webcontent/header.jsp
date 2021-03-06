<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.getUserNumberDAO" %>
<%
	getUserNumberDAO getusernumberDAO = new getUserNumberDAO();
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
