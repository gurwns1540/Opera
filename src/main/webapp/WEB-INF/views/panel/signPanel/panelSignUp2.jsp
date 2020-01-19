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
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp"%>
		<!-- <form action=""> -->
			<table align="center" id="joinform">
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
							<input type="password" name="userPwd1">
						</div></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>비밀번호 확인</h4></td>
					<td><div class="ui input">
							<input type="password" name="userPwd2">
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
							<input type="hidden" name="gender"> <i
								class="dropdown icon"></i>
							<div class="default text">선택하세요</div>
							<div class="menu">
								<div class="item" data-value="1">남</div>
								<div class="item" data-value="0">여</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>휴대전화</h4></td>
					<td><button class="ui blue button">인증하기</button></td>
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
							<input type="text" name="" size="35px;">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>이메일</h4></td>
					<td>
						<div class="ui input">
							<input type="email" name="email">
						</div>
					</td>
					<td colspan="3"><button class="ui blue button">중복확인</button></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><h4>추천인</h4></td>
					<td><div class="ui input">
							<input type="text" name="recommend">
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
					<td colspan="6" align="center"><button class="ui blue button"
					onclick="location.href='panelSignUp3.panel'">회원가입</button></td>
				</tr>
			</table>
		<!-- </form> -->
	</div>
	<script>
	$('.ui.dropdown')
	  .dropdown();

	</script>
</body>
</html>










