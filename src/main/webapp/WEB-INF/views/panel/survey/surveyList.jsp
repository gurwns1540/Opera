<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	padding-bottom: 40px;
}
/* 여기까지 페이지제목 및 경로 영역 */
.ui.segment {
	border-radius: 0px;
}

.eachSurveyBox {
	height: 210px;
}
.eachSurveyBox:hover {
	cursor:pointer;
}

.ui.segment {
	padding: 3px;
}

.icon {
	hieght: 16px;
	width: 16px;
}

.top-left {
	width: 30px;
}

.top-right {
	width: 70%;
	text-align: right;
	padding-top: 3px;
}

.middle {
	height: 75px;
	padding: 8px;
	padding-top: 15px;
}

.bottom {
	height: 96px;
	width: 99%;
	background-color: #EDEBEB;
	margin: 0 auto;
}

.bottom-top {
	height: 40%;
}

.bottom-middle {
	height: 30%;
	text-align: center;
	padding-top: 5%;
}

.bottom-bottom {
	height: 30%;
	text-align: center;
	padding-bottom: 5%;
}
#pagingArea {
		margin-top: 40px;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
	}
#pagingArea span {
	margin-left: 5px;
	margin-right: 5px;
	font-size: 10pt;
}

#pagingArea span:hover {
	margin-left: 5px;
	margin-right: 5px;
	font-size: 10pt;
	cursor: pointer;
}
.cards:hover {
	transform:translateY(-3px);
}
</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp"%>
		<section class="container">
			<br />

			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">진행중인 설문조사</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="surveyList.panel">서베이</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">진행중인 설문조사</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>









			<div class="ui five column grid" id="surveyListArea" style="width:95%; margin: 0 auto;">
				<c:forEach begin="1" end="10" step="1">
					<div class="column">
						<div class="ui segment cards eachSurveyBox"> <!-- 설문조사 시작 페이지로 넘어갈때 이 div영역에 링크걸면됩니다. -->
							<div class="eachBox">
								<div class="top">
									<table>
										<tr>
											<td class="top-left"><span style="font-size:0.9vw;">[84782]</span></td>
											<td class="top-right">
												<img src="resources/images/pc.png" alt="" class="icon"/>
												<img src="resources/images/mobile.png" alt="" class="icon"/>
											</td>
										</tr>
										<tr>
									</table>
								</div>
								<div class="middle">
									<span style="font-size:1vw;">소비자 인식 조사 소비자 인식</span>
								</div>
								<div class="bottom">
									<div class="bottom-top" style="text-align:center; padding-top:14px;">
										<span style="font-weight:bold; font-size:1vw; color:#005E8C;">100~3000P</span>
									</div>
									<div class="bottom-middle">
										<span style="font-size:0.8vw; margin-right:7px;">시작일 :</span>
										<span style="font-size:0.8vw;">2020.01.01</span>
									</div>
									<div class="bottom-bottom">
										<span style="font-size:0.8vw; margin-right:7px;">종료일 :</span>
										<span style="font-size:0.8vw;">2020.01.20</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div id="pagingArea" align="center">
				<span>[처음]</span> <span>[이전]</span>
				<c:forEach var="i" begin="1" end="10">
					<span><c:out value="${ i }" /></span>
				</c:forEach>
				<span>[다음]</span> <span>[마지막]</span>
			</div>



			<br />
		</section>
		<!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp"%>
	</div>
	<!-- wrap end -->
</body>
</html>









































