<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="user.AdminDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.PostDTO" scope="page" />
<jsp:setProperty name="user" property="post_seeState" />
<html>
<head>
<body>
	<%		
		AdminDAO adminDAO = new AdminDAO();
		String abc = request.getParameter("post_Number");
		int num=Integer.parseInt(abc);
		int result = adminDAO.delete(num);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'adminpage.jsp'");
			script.println("</script>");	//ggsadasdasdsfafsss
		}
	%>
</body>
</html>