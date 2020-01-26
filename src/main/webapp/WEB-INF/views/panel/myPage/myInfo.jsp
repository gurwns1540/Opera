<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>
	.ui.blue.button {
		background-color:#00679A;
	}
	.ui.blue.button:hover {
		background-color: #217BA7;
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
		
		<div id="passwordconfirm" style="width: 100%;">
			<form action="checkPassword.me" method="post">
				<div style="text-align:center; margin-bottom:40px;">
					<span style="font-size:1vw; font-weight:bold; line-height:150%;">
						회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.<br>
						항상 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.
					</span>
				</div>
				<div style="text-align:center; margin-bottom:40px;">
					<span style="font-size:0.9vw;">비밀번호 : </span>
					<div class="ui input">
						<input type="password" name="userPwd" id="userPwd" style="margin-left: 10px;">
					</div>
				</div>
				<hr>
				<div style="text-align:right; margin-top:40px;">
					<button class="ui blue button" type="submit">다음단계</button>
					<button class="ui blue button" type="button" onclick="location.href='panelMain.panel'">메인으로</button>
				</div>
			</form>
		</div>  <!-- #passwordconfirm end -->
		<br />
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
</body>
</html>












