<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="user.PostDTO"%>
<%@ page import="user.PostDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("UTF-8");
   
   
   String post_Title = null;
   String post_Link = null;   
   String post_Hashtag = null;
   int post_User = 0;
   
   if (request.getParameter("post_Title") != null) {
      post_Title = request.getParameter("post_Title");
   }
   if (request.getParameter("post_Link") != null) {
      post_Link = request.getParameter("post_Link");
   }
   if (request.getParameter("post_Hashtag") != null) {
      post_Hashtag = request.getParameter("post_Hashtag");
   }
   if (request.getParameter("post_User") != null) {
      post_User = Integer.parseInt(request.getParameter("post_User"));
   }

   if (post_Title == null || post_Link == null || post_Hashtag == null || 
   post_Title.equals("") || post_Link.equals("") 
   || post_Hashtag.equals("")){
   
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('빈칸을 모두 입력 해주세요.');");
      script.println("histroy.back();");
      script.println("</script>");
      script.close();
      return;
   }
   user.PostDAO postDAO = new user.PostDAO();
   int result = postDAO.write(post_Title, post_Link, post_Hashtag, post_User);
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