<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${ contextPath }/resources/css/accordion.min.css" rel="stylesheet">
<script src="${ contextPath }/resources/js/accordion.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	#corpMainArea {
		width: 100%;
		margin-top: 30px;
		height: 790px;
	}
	#sidebar {
		border-right: 1.5px solid #B7B7B7;
		width: 20%;
		float: left;
		height: 590px;
	}
	#sidebarText {
		width: fit-content;
		float: right;
		text-align: right;
		color: #737373;
		margin-top: 10px;
		font-size: 14pt;
		line-height: 50px;
		margin-right: 15px;
	}
	.on {
		color: black;
		font-weight: bold;
	}
	#mainBox {
		width: 54%;
		height: 500px;
		float:left;
		margin-left: 50px;
	}
	#corpSignTable {
		width: 75%;
		margin: 50px auto;
		border-spacing: 0;
		border-collapse: collapse;
	}
	#corpSignTable td {
		font-size: 12px;
		width: 70%;
		font-weight: normal;
		border-bottom: 1px solid #C5C5C5;
		height: 70px;
	}
	#corpSignTable th {
		height: 70px;
		width: 30%;
		text-align: left;
		border-bottom: 1px solid #C5C5C5;
	}
	.ui.selection.dropdown {
		min-width: 80px !important;
	}
	div[name=menu] {
	    color: #616161;
	    font-size: 18px;
	    height: fit-content !important;
	    line-height: 40px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<img src="resources/images/emptyNav.png" style="width: 100%">
	<div id="corpMainArea">
		<div id="sidebar">
			<div id="sidebarText">
				<div>이용약관</div>
				<div class="on">기업 정보 입력</div>
				<div>인증 메일 발송</div>
				<div>회원 가입 완료</div>
			</div>
		</div>
		<!-- 
				private String userId;
				private String userPwd;
				private String userName;
				private String userAddress;
				private String userPhone;
				private String userEmail;
				private String userType;
				private Date leaveDate;
				private Date entDate;
				private Date modifyDate;
				private String companyName;
				private String cRegistrationNumber;
		 -->
		<div id="mainBox">
			<form action="corpSignup.me" method="post" onsubmit="return validate();">
				<table id="corpSignTable">
					<tr>
						<th style="border: 0;">아이디</th>
						<td colspan="2" style="border: 0;">
							<div class="ui input">
								<input type="text" name="userId" id="userId">
							</div>
							<button class="ui blue button" onclick="return duplicationIdCheck();" style="margin-left: 20px;">중복확인</button>
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" style="height: 10px;"><span id="idCheckText" style="font-size: 7pt;"></span></td>
					</tr>
					<tr>
						<th style="border: 0;">비밀번호</th>
						<td colspan="2" style="border: 0;">
							<div class="ui input">
								<input type="password" name="userPwd" id="password">
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" align="left" style="height: 10px; font-size: 7pt;"><span id="pass1Check"></span></td>
					</tr>
					<tr>
						<th style="border: 0;">비밀번호 확인</th>
						<td colspan="2" style="border: 0;">
							<div class="ui input">
								<input type="password" name="passCheck" id="passCheck">
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" align="left" style="height: 10px; font-size: 7pt;"><span id="pass2Check"></span></td>
					</tr>
					<tr>
						<th>마케팅부 담당자 명</th>
						<td colspan="2">
							<div class="ui input">
								<input type="text" name="userName" id="userName">
							</div>
						</td>
					</tr>
					<tr>
						<th>기업 명</th>
						<td colspan="2">
							<div class="ui input">
								<input type="text" name="companyName" id=companyName>
							</div>
						</td>
					</tr>
					<tr>
						<th>사업자 등록 번호</th>
						<td colspan="2">
							<div class="ui input" style="width: 70px;margin-right: 10px;">
								<input type="text" name="corpNum1" id="corpNum1">
							</div>
							-
							<div class="ui input" style="width: 30px; margin-left: 10px; margin-right: 10px;">
								<input type="text" name="corpNum2" id="corpNum2">
							</div>
							-
							<div class="ui input" style=" margin-left: 10px; width: 150px;">
								<input type="text" name="corpNum3" id="corpNum3">
							</div>
							<button class="ui blue button" style="margin-left: 10px;"onclick="return duplicationIdCheck();">사진 업로드</button>
							<input type="hidden" name="cRegistrationNumber" id="cRegistrationNumber">
						</td>
					</tr>
					<tr>
						<th colspan="1" ><h4>담당자 전화</h4></th>
						<td colspan="2">
							<div class="ui selection dropdown" style="margin-right: 10px;">
								<input type="hidden" name="phone1" id="tel1">
								<i class="dropdown icon"></i>
								<div class="default text">선택</div>
								<div class="menu" name="menu">
									<div class="item" data-value="010">010</div>
									<div class="item" data-value="011">011</div>
									<div class="item" data-value="016">016</div>
									<div class="item" data-value="017">017</div>
									<div class="item" data-value="019">019</div>
								</div>
							</div>
							 - 
							<div class="ui input">
								<input type="text" name="phone2" id="tel2" style="width:80px; margin-left: 10px; margin-right: 10px;">
							</div>
							 - 
							<div class="ui input">
								<input type="text" name="phone3" id="tel3" style="width:80px; margin-left: 10px;">
							</div>
							<input type="hidden" id="userPhone" name="userPhone">
							<input type="button" class="ui blue button" id="phoneCertification" value="인증하기" style="margin-left: 20px;">
						</td>
					</tr>
					<tr>
						<th><h4>소재지</h4></th>
						<td>
							<div class="ui input">
								<input type="text" name="post" id="post" size="7px;" readonly>
							</div>
							<div class="ui input">
								<input type="text" name="address" id="address" size="22px;" style="margin-left: 10px;" readonly>
							</div>
							<input type="hidden" name="userAddress" id="userAddress" style="margin-left: 15px;" readonly>
							<input type="button" class="ui blue button" id="findAddress" style="margin-left: 15px;" value="찾기">
						</td>
						<td></td>
					</tr>
					<tr>
						<th></th>
						<td colspan="2">
							<div class="ui input">
								<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소를 입력해주세요." size="35px;"> 
							</div>
						</td>
					</tr>
					<tr>
						<th style="border: 0;"><h4>담당자 이메일</h4></th>
						<td colspan="2" style="border: 0;">
							<div class="ui input">
								<input type="email" name="userEmail" id="userEmail">
							</div>
							<button class="ui blue button" onclick="return duplicationEmailCheck();" style="margin-left: 20px;">중복확인</button>
						</td>
					</tr>
					<tr>
						<th colspan="1" style="height: 10px;"></th>
						<td colspan="2" style="height: 10px;"><span id="emailCheckText" style="font-size: 7pt;"></span></td>
					</tr>
				</table>
			</form>
			<div style="width: fit-content; margin: 30px auto;">
				<input type="submit" class="ui blue button" value="회원가입">
			</div>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
		<script>
			$('.ui.dropdown').dropdown();
			
			$("#findAddress").on("click", function(){
				daum.postcode.load(function(){
			        new daum.Postcode({
			            oncomplete: function(data) {
			            	console.log(data.zonecode);
			            	console.log(data);
			               $("#post").val(data.zonecode);
			               $("#address").val(data.address);
			            }
			        }).open();
			    });
			});
			
			var inval_Arr = new Array(11).fill(false);
			
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
				
				if(inval_Arr[10] == false){
					msg = "휴대폰 인증번호를 확인해 주세요!";
				}
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
	</div>
	<div style="margin-top: 120px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>