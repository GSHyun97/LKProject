<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, intial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/addMember.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>회원 가입</title>
<script type="text/javascript">
	function registerCheckFunction(){
		var user_Id = $('#user_Id').val();
		$.ajax({
			type:'POST',
			url:'./UserRegisterCheckServlet',
			data: {user_Id: user_Id},
			success: function(result){
				if(result == 1){
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');
				}else{
					$('#checkMessage').html('이미 존재하는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		})
	}
	function passwordCheckFunction(){
		var user_Password1 = $('#user_Password1').val();
		var user_Password2 = $('#user_Password2').val();
		if(user_Password1 != user_Password2){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		}else{
			$('#passwordCheckMessage').html('');
		}
	}
	function check () {
		var frm = document.frm;
		if( !frm.user_Id.value){
			alert("아이디를 입력하세요!");
			
			frm.user_Id.focus();
			
			return false;
		}
		if( !frm.user_Password1.value){
			alert("비밀번호를 입력하세요!");
			
			frm.user_Password1.focus();
			
			return false;
		}
		if( !frm.user_Password2.value){
			alert("비밀번호 확인을 입력하세요!");
			
			frm.user_Password2.focus();
			
			return false;
		}
		if( frm.user_Password1.value !== frm.user_Password2.value){
			alert("비밀번호를 확인하세요!");
			
			frm.user_Password1.focus();
			
			return false;
		}
		if( !frm.user_Name.value){
			alert("이름을 입력하세요!");
			
			frm.user_Name.focus();
			
			return false;
		}
		if( !frm.user_Birth1.value){
			alert("생일을 입력하세요!");
			
			frm.user_Birth1.focus();
			
			return false;
		}
		if( !frm.user_Birth2.value){
			alert("생일을 입력하세요!");
			
			frm.user_Birth2.focus();
			
			return false;
		}
		if( !frm.user_Birth3.value){
			alert("생일을 입력하세요!");
			
			frm.user_Birth3.focus();
			
			return false;
		}
		if( !frm.user_Email1.value){
			alert("이메일 입력하세요!");
			
			frm.user_Email1.focus();
			
			return false;
		}
		if( !frm.user_Email2.value){
			alert("이메일 입력하세요!");
			
			frm.user_Email2.focus();
			
			return false;
		}
	}


</script>
</head>
<body>
    <div class="container">
        <div class="title">Registration</div>
        <form method="post" name="frm" action="./userRegister" onsubmit="return check()">  <!-- submit을 눌렀을 떄 함수 작동 -->
            <div class="abc">
                <div class="input-box">
                <span class="detail"><label>아이디 </label><button class="btn2" onclick="registerCheckFunction();" type="button">중복확인</button></span>
                <input id="user_Id" name="user_Id" type="text" class="form-control" placeholder="아이디를 입력하세요" maxlength="15"> 
                </div>
                <div class="input-box">
            <p><label>비밀번호</label>
                <input name="user_Password1" id="user_Password1" type="password" class="form-control" onkeyup="passwordCheckFunction();" placeholder="비밀번호를 입력하세요" maxlength='15'>
                </div>
                <div class="input-box">
            <p><label>비밀번호 확인</label>
                <input name="user_Password2" id="user_Password2" type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요" maxlength='15'>
            </div>
            <div class="input-box">
                <p><label>이름</label>
					<input name="user_Name" id="user_Name" type="text" class="form-control" placeholder="이름을 입력하세요">
                </div>
                    <div class="input-box">
				<p><label>생년월일</label>
					<input type="text" class="form-control" name="user_Birth1" maxlength="4" placeholder="년(4자)" size="6">
					<select name="user_Birth2" class="form-control">
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
					<select name="user_Birth3" class="form-control">
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
					</select></div>
                    <div class="input-box">
				<p><label>이메일</label>
					<input type="text" class="form-control" name="user_Email1" maxlength="50"placeholder="이메일을 입력하세요"> @ 
					<select name="user_Email2" class="form-control" onchange="change_email();">
						<option value="">선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
					</select>  </div>
            
            <input type="submit" class="btn btn-primary " value="회원가입" >
            <input type="reset" class="btn btn-primary " value="취소" onclick="location.href='login.jsp' ">
         
        </div>
        </form>
    </div>
		<!-- 이 부분은 유효성 검사 칸 만들어본건데 작동은 잘 되는데 css건드릴때 다시 볼 필요가 있음 -->
	 	<%
			String messageContent = null;
			if(session.getAttribute("messageContent") != null){
				messageContent = (String) session.getAttribute("messageContent");
			}
			String messageType = null;
			if(session.getAttribute("messageType") != null){
				messageType = (String) session.getAttribute("messageType");
			}
			if(messageContent != null){
		%>
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class= "modal-dialog vertical-align-center">
					<div class="modal-content" <% if(messageType.equals("오류메시지")) out.println("panel-warning"); else out.println("panel-success"); %>>
						<div class="modal-header pannel-heading">
							
							<h4 class="modal-title">
								<%= messageType %>
							</h4>
							</div>
							<div class="modal-body">
								<%= messageContent %>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
							</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('#messageModal').modal("show");
		</script>
		<%
			session.removeAttribute("messageContent");
			session.removeAttribute("messageType");
			}
		%>
		 <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class= "modal-dialog vertical-align-center">
					<div id="checkType" class="modal-content panel-info">
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">
								확인 메시지
							</h4>
							</div>
							<div class="modal-body" id="checkMessage">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html> 

222