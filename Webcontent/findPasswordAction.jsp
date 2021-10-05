<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<head>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/IdFind.css">
        <title>비밀번호를 찾았습니다</title>
</head>
<%
UserDAO userDAO = new UserDAO();
String name = new String(request.getParameter("user_Name").getBytes("ISO-8859-1"),"UTF-8");
String id = new String(request.getParameter("user_Id").getBytes("ISO-8859-1"),"UTF-8");
String email = request.getParameter("user_Email");
String password = userDAO.findPassword(name, id, email);
char[] c = new char[password.length()]; 
for(int i=password.length()-1; i>=0; i--){
   if(i >= password.length()-4){
      c[i]='*';
   }else{
      c[i]=password.charAt(i);
   }
}
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
        <div class="title">Found your Password</div>
                <div class="input-box">
                    <span class="details">비밀번호는 <%for(int i=0;i<password.length(); i++){ %>
         <%=c[i]%>
         <%}%> 입니다.</span>
                </div>
                <div class="buttons">
                    <div class="button">
                        <button class="btn btn-blue btn-block" type="submit" value="로그인" onclick="location.href='login.jsp'">로그인 하러 가기</button> 
                    </div>
                    </div>
                <div class="button">
                        <!-- <input type="reset" value="회원가입" onclick="location.href='#'"> -->
                        <button class="btn btn-blue btn-block" type="submit" value="아이디 찾으러 가기" onclick="location.href='IdFind.jsp'">아이디 찾기</button> 
                    </div>
                </div> 
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
</body>
</html>