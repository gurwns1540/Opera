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
			<table align="center" style="width: inherit;">
				<tr align="center">
					<td colspan="2"><b>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.</b></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><b>항상 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</b></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td align="center">
						비밀번호 : 
						<div class="ui input" >
							<input type="password" name="userPwd" style="margin-left: 10px;">
						</div>
					</td>
				</tr>
				<tr>
					<td><br><br></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="ui blue button" onclick="location.href='myInfoDetail.panel'">다음단계</button>
						<button class="ui blue button" onclick="location.href='panelMain.panel'">메인으로</button>
					</td>
				</tr>
			</table>
		</div>  <!-- #passwordconfirm end -->
		
		
		<br />
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
</body>
</html>












