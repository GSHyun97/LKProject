<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="test002.PostDTO"%>
<%@ page import="test002.PostDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	

	String post_Title = null;
	String post_Link = null;	
	String post_Hashtag = null;
	String post_UploadDate = null;
	
	if (request.getParameter("post_Title") != null) {
		post_Title = request.getParameter("post_Title");
	}
	if (request.getParameter("post_Link") != null) {
		post_Link = request.getParameter("post_Link");
	}
	if (request.getParameter("post_Hashtag") != null) {
		post_Hashtag = request.getParameter("post_Hashtag");
	}
	if (request.getParameter("post_UploadDate") != null) {
		post_UploadDate = request.getParameter("post_UploadDate");
	}
	
	if (post_Title == null || post_Link == null || post_Hashtag == null ||
	post_UploadDate == null || 
	post_Title.equals("") || post_Link.equals("") 
	|| post_Hashtag.equals("") || post_UploadDate.equals("") ) {
	
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('빈칸을 모두 입력 해주세요.');");
		script.println("histroy.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	test002.PostDAO postDAO = new test002.PostDAO();
	int result = postDAO.write(new test002.PostDTO(0, post_Title, post_Link, post_Hashtag, 0, 0, 0, post_UploadDate));
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('올리기에 실패하였습니다.');");
		script.println("histroy.back();");
		script.println("</script>");
		script.close();
		//return;
	
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		//return;
	
	}
%>

	

	
	
	
	
	
