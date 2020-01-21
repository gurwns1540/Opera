<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
<script src="${ contextPath }/resources/js/rolldate.min.js"></script>
<style>
#joinform {
	margin-top: 50px;
	margin-bottom: 50px;
}

#title {
	font-weight: bold;
}

#stitle {
	color: lightgray;
}

h4 {
	font-weight: bold;
}

.ui.button {
	background: #00679A !important;
	margin: 0;
}
/* td{
	border:1px solid red;
} */
#joinform td {
	padding-top: 5px;
	padding-bottom: 5px;
}
.ui.selection.dropdown {
	min-width: 80px;
}
#joinform th {
	text-align: left;
}
#joinform h4 {
	float: right;
	width: 110px;
}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<form action="panelSignup.me" method="post" onsubmit="return validate();">
			<table align="center" id="joinform" >
				<tr>
					<td><h1>회원가입</h1></td>
					<td style="width: 100px;"></td>
					<td style="width: 200px;"></td>
					<td id="stitle" style="width: 100px;"><h4>이용약관</h4></td>
					<td id="title"><h4 style="width: 100px;">정보입력</h4></td>
					<td id="stitle"><h4 style="width: 100px;">가입완료</h4></td>
				</tr>
				<tr>
					<td colspan="6"><hr></td>
				</tr>
				<tr>
					<td><br>
					<br></td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>아이디</h4></th>
					<td><div class="ui input">
							<input type="text" name="userId" id="userId">
						</div></td>
					<td colspan="3"><button class="ui blue button" onclick="return duplicationIdCheck();">중복확인</button></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td colspan="3"><span id="idCheckText" style="font-size: 7pt;"></span></td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>비밀번호</h4></th>
					<td>
						<div class="ui input">
							<input type="password" name="userPwd" id="password">
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2"></th>
					<td colspan="3" align="left" style="font-size: 7pt;"><span id="pass1Check"></span></td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>비밀번호 확인</h4></th>
					<td>
						<div class="ui input">
							<input type="password" name="userPwdCheck" id="passCheck">
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2"></th>
					<td colspan="3" align="left" style="font-size: 7pt;"><span id="pass2Check"></span></td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>이름</h4></th>
					<td>
						<div class="ui input">
							<input type="text" name="userName" id="userName">
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>생년월일</h4></th>
					<td colspan="2">
						<div class="ui input">
							<input type="text" name="panelBirthday" id="panelBirthday">
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>성별</h4></th>
					<td>
						<div class="ui selection dropdown">
							<input type="hidden" name="panelGender" id="panelGender">
							<i class="dropdown icon"></i>
							<div class="default text">성별</div>
							<div class="menu">
								<div class="item" data-value="M">남</div>
								<div class="item" data-value="F">여</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>휴대전화</h4></th>
					<td colspan="3">
						<div class="ui selection dropdown">
							<input type="hidden" name="phone1" id="tel1">
							<i class="dropdown icon"></i>
							<div class="default text">선택</div>
							<div class="menu">
								<div class="item" data-value="010">010</div>
								<div class="item" data-value="011">011</div>
								<div class="item" data-value="016">016</div>
								<div class="item" data-value="017">017</div>
								<div class="item" data-value="019">019</div>
							</div>
						</div>
						<div class="ui input">
							<input type="text" name="phone2" id="tel2" style="width:80px;">
						</div>
						<div class="ui input">
							<input type="text" name="phone3" id="tel3" style="width:80px;">
						</div>
						<input type="hidden" id="userPhone" name="userPhone">
						<button class="ui blue button">인증하기</button>
					</td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>주소</h4></th>
					<td colspan="2">
						<div class="ui input">
							<input type="text" name="post" id="post" size="7px;">
						</div>
						<div class="ui input">
							<input type="text" name="address" id="address" size="22px;">
						</div>
						<input type="hidden" name="userAddress" id="userAddress">
					</td>
					<td><button class="ui blue button">찾기</button></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td colspan="2">
						<div class="ui input">
							<input type="text" name="detailAddress" id="detailAddress" size="35px;">
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>이메일</h4></th>
					<td>
						<div class="ui input">
							<input type="email" name="userEmail" id="userEmail">
						</div>
					</td>
					<td colspan="3"><button class="ui blue button" onclick="return duplicationEmailCheck();">중복확인</button></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td colspan="3"><span id="emailCheckText" style="font-size: 7pt;"></span></td>
				</tr>
				<tr>
					<th colspan="2" align="center"><h4>추천인</h4></th>
					<td><div class="ui input">
							<input type="text" name="nominee">
						</div>
					</td>
					<td colspan="2" style="width: 300px;"><span style="color: #B9B9B9; font-size: 5pt;">*(올바른 추천인코드를 입력하면 소정의 리워드가 지급됩니다.)</span></td>
				</tr>
				<tr>
					<td><br>
					<br></td>
				</tr>
				<tr>
					<td colspan="6"><hr></td>
				</tr>
				<tr>
					<td colspan="6" align="center"><input type="submit" class="ui blue button" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script>
		$('.ui.dropdown').dropdown();
		var today = new Date();
		var year = today.getFullYear();
		new Rolldate({
        	el: '#panelBirthday',
        	format: 'YYYY-MM-DD',
        	beginYear : year - 60,
        	endYear : year - 20,
        	lang: {
               	title: '날짜를 선택하세요',
               	cancel : '취소',
               	confirm : '완료',
             	year : '년',
             	month : '월',
             	day : '일'
        	}
     	});
		var inval_Arr = new Array(10).fill(false);
		
		
		function duplicationIdCheck(){
			var userId = $("#userId").val();
			if(userId == ""){
				$("#idCheckText").css("color", "red");
				$("#idCheckText").text("아이디를 입력해주세요.");
				inval_Arr[0] = false;
			}else{
				$.ajax({
					url:"duplicationIdCheck.me",
					type:"post",
					data:{userId:userId},
					success:function(data){
						console.log(data);
						if(data.isDuplicated == true){
							$("#idCheckText").css("color", "red");
							$("#idCheckText").text("사용중인 아이디입니다.");
							inval_Arr[0] = false;
						}else {
							$("#idCheckText").css("color", "forestgreen");
							$("#idCheckText").text("사용가능한 아이디입니다.");
							inval_Arr[0] = true;
						}
					},
					error:function(status){
						console.log(status);
					}
				});
			}
			
			//폼전송이 안되도록!
			return false;
		}
		
		function duplicationEmailCheck(){
			var userEmail = $("#userEmail").val();
			if(userEmail == ""){
				$("#emailCheckText").css("color", "red");
				$("#emailCheckText").text("이메일을 입력해주세요.");
				inval_Arr[9] = false;
			}else{
				$.ajax({
					url:"duplicationEmailCheck.me",
					type:"post",
					data:{userEmail:userEmail},
					success:function(data){
						console.log(data);
						if(data.isDuplicated == true){
							$("#emailCheckText").css("color", "red");
							$("#emailCheckText").text("사용중인 이메일입니다.");
							inval_Arr[9] = false;
						}else {
							$("#emailCheckText").css("color", "forestgreen");
							$("#emailCheckText").text("사용가능한 이메일입니다.");
							inval_Arr[9] = true;
						}
					},
					error:function(status){
						console.log(status);
					}
				});
			}
			
			//폼전송이 안되도록!
			return false;
		}
		
		// 비밀번호 정규식
		var pattern1 = /[0-9]/; // 숫자 
		var pattern2 = /[a-zA-Z]/; // 문자 
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		
		// 전화번호 정규식
		var tel2J = /^[0-9]{3,4}$/;
		var tel3J = /^[0-9]{4}$/;
		
		$("#password").keyup(function(){
			if (!pattern1.test($('#password').val()) || !pattern2.test($('#password').val()) || !pattern3.test($('#password').val()) || $("#password").val().length <= 8) {
				$("#pass1Check").css({"color":"tomato"});
				$("#pass1Check").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");	
				inval_Arr[1] = false;
			} else {
				$("#pass1Check").css({"color":"green"});
				$("#pass1Check").html("사용가능한 비밀번호 입니다.");	
				inval_Arr[1] = true;
			} 
		});
		$("#passCheck").keyup(function(){
			if ($('#password').val() == $('#passCheck').val()) {
				$("#pass2Check").css({"color":"green"});
				$("#pass2Check").html("비밀번호가 일치합니다.");	
				inval_Arr[2] = true;
			} else {
				$("#pass2Check").css({"color":"tomato"});
				$("#pass2Check").html("비밀번호가 일치하지 않습니다.");	
				inval_Arr[2] = false;
			}
		});
		
		
		function validate() {
			var msg = "입력한 정보들을 다시 한번 확인해주세요";
			
			if(inval_Arr[9] == false){
				msg = "이메일을 정확히 입력해주세요!";
			}
			if($("#detailAddress").val() != ""){
				inval_Arr[8] = true;
			}else {
				inval_Arr[8] = false;
				msg = "상세주소를 입력해주세요!";
			}
			
			if($("#address").val() != ""){
				inval_Arr[7] = true;
			}else {
				inval_Arr[7] = false;
				msg = "주소를 입력해주세요!";
			}
			
			if(tel2J.test($("#tel2").val()) && tel3J.test($("#tel3").val())){
				inval_Arr[6] = true;
			}else {
				inval_Arr[6] = false;
				msg = "올바른 전화번호를 입력해주세요!";
			}
			
			if($("#panelGender").val() != ""){
				inval_Arr[5] = true;
			}else {
				inval_Arr[5] = false;
				msg = "성별을 선택해주세요!";
			}
			
			
			if($("#panelBirthday").val() != ""){
				inval_Arr[4] = true;
			}else {
				inval_Arr[4] = false;
				msg = "생년월일을 입력해주세요!";
			}
			
			if($("#userName").val() != ""){
				inval_Arr[3] = true;
			}else {
				inval_Arr[3] = false;
				msg = "이름을 입력해주세요!";
			}
			if($("#userName").val() != ""){
				inval_Arr[3] = true;
			}else {
				inval_Arr[3] = false;
				msg = "이름을 입력해주세요!";
			}
			if(inval_Arr[2] == false){
				msg = "비밀번호가 일치하지 않습니다!";
			}
			if(inval_Arr[1] == false){
				msg = "올바른 비밀번호를 입력해주세요!";
			}
			if(inval_Arr[0] == false){
				msg = "아이디를 다시 입력해주세요!";
			}

			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			
			var address = $("#post").val() + "/" + $("#address").val() + "/" +  $("#detailAddress").val(); 
		    var passphrase = "1234";
		    var encrypt1 = CryptoJS.AES.encrypt(address, passphrase);
		    var decrypted1 = CryptoJS.AES.decrypt(encrypt1, passphrase);
		 
		    // 암호화 이전의 문자열은 toString 함수를 사용하여 추출할 수 있다.
		    var address1 = decrypted1.toString(CryptoJS.enc.Utf8);
		    
		    $("#userAddress").val(encrypt1);
		    
		    var tel = $("#tel1").val() + "-" + $("#tel2").val() + "-" + $("#tel3").val(); 
		    var encrypt2 = CryptoJS.AES.encrypt(tel, passphrase);
		    var decrypted2 = CryptoJS.AES.decrypt(encrypt2, passphrase );
		 
		    // 암호화 이전의 문자열은 toString 함수를 사용하여 추출할 수 있다.
		    var tel21 = decrypted2.toString(CryptoJS.enc.Utf8);
		    
		   	$("#userPhone").val(encrypt2);
		    
			if(validAll){ // 유효성 모두 통과
				return true;
			} else{
				alert(msg);
				return false;
			}
			console.log(inval_Arr);
			return false;
		}
	</script>
</body>
</html>










