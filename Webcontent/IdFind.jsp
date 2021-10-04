<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>

<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/IdFind.css">
        <title>아이디 찾기</title>
</head>
<body>
    <div class="bubbles">
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
    </div>
    <div class="user-details" data-label="HOT TREND">
    <div class="Home" OnClick="location.href ='index.jsp'">HOT KEYWORD</div>
    <div class="container">
        <div class="title">Forgot your ID?</div>
        <form method="post" action="findIdAction.jsp">
            
                <div class="input-box">
                    <!-- 
                    <span class="details">아이디 <button class="btn2" onclick="registerCheckFunction();" type="button">중복확인</button></span> -->
                    <span class="details">이름</span>
                    <input type="text" name='user_Name' placeholder="이름을 입력해주세요" autofocus> 
                </div>
                <div class="input-box">
                    <span class="details">이메일</span>
                    <input type="text" name='user_Email' placeholder="이메일을 입력해주세요">
                </div>
        
                <div class="buttons">
                    <div class="button">
                        <button class="btn btn-blue btn-block" type="submit" value="아이디 찾기">확인</button> 
                    </div>
                    </div>
                </form>
                <div class="button">
                        <!-- <input type="reset" value="회원가입" onclick="location.href='#'"> -->
                        <button class="btn btn-blue btn-block" type="submit" value="비밀번호 찾으러 가기" onclick="location.href='passwordFind.jsp'">비밀번호 찾으러 가기</button> 
                    </div>
                </div> 
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
</body>
</html>