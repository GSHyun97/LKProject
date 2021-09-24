<%@ page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>아이디중복체크</h2>
<%
request.setCharacterEncoding("UTF-8");
String user_Id = request.getParameter("user_Id");


UserDAO mdao = new UserDAO();

//3. addIdCheck(ID)메서드
int result = mdao.addIdCheck(user_Id);
if (result == 1){
	out.print("사용가능한 아이디입니다");
	%>
	 <input type="button" value="아이디 사용하기" onclick="result();">
	<%
	
}else if(result == 0){
	out.print("중복된 아이디입니다");
}else{
	out.print("에러 발생!!!(-1)"); 
}

%>
<!-- 4.팝업창구현  -->
<fieldset>
	<form action="joinIdCheck.jsp" method="post" name="wfr">
		ID : <input type="text" name="userid" value="<%=user_Id%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

<!-- 6. 선택된아이디는 중복확인창에서 회원가입 페이지로 정보전달  -->
 <script type="text/javascript">
    function result(){
    	opener.document.fr.id.value = document.wfr.userid.value;
    	opener.document.fr.id.readOnly=true;
    	window.close();
    }
 </script>
</body>