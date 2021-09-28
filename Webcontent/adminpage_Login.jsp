<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>관리자 로그인</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">HOT KEYWORD</a>
		</div>
	</nav>
	<div class="container" align="center">
			<h3>관리자 로그인</h3>
			<form method="post" action="adminlogin_Process.jsp"> 
				<p>아이디<input type="text" class="form-control" name='admin_Id'>
				<p>비밀번호<input type="password" class="form-control" name='admin_Password'>
				<p><input class="btn btn-primary form-control" type="submit" value="로그인">
			</form>
	</div>
</body>
</html>