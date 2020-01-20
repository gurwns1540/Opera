<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>
#titleTable {
	margin: 0 auto;
	margin-top: 20px;
}
#menuTitle {
	height: 30px;
	width: 40%;
	font-size: 16pt;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	color: #3D3D3D;
}
#pagePath {
	width: 60%;
	text-align: right;
	vertical-align: bottom;
	font-weight: bold;
}
#depth1, #depth2, #depth3 {
	color: #494949;
}
#depth1:hover, #depth2:hover {
	color: #008499;
}
.sectionLine {
	padding-bottom:40px;
}
/* 여기까지 페이지제목 및 경로 영역 */

.ui.button {
	background: #00679A !important;
	margin: 0;
}
.ui.selection.dropdown {
	min-width: 80px;
}
.tdLabelArea {
	width: 50%;
	text-align: right;
}
.tdLabelArea h4 {
}
.inputArea {
	padding-left: 5% !important;
}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
		<br />
		<table id="titleTable" height="10px;" width="99%;">
			<tr>
				<td id="menuTitle">내 정보 관리</td>
				<td id="pagePath">
					<div class="ui breadcrumb">
						<a class="section" id="depth1" href="panelMain.panel">Home</a>
						<i class="right angle icon divider"></i>
						<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
						<i class="right angle icon divider"></i>
						<div class="active section" id="depth3">내 정보 관리</div>
					</div>  <!-- .ui .breadcrumb end -->
				</td>
			</tr>
		</table>  <!-- #titleTable end -->
		
		<div class="sectionLine">
			<hr>
		</div>  <!-- .sectionLine end -->
		
		<div class="infoConfirm" style="width: 100%;">
			<form action="panelSignup.me" method="post" style="width: inherit;">
				<table align="center" id="joinform" style="width: inherit;">
					<tr>
						<td colspan="3" class="tdLabelArea">
							<h4>아이디</h4>
						</td>
						<td colspan="3" class="inputArea">
							<div class="ui input">
								<input type="text" name="userId">
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3" class="tdLabelArea">
							<h4>비밀번호</h4>
						</td>
						<td colspan="3" class="inputArea">
							<div class="ui input">
								<input type="password" name="userPwd">
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3" class="tdLabelArea">
							<h4>비밀번호 확인</h4>
						</td>
						<td colspan="3" class="inputArea">
							<div class="ui input">
								<input type="password" name="userPwdCheck">
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3" class="tdLabelArea">
							<h4>이름</h4>
						</td>
						<td colspan="3" class="inputArea">
							<div class="ui input">
								<input type="text" name="userName">
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3" class="tdLabelArea">
							<h4>생년월일</h4>
						</td>
						<td colspan="3" class="inputArea">
							<div class="ui input">
								<input type="text" name="year" size="3px;">
							</div> -
							<div class="ui input">
								<input type="text" name="month" size="4px;">
							</div> -
							<div class="ui input">
								<input type="text" name="day" size="4px;">
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3" class="tdLabelArea">
							<h4>성별</h4>
						</td>
						<td colspan="3" class="inputArea">
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
						<td colspan="3" class="tdLabelArea"><h4>휴대전화</h4></td>
						<td colspan="2" class="inputArea">
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
						<td></td>
					</tr>
					
					<tr>
						<td colspan="3" class="tdLabelArea"><h4>주소</h4></td>
						<td colspan="2" class="inputArea">
							<div class="ui input">
								<input type="text" name="post" size="7px;">
							</div>
							<div class="ui input">
								<input type="text" name="address" size="22px;">
							</div>
							<button class="ui blue button">찾기</button>
						</td>
						<td></td>
					</tr>
					
					<tr>
						<td colspan="3"></td>
						<td colspan="3" class="inputArea">
							<div class="ui input">
								<input type="text" name="detailAddress" size="35px;">
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3" class="tdLabelArea">
							<h4>이메일</h4>
						</td>
						<td colspan="2" class="inputArea">
							<div class="ui input">
								<input type="email" name="userEmail">
							</div>
							<button class="ui blue button">중복확인</button>
						</td>
						<td></td>
					</tr>
					
					<tr>
						<td colspan="3" class="tdLabelArea">
							<h4>추천인</h4>
						</td>
						<td colspan="3" class="inputArea">
							<div class="ui input">
								<input type="text" name="nominee">
							</div>
						</td>
					</tr>
					<tr>
						<td><br>
						<br></td>
					</tr>
					<tr>
						<td colspan="6"><hr></td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<button type="submit" class="ui blue button">정보수정</button>
							<button type="reset" class="ui blue button" onclick="location.href='panelMain.panel'">메인으로</button>
						</td>
					</tr>
				</table>  <!-- #joinForm end -->
			</form>
		</div>
		
		<br />
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
	<script>
	$('.ui.dropdown')
	  .dropdown();
	</script>
</body>
</html>












