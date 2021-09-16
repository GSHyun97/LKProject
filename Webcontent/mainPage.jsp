<%@ page contentType="text/html;"%>
<%@ page pageEncoding="utf-8"%>
<html>
<head>
<title>메인페이지</title>
<style>
#header{
	background-color: aqua;
	height: 30px;
}

#nav{
	background-color: gray;
	height: 80px;
	text-align: center;
}

#section{
	background-color: fuchsia;
	height: 500px;
	
}

#footer{
	background-color: purple;
	height: 80px;
}
</style>
</head>
<body>
<header id=header>
<a href="mainPage.jsp">로고</a>
<a> <input type="text" size="20" name="search"></a>
<a><input type="button" value="검색" onclick="location.href='searchPage.jsp'"></a>
</header>

<nav id=nav>
Hot KeyWord
<p>데이터1 데이터2 데이터3 데이터4 데이터5 데이터6
</nav>

<section id=section>
이곳은 영상자리
</section>

<footer id=footer>
이곳은 푸터
<a href = "adminpage.jsp">관리자</a>
</footer>

</body>
</html>