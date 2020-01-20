<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
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
	padding-bottom:5px;
}
/* 여기까지 페이지제목 및 경로 영역 */

div.ui.right.attached.rail {
	
	width: 200px !important;
	min-height:350px;
}

div.ui.segment {
	position: relative;
    background: #fff;
    -webkit-box-shadow: 0 1px 2px 0 rgba(34,36,38,.15);
    box-shadow: 0 1px 2px 0 rgba(34,36,38,.15);
    margin: 1rem 0;
    padding: 1em 1em;
    border-radius: .28571429rem;
    border: 1px solid rgba(34,36,38,.15);
	
	height: inherit;
}

div.ui.segment.leftArea {
	position: relative;
    background: #fff;
    -webkit-box-shadow: 0 0px 0px 0 rgba(34,36,38,.15);
    box-shadow: 0 1px 2px 0 rgba(34,36,38,.15);
    margin: 1rem 0;
    padding: 1em 1em;
    border-radius: .28571429rem;
    border: 1px solid rgba(34,36,38,.15);
	
	height: inherit;
}



</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp"%>
		<section class="container">
			<br />

			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">패널서베이</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="surveyList.panel">서베이</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">패널서베이</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>


			<div class="ui segment leftArea" style="border:1px solid red;">
				<div class="ui right attached rail">
					<div class="ui segment">Right Rail Content</div>
				</div>
				<p></p>
				<p></p>
			</div>


			<br />
		</section>
		<!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp"%>
	</div>
	<!-- wrap end -->
</body>
</html>









































