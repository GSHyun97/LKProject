<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">CF Master</a>
		</div>
	</nav>
	<div class="container" align="center">
			<h3><a href="./index.jsp">CF Master</a></h3>
			<form method="post" action="loginProcess.jsp"> 
				<p>아이디<input type="text" class="form-control" name='user_Id'>
				<p>비밀번호<input type="password" class="form-control" name='user_Password'>
				<p><input class="btn btn-primary form-control" type="submit" value="로그인">
			</form>
					<a href="addMember.jsp">회원가입</a>
	</div>
</body>
</html>