<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
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
.point{
	background-color: #00679A !important;
	height: 150px;
	width: 250px;
	margin: 5px;
}
i{
	font-size: 100px;
}



</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">내 리워드 관리</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">내 리워드 관리</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			<div id="myRewardArea" border="solid 1px;">
				<table align="center">
					<tr>
						<td colspan="2"><b>회원님께서 현재까지 모은 포인트 현황입니다.</b></td>
					</tr>
					<tr>
						<td><div class="point"><i class="layer group icon" height="100px;"></i></div></td>
						<td><div class="point"><i class="download icon" height="100px;"></i></div></td>
					</tr>
					<tr>
						<td><div class="point"><i class="copy outline icon" height="100px;"></i></div></td>
						<td><div class="point"><i class="coins icon" height="100px;"></i></div></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>
				</table>
				<br><br>
			</div>
			<div align="center">
				<button class="ui blue button">포인트 상세내역</button>
				<button class="ui blue button">포인트 신청하기</button>
			</div>
			
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>












