<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="user.AdminDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.AdminDTO" scope="page" />
<jsp:setProperty name="user" property="admin_Id" />
<jsp:setProperty name="user" property="admin_Password" />
<html>
<head>
<body>
	<%		
		AdminDAO adminDAO = new AdminDAO();
		int result = adminDAO.adminlogin(user.getAdmin_Id(), user.getAdmin_Password());
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'adminpage.jsp'");
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
	%>
</body>
</html>