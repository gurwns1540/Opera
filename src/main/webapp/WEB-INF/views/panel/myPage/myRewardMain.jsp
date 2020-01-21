<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
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
.pointArea {
	height: 150px;
	width: 65%;	
	margin-bottom: 5%;
	background-color: #00679A;
}
.leftArea {
	float: right;
	margin-right: 5%;
}
.rightArea {
	float: left;
	margin-left: 5%;
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
			
			<div id="myRewardArea" style="width: 100%; height: 100%;">
				<table align="center" style="width: inherit; height: 60%;">
					<tr>
						<td colspan="2"><b style="margin-left: 15%;">회원님의 현재 리워드 현황입니다.</b></td>
					</tr>
					<tr><td><br /></td></tr>
					<tr>
						<td>
							<div class="pointArea leftArea">
							
							</div>  <!-- .pointArea end -->
						</td>
						<td>
							<div class="pointArea rightArea">
							
							</div>  <!-- .pointArea end -->
						</td>
					</tr>
					<tr>
						<td>
							<div class="pointArea leftArea">
							
							</div>  <!-- .pointArea end -->
						</td>
						<td>
							<div class="pointArea rightArea">
							
							</div>  <!-- .pointArea end -->
						</td>
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>
				</table>
				<br><br>
			</div>
			<div align="center">
				<button class="ui blue button" onclick="location.href='myRewardDetail_saved.panel'">리워드 상세내역</button>
				<button class="ui blue button" onclick="location.href='myRewardCashOut.panel'">리워드 신청하기</button>
			</div>
			
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>












