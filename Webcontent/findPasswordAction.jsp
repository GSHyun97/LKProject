<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<head>
<title>비밀번호 찾기</title>

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
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <a class="navbar-brand" href="index.jsp">HOT KEYWORD</a>
      </div>
   </nav>
   <div class="container" align="center">
         <h3>비밀번호 찾음</h3>
         비밀번호는 <%for(int i=0;i<password.length(); i++){%>
         <%=c[i]%>
         <%}%>입니다.
         <a href="IdFind.jsp">아이디 찾기</a>
   </div>
</body>
</html>