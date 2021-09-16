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
<a> <input type="text" size="20"></a>
<a><input type="button" value="검색"></a>
</header>

<nav id=nav>
통합검색
<p>~~에 대한 @@건의 검색 결과가 있습니다.
</nav>

<section id=section>
이곳은 영상자리
</section>

<footer id=footer>
이곳은 푸터
</footer>

</body>
</html>