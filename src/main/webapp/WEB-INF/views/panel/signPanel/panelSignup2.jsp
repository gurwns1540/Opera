<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
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
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<!-- <form action=""> -->
		<form action="panelSignup.me" method="post">
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
					<td colspan="2" align="center"><h4>아이디</h4></td>
					<td><div class="ui input">
							<input type="text" name="userId">
						</div></td>
					<td colspan="3"><button class="ui blue button">중복확인</button></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>비밀번호</h4></td>
					<td><div class="ui input">
							<input type="password" name="userPwd">
						</div></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>비밀번호 확인</h4></td>
					<td><div class="ui input">
							<input type="password" name="userPwdCheck">
						</div></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>이름</h4></td>
					<td><div class="ui input">
							<input type="text" name="userName">
						</div></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>생년월일</h4></td>
					<td colspan="2">
						<div class="ui input">
							<input type="text" name="year" size="3px;">
						</div>-
						<div class="ui input">
							<input type="text" name="month" size="4px;">
						</div>-
						<div class="ui input">
							<input type="text" name="day" size="4px;">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>성별</h4></td>
					<td>
						<div class="ui selection dropdown">
							<input type="hidden" name="panelGender">
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
					<td colspan="2" align="center"><h4>휴대전화</h4></td>
					<td colspan="3">
						<div class="ui selection dropdown">
							<input type="hidden" name="phone1">
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
							<input type="text" name="phone2" style="width:80px;">
						</div>
						<div class="ui input">
							<input type="text" name="phone3" style="width:80px;">
						</div>
						<button class="ui blue button">인증하기</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>주소</h4></td>
					<td colspan="2">
						<div class="ui input">
							<input type="text" name="post" size="7px;">
						</div>
						<div class="ui input">
							<input type="text" name="address" size="22px;">
						</div>
					</td>
					<td><button class="ui blue button">찾기</button></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td colspan="2">
						<div class="ui input">
							<input type="text" name="detailAddress" size="35px;">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>이메일</h4></td>
					<td>
						<div class="ui input">
							<input type="email" name="userEmail">
						</div>
					</td>
					<td colspan="3"><button class="ui blue button">중복확인</button></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>추천인</h4></td>
					<td><div class="ui input">
							<input type="text" name="nominee">
						</div></td>
				</tr>
				<tr>
					<td><br>
					<br></td>
				</tr>
				<tr>
					<td colspan="6"><hr></td>
				</tr>
				<tr>
					<td colspan="6" align="center"><button type="submit" class="ui blue button">회원가입</button></td>
				</tr>
			</table>
		</form>
		<!-- </form> -->
	</div>
	<script>
	$('.ui.dropdown')
	  .dropdown();

	</script>
</body>
</html>










