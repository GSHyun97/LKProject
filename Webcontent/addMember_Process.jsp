<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.dbgetset" scope="page" />
<jsp:setProperty name="user" property="user_Id" />
<jsp:setProperty name="user" property="user_Password" />
<jsp:setProperty name="user" property="user_Name" />
<jsp:setProperty name="user" property="user_Birth1" />
<jsp:setProperty name="user" property="user_Birth2" />
<jsp:setProperty name="user" property="user_Birth3" />
<jsp:setProperty name="user" property="user_Email1" />
<jsp:setProperty name="user" property="user_Email2" />
<html>
<head>
<body>
	<%		
		    if(user.getUser_Id() == null ||user.getUser_Password() == null || user.getUser_Name() == null
			/* || user.getUser_Birth() == null || user.getUser_Email() == null */){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		    } else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.addMember(user);
		    if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 이미 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		    else if (result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='mainPage.jsp'");
				script.println("</script>");
			}
		 }
	%>
</body>
</html>