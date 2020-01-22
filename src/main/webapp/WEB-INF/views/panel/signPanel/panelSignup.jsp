<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
</head>
<style>

#titleTable {
	margin: 0 auto;
	margin-top: 120px;
}
#menuTitle {
	height: 30px;
	width: 40%;
	font-size: 17pt;
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
.hr {
	padding-bottom:10px;
}
.bottomHr {
	padding-top:10px;
}
/* 여기까지 페이지제목 및 경로 영역 */

#contentDiv {
	height:350px;
}

.ui.placeholder {
	background-image:none;
}

.ui.placeholder.segment {
	background:white;
	-webkit-box-shadow:none;
	box-shadow:none;
}

</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
		<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">회원가입</td>
				</tr>
			</table>
			
			<div class="hr">
				<hr>
			</div>
			
			
			
			
			<div class="ui placeholder segment" id="contentDiv" style="border:none;">
				<div class="ui two column stackable center aligned grid">
					<div class="ui vertical divider">Or</div>
					<div class="middle aligned row">
						<div class="column">
							<span style="font-size:16pt;">~~~ 서비스를 이용하고자 하시나요?</span>
							<br>
							<button id="goPanelSignup" onclick="location.href='panelSignup1.panel'">패널 회원가입하기</button>
						</div>
						<div class="column">
							<span style="font-size:16pt;">~~~ 서비스를 이용하고자 하시나요?</span>
							<br>
							<button id="goPanelSignup" onclick="location.href='corpSignup1.corp'">기업 회원가입하기</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="hr bottomHr">
				<hr>
			</div>			


		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
</body>
</html>












