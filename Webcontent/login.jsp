<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="./css/login.css">
        
        <title>로그인</title>
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
        <div class="title">Login</div>
        <form method="post" action="findIdAction.jsp">   
                <div class="input-box">
                    <!-- 
                    <span class="details">아이디 <button class="btn2" onclick="registerCheckFunction();" type="button">중복확인</button></span> -->
                    <span class="details">아이디</span>
                    <input type="text" placeholder="아이디를 입력해주세요" required autofocus> 
                </div>
                <div class="input-box">
                    <span class="details">비밀번호</span>
                    <input type="text" placeholder="비밀번호를 입력해주세요" required>
                </div>
                <div class="buttons">
                    <div class="button">
                        <button class="btn btn-blue btn-block" type="submit" value="로그인" onclick="location.href='#'">로그인</button> 
                    </div><br>
                    <div class="button">
                        <!-- <input type="reset" value="회원가입" onclick="location.href='#'"> -->
                        <button class="btn btn-blue btn-block" type="submit" value="회원가입" onclick="location.href='#'">회원가입</button> 
                    </div>
                    <div class="button">
                        <!-- <input type="reset" value="회원가입" onclick="location.href='#'"> -->
                        <button class="btn btn-blue btn-block" type="submit" value="아이디 찾기" onclick="location.href='#'">아이디 찾기</button> 
                    </div>
                </div> 
        </form>
    </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
</body>
</html>
