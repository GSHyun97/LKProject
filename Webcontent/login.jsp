<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Login</title>
</head>
<body>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3><a href="./mainPage.jsp">HOT KEYWORD</a></h3>
			<form action="loginProcess.jsp" method="post"> 
				<p>아이디<input type="text" class="form-control" name='id'>
				<p>비밀번호<input type="password" class="form-control" name='password'>
				<p><button class="btn" type="submit">로그인</button></p>
			</form>
					<a href="passwordfind.jsp">아이디/비밀번호 찾기</a>
					<a href="addMember.jsp">회원가입</a>
		</div>
	</div>
</body>
</html>