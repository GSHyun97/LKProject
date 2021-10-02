<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserDTO" scope="page" />
<jsp:setProperty name="user" property="user_Id" />
<jsp:setProperty name="user" property="user_Password" />
<html>
<head>
<body>
	<%	
	String user_Id=null;
	if(session.getAttribute("user_Id") != null){
		user_Id = (String) session.getAttribute("user_Id");
	}
	if(user_Id !=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUser_Id(), user.getUser_Password());
		if(result == 1){
			session.setAttribute("user_Id", user.getUser_Id());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>