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
#title{
	color:#00679A; !important;
}
#howto{
	background-color: #2878A5 !important;
	width:900px;
	height: 350px;
}
.white{
	color:white !important;
}
.ui.button {
	background: #00679A !important;
	margin: 0;
}
.yellow{
	background-color: yellow;
	width: 100px;
	height:50px;
	border-radius: 5%;
}
#co{
	font-size: 100px !important;
}

</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">혜택 안내</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="benefitInfo.panel">안내</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">혜택 안내</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			<table align="center">
				<tr>
					<td>
						<h3 id="title">서브웨이 리서치는</h3>
						<p>서로 다른 색을 가진 5명이 설립한 회사로서 패널들에게 리서치를 진행하며 그에 따른 보상
						리워드를 제공하고 리워드에 따른 보상을 얻을 수 있으며, 누구나 쉽게 참여할 수 있는 설문조사나
						서베이를 통해 소소한 용돈벌이를 하실 수 있는 사이트 입니다.</p>
					</td>
					<td>
						<img src="resources/images/footerLogo.png" width="200px" >
					</td>
				</tr>
			</table>
			
			<div id="howto">
				<h2 class="white">Q_패널 가입 방법</h2>
				<p class="white">서브웨이 리서치는 가입과 탈퇴가 자유롭습니다!</p>
				<table align="center">
					<tr>
						<td>
							<div class="yellow">실명(휴대폰)인증</div>
						</td>
						<td>
							<i class="angle right icon"></i>
						</td>
						<td>
							<div class="yellow">정보입력</div>
						</td>
						<td>
							<i class="angle right icon"></i>
						</td>
						<td>
							<div class="yellow">메일 인증</div>
						</td>
						<td>
							<i class="angle right icon"></i>
						</td>
						<td>
							<div class="yellow">가입완료</div>
						</td>
					</tr>
				</table>
				<br/><br/><br/>
				<div align="center">
					<i class="comment alternate outline icon" id="co"></i>
					<i class="comment alternate outline icon" id="co"></i>
				</div>
				<div align="center"><button class="ui teal button" onclick="location.href='panelSignup2.panel'">패널 가입하기</button></div>
				<br><br>
				<table align="center">
					<tr>
						<td>리워드 보상 조사참여</td>
						<td>></td>
						<td>설문에 참여해주셔서 감사합니다 alert 창</td>
						<td>></td>
						<td>현금으로 인출</td>
					</tr>
					<tr>
						<td colspan="2">추천인 제도</td>
						<td colspan="3" align="center">가입 시 추천인을 입력하면 입력자에겐 300p
										추천인에겐 1000p 리워드 지급!</td>
					</tr>
				</table>
			</div>
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>















