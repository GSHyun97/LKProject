<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>회원 가입</title>
</head>
<body>
	<div class="container">
			<h3>회원가입</h3>
			<form method="post" action="addMember_Process.jsp"> 
				<p><label>아이디</label>
					<input name="user_Id" type="text" class="form-control" placeholder="아이디를 입력하세요" >5~13자 입력해주세요.
				<p><label>비밀번호</label>
					<input name="user_Password" type="text" class="form-control" placeholder="비밀번호를 입력하세요" >
				<p><label>성명</label>
					<input name="user_Name" type="text" class="form-control">
				<p><label>생일</label>
					<input type="text" name="user_Birth" maxlength="4" placeholder="년(4자)" size="6"> 
					<select name="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<select name="birthdd">
						<option value="">일</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select>
				<p><label>이메일</label>
					<input type="text" name="user_Email" maxlength="50">@ 
					<select name="mail2">
						<option>naver.com</option>
						<option>gmail.com</option>
					</select>
				<p><input type="submit" class="btn btn-primary " value="등록"> 
				<input type="reset" class="btn btn-primary " value="취소" onclick="location.href='mainPage.jsp' ">
			</form>
		</div>
	</body>
</html>