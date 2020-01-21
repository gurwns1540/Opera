<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>
.sectionLine {
	padding-bottom: 40px;
}
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
.ui.segment.cards.eachSurveyBox {
	background-color:white;
}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
			
			<!-- <div class="ui piled segment" style="padding:0px !important; margin-top:40px;"> -->
			<img src="resources/images/panelMain.png" style="width:100%; margin-top:40px; margin-bottom:20px;">
			<!-- </div> -->
			
			
			<table style="width:100%; margin-top:30px; background-color:#E2F4F7; padding:10px;">
				<tr>
					<td style="width:16%; padding-left:15px;">
						<a href="surveyList.panel"><img src="resources/images/panelMainSurvey.gif" style="height:100%;"></a>
					</td>
					<td style="width:84%;">
						<a href="surveyList.panel" class="ui pink right ribbon label"><span style="font-size:0.7vw;">more</span></a>
						<div class="ui four column grid" id="surveyListArea" style="width:95%; margin: 0 auto;">
							<c:forEach begin="1" end="4" step="1">
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
					</td>
				</tr>
			</table>
			
			<table style="margin-top:50px; margin-bottom:50px; background-color:#F0F0F0; height:200px; width:100%;">
				<tr>
					<td rowspan="2" style="width:40%; padding-left:15px; padding-top:15px; vertical-align:top;">
						<table style="width:100%; margin-top:5px; margin-bottom:11px;">
							<tr>
								<td style="width:22%;"><span style="font-size:0.9vw; font-weight:bold;">공지사항</span></td>
								<td><hr></td>
								<td style="width:20%; text-align:right;">
									<a href="notice.panel">
									<i class="plus circle icon" style="color:#CC3399;"></i>
										<span style="font-size:0.8vw; color:grey; font-weight:bold;">more</span>
									</a>
								</td>
							</tr>
						</table>
						<!-- <h4 class="ui horizontal left aligned divider header" style="margin-bottom:7px;">
							<a href="notice.panel">공지사항</a>
						</h4> -->
						<div style="height:80%;">
							<table style="width:100%; table-layout:fixed;">
								<c:forEach begin="1" end="5" step="1">
									<tr>
										<td style="width:70%;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;border:2px solid #F0F0F0;">
											<i class="bell icon" style="color:#008499;"></i><span style="font-size:0.8vw;">안녕하세요. 설문조사 리워드에 관한 새로운 방침에 대해 공지합니다.</span>
										</td>
										<td style="width:30%; text-align:right;">
											<span style="font-size:0.8vw;">2020-01-22</span>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</td>
					<td style="width:30%; height:100px; text-align:center; padding-top:20px; padding-bottom:10px;">
						<a href="faq.panel"><img src="resources/images/faq.png" style="margin-left:7%; height:100%; border:grey;"></a>
					</td>
					<td rowspan="2" style="width:35%; vertical-align:middle; text-align:right;">
						<img src="resources/images/callNumber.png" style="vertical-align:middle; height:150px;">
					</td>
				</tr>
				<tr>
					<td style="height:100px; text-align:center; padding-top:10px; padding-bottom:20px;">
						<a href="panelInquiryList.panel"><img src="resources/images/inquiry.png" style="margin-left:7%; height:100%; border:grey;"></a>
					</td>
				</tr>
			</table>
			
			
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
</body>
</html>






































