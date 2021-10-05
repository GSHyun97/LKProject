<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/IdFind.css">
        <title>아이디를 찾았습니다</title>
</head>
<%
UserDAO userDAO = new UserDAO();
String name = new String(request.getParameter("user_Name").getBytes("ISO-8859-1"),"UTF-8");
String email = request.getParameter("user_Email");
String id = userDAO.findId(name, email);
%>
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
        <div class="title">Found your ID</div>
                <div class="input-box">
                    <span class="details">아이디는 <%=id%> 입니다.</span>
                </div>
                <div class="buttons">
                    <div class="button">
                        <button class="btn btn-blue btn-block" type="submit" value="홈" onclick="location.href='index.jsp'">홈</button> 
                    </div>
                    </div>
                <div class="button">
                        <!-- <input type="reset" value="회원가입" onclick="location.href='#'"> -->
                        <button class="btn btn-blue btn-block" type="submit" value="비밀번호 찾으러 가기" onclick="location.href='passwordFind.jsp'">비밀번호 찾으러 가기</button> 
                    </div>
                </div> 
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
</body>
</html>