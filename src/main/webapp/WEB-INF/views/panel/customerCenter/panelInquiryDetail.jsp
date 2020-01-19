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
#depth1, #depth2, #depth3, #depth4 {
	color: #494949;
}
#depth1:hover, #depth2:hover, #depth3:hover {
	color: #008499;
}
.sectionLine {
	padding-bottom:40px;
}
/* 여기까지 페이지제목 및 경로 영역 */





</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">상세보기</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="notice.panel">고객센터</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth3" href="panelOneOnOneList.panel">패널 1:1 문의</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth4">상세보기</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>












