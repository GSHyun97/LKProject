<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>비밀번호 찾기</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">HOT KEYWORD</a>
		</div>
	</nav>
	<div class="container" align="center">
			<h3>비밀번호 찾기</h3>
			<h6>비밀번호는 가입한 아이디와 가입시 입력한 이름과 이메일을 통해 찾을 수 있습니다.</h6>
			<form method="post" action="findPasswordAction.jsp">
			 	<p>아이디<input type="text" class="form-control" name='user_Id' required autofocus>
				<p>이름<input type="text" class="form-control" name='user_Name' required>
				<p>이메일<input type="email" class="form-control" name='user_Email' required>
				<p><input class="btn btn-primary form-control" type="submit" value="비밀번호 찾기">
			</form>
					<a href="IdFind.jsp">아이디 찾기</a>
	</div>
</body>
</html>