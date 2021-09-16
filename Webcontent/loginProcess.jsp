<%@page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>로그인 프로세스</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("id");
		String password = request.getParameter("password");
		
		if (userid.equals("admin") && password.equals("1234")){
			response.sendRedirect("mainPage.jsp");
		} else {
			response.sendRedirect("login_failed.jsp");
		}
	%>
</body>
</html>