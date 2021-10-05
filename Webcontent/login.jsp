<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="./css/IdFind.css" >
        
        <title>로그인</title>
</head>
<body>
    <div class="bubbles" >
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
        <form method="post" action="loginProcess.jsp">    
                <div class="input-box">
                    <!-- 
                    <span class="details">아이디 <button class="btn2" onclick="registerCheckFunction();" type="button">중복확인</button></span> -->
                    <span class="details">아이디</span>
                    <input type="text" name='user_Id' placeholder="아이디를 입력해주세요" autofocus> 
                </div>
                <div class="input-box">
                    <span class="details">비밀번호</span>
                    <input type="password" name='user_Password'placeholder="비밀번호를 입력해주세요">
                </div>
        
        <div class="buttons">
                    <div class="button">
                        <button class="btn btn-blue btn-block" type="submit" value="로그인" onclick="location.href='index.jsp'">로그인</button> 
                    </div><br>
                    </div>
                    </form>
                    
                    <div class="button">
                        <!-- <input type="reset" value="회원가입" onclick="location.href='#'"> -->
                        <button class="btn btn-blue btn-block" type="submit" value="회원가입" onclick="location.href='addMember.jsp'">회원가입</button>
                    </div>
                    <div class="button">
                        <!-- <input type="reset" value="회원가입" onclick="location.href='#'"> -->
                        <button class="btn btn-blue btn-block" type="submit" value="아이디 찾기" onclick="location.href='IdFind.jsp'">아이디 찾기</button> 
                    </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
</body>
</html>
