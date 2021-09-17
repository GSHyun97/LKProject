<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="mainPage.jsp">HOT KEYWORD</a>
		</div>
	</nav>
	<div class="container" align="center">
			<h3><a href="./mainPage.jsp">HOT KEYWORD</a></h3>
			<form method="post" action="loginProcess.jsp"> 
				<p>아이디<input type="text" class="form-control" name='user_Id'>
				<p>비밀번호<input type="password" class="form-control" name='user_Password'>
				<p><input class="btn btn-primary form-control" type="submit" value="로그인">
			</form>
					<a href="passwordfind.jsp">아이디/비밀번호 찾기</a>
					<a href="addMember.jsp">회원가입</a>
	</div>
</body>
</html>