<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
</head>
<style>
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
	.top, .middle, .bottom {
	    width:100%;
	}
	.top-left {
		width: 30%;
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
			margin-top: 50px;
			
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
	.insetBox {
		width: 100px;
		background: white;
		box-shadow: 0px 4px 4px #E2E2E2 inset;
	}
	.ui.blue.button {
	background-color:#00679A !important;
	}
	.ui.blue.button:hover {
		background-color: #217BA7 !important;
	}
	@media screen and (max-width: 1000px) { 
		.modalContainer {
			width: 95% !important;
		}
	}
	.iconDiv {
		color:#00679A; 
		height: 100%;
		position: absolute;
		top: 0;
	}
	#choiceTable {
		width:100%;
	}
	#choiceTable th {
		position: relative;
		width: fit-content;
	}
	#choiceTable td {
		position: relative;
		left: 20px;
		width: fit-content;
	}
	.choiceNameArea {
		font-size:0.9vw;
	}
</style>
<body>
	<c:if test="${ loginUser != null }">
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
								<a class="section" id="depth2" href="surveyList.survey">서베이</a>
								<i class="right angle icon divider"></i>
								<div class="active section" id="depth3">진행중인 설문조사</div>
							</div>
						</td>
					</tr>
				</table>
				
				<div class="sectionLine" style="padding-bottom:20px;">
					<hr>
					<c:if test="${ msg == 'noMessage' }">
						<div style="width:100%; text-align:right; margin-top:20px; padding-right:20px;">
							<img src="resources/images/pc.png" alt="" class="icon" style="width:12px; height:12px;"/><span style="font-size:13px; margin-right:5px;"> PC참여가능 </span>
							<img src="resources/images/mobile.png" alt="" class="icon" style="width:12px; height:12px;"/><span style="font-size:13px;"> 모바일참여가능</span>
						</div>
					</c:if>
				</div>
				
				
				<c:if test="${ msg == 'noMessage' }">
					<div class="ui five column grid" id="surveyListArea" style="width:95%; margin: 0 auto;">
						<c:forEach var="list" items="${ researchList }" varStatus="status">
							<div class="column">
								<div class="ui segment cards eachSurveyBox clickSurvey"> <!-- 설문조사 시작 페이지로 넘어갈때 이 div영역에 링크걸면됩니다. -->
									<div class="eachBox" style="width: 100%;">
										<div class="top">
											<table style="width: 100%;">
												<tr>
													<td class="top-left">
														<span style="font-size:0.9vw;">[</span>
														<span style="font-size:0.9vw;">${ list.researchNo }</span>
														<input type="text" value="${ sessionScope.loginUser.userName }" style="display:none;">
														<input type="text" value="${ sessionScope.loginUser.panellevelNo }" style="display:none;">
														<span style="font-size:0.9vw;">]</span>
													</td>
													<td class="top-right">
														<img src="resources/images/pc.png" alt="" class="icon"/>
														<c:if test="${ list.rquestionVideolink == null }">
															<img src="resources/images/mobile.png" alt="" class="icon"/>
														</c:if>
													</td>
												</tr>
												<tr>
											</table>
										</div>
										<div class="middle">
											<span style="font-size:1vw;">${ list.researchName }</span>
										</div>
										<div class="bottom">
											<div class="bottom-top" style="text-align:center; padding-top:14px;">
												<span style="font-weight:bold; font-size:1vw; color:#005E8C;">${ list.researchReward }P</span>
											</div>
											<div class="bottom-middle">
												<span style="font-size:0.8vw; margin-right:7px;">시작일 :</span>
												<fmt:parseDate value="${ fn:split(list.researchPeriod, '~')[0] }" var="startDate" pattern="yyyyMMdd"/>
												<span style="font-size:0.8vw;">
													<fmt:formatDate value="${ startDate }" pattern="yyyy.MM.dd"/>
												</span>
											</div>
											<div class="bottom-bottom">
												<span style="font-size:0.8vw; margin-right:7px;">종료일 :</span>
												<fmt:parseDate value="${ fn:split(list.researchPeriod, '~')[1] }" var="endDate" pattern="yyyyMMdd"/>
												<span style="font-size:0.8vw;">
													<fmt:formatDate value="${ endDate }" pattern="yyyy.MM.dd"/>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				
				<c:if test="${ msg != 'noMessage' }">
					<div style="height:auto; width:100%; padding-top:80px; padding-bottom:80px; margin-bottom:45px; text-align:center;">
						<span style="font-size:1vw; line-height:300%; color:#595959;">${ msg }</span>
					</div>
					<hr>
					<button class="ui blue button" style="float:right; margin-top:20px;" onclick="location.href='panelMain.panel'">메인으로</button>
				</c:if>
				
				<c:if test="${ pi.maxPage != 0 } or ${ pi.maxPage != 1 }">
					<div id="pagingArea" align="center">
					
						<c:url var="surveyListFirst" value="surveyList.survey">
							<c:param name="currentPage" value="${ 1 }"/>
						</c:url>
						<a href="${ surveyListFirst }"><span>[처음]</span></a>&nbsp;
						
						<c:if test="${ pi.currentPage <= 1 }">
							<span>[이전]</span> &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="surveyListBack" value="surveyList.survey">
								<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a href="${ surveyListBack }"><span>[이전]</span></a>&nbsp;
						</c:if>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<c:url var="surveyListEachPage" value="surveyList.survey">
									<c:param name="currentPage" value="${ p }"/>
								</c:url>
								<a href="${ surveyListEachPage }"><span>${ p }</span></a>
							</c:if>
						</c:forEach>
				
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="surveyListNext" value="surveyList.survey">
								<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
							</c:url>
							&nbsp;<a href="${ surveyListNext }"><span>[다음]</span></a>
						</c:if>
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&nbsp; <span>[다음]</span>
						</c:if>
						
						<c:url var="surveyListEnd" value="surveyList.survey">
							<c:param name="currentPage" value="${ pi.maxPage }"/>
						</c:url>
						<a href="${ surveyListEnd }"><span>[마지막]</span></a>&nbsp;
						
					</div>
				</c:if>
				
				<div id="modalAppendArea">
				<!-- 조사 시작해서 처음뜨는 모달창 - 조사참여가이드 -->
				<div class="ui overlay fullscreen modal" id="surveyStart">
					<div class="header" style="height:61px; padding-left:8px;">
						<img src="resources/images/footerLogo.png" alt="" id="footerImg">
					</div>
					<div class="content insetBox">
						<div class="modalContainer ui raised segment" style="width:50%; min-height:600px; margin:0 auto; margin-top:30px; position:absolute; top:46%; left:50%; transform: translate(-50%, -50%);">
							<div class="ui header" style="text-align:center; margin-top:70px; margin-bottom:70px;">
								<c:if test="${ sessionScope.loginUser.panellevelNo eq 1 }">
									<span style="font-size:35px; color:#00679A;">TS 조사 참여 가이드</span>
								</c:if>
								<c:if test="${ sessionScope.loginUser.panellevelNo ne 1 }">
									<span style="font-size:35px; color:#00679A;">조사 참여 가이드</span>
								</c:if>
							</div>
							<table style="margin:0 auto; width: 72%;">
								<tr>
									<td style="width:45%;">
										<img src="resources/images/noGoBack.png" style="width:100%;">
									</td>
									<td style="width:10%"></td>
									<td style="width:45%; text-align:right;">
										<img src="resources/images/retryNotAllowed.png" style="width:100%;">
									</td>
								</tr>
							</table>
							<div class="actions" style="text-align:center; margin-top:40px;">
								<button class="ui blue button" id="goSurveyBtn" style="border-radius:2px; font-size:1.2vw;">조사  참여하기 <i class="right chevron icon"></i></button>
							</div>
							<div style="margin-top:60px; height:140px; background-color:#EAEAEA;">
								<table style="width:100%; height:100%;">
									<tr>
										<td colspan="2" style="width:100%; height:10%;"></td>
									</tr>
									<tr>
										<td style="width:50%; height:78%; border-right:2px solid white; padding:0px;">
											<div style="width:100%; height:25%;">
												<span style="font-size:18px; padding-left:15px;"><b>불량응답 안내</b></span>
											</div>
											<div style="width:100%; height:75%; padding-left:15px; padding-right:10px; margin-top:5px; margin-bottom:7px;">
												<span style="font-size:0.8vw;">
													당사는 조사 종료 후 검증 시스템을 통해 응답신뢰성을 관리하고 있습니다. 검증작업 결과 패널님의 응답이 불성실하다고 확인될 경우 불량응답 처리하며,불량응답 3회 이상 누적 시 직권탈퇴 및 적립금이 소멸될 수 있으니 이 점 유의해 주시기 바랍니다.
												</span>
											</div>
										</td>
										<td style="width:50%; height:78%; padding:0px;">
											<div style="width:100%; height:35%;">
												<span style="font-size:18px; padding-left:15px; padding-top:10px;"><b>지적재산권 보호</b></span>
											</div>
											<div style="width:100%; height:65%; padding-left:15px; padding-right:10px; margin-bottom:7px;">
												<span style="font-size:0.8vw;">
													조사를 통해 습득한 모든 정보에 대한 지적재산권은 당사와 조사 의뢰 회사에 있으며, 조사내용을 제 3자에게 발설하거나 관련 자료 및 조사 화면을 유포한 경우 법적 불이익을 받을 수 있습니다.
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="width:100%; height:12%;"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="actions">
						<div class="ui primary approve button" style="background-color:#6A6A6A;">
							돌아가기 
						</div>
					</div>
				</div>
				
				
					<!-- 객관식 다중선택 디자인 -->
					<c:if test="${ q.questionFormNo eq 6 }">
						<div class="ui overlay fullscreen modal" id="Q${ q.researchOrder }">
							<div class="header" style="height:61px; padding:5px;">
								<table style="width:100%; height:100%;">
									<tr>
										<td style="width:30%; height:inherit;">
											<img src="resources/images/footerLogo.png" alt="" id="footerImg">
										</td>
										<td style="width:70%; height:inherit; padding-right:20px;">
											<div class="label" style="margin-top:10px; width:60%; float:left; font-size:15px; text-align:right; padding-right:10px;">
												${ q.researchOrder -1 } of ${ qCount } done
											</div>
											<div class="ui indicating progress active" data-value="${ q.researchOrder }" data-total="${ qCount }" id="progress${ q.researchOrder }" data-percent="${ q.progressDataPercent }%" style="margin-top:10px; width:40%; float:right;">
												<input type="text" value="${ q.progressDataPercent }" style="display:none;">
												<div class="bar" style="transition-duration: 200ms; display: block;">
													<div class="progress">${ q.progressDataPercent }%</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="content insetBox">
								<div class="modalContainer ui raised segment" style="width:50%; height:auto; min-height:600px; margin:0 auto; margin-top:30px; position:absolute; top:46%; left:50%; transform: translate(-50%, -50%);">
									<div class="ui segment" style="min-height:50px; width:90%; margin:0 auto; margin-top:42px; padding:25px; background-color:#EFF8FA;">
										<!-- '<div class="questionArea" style="width:100%;">
											<table id="choiceTable" style="font-size: 0.9vw; line-height: 200%; width:inherit;">
												<tr>
													<th style="width: 3%;">
														<div class="iconDiv">
															<span style="font-size:1vw;"><b>Q' + researchOrder + '.</b></span>
														</div>
													</th>
													<td style="width:97%; padding-right:20px;">
														<span style="font-size:1vw;">
															' + rquestionContext + '
														</span>
													</td>
												</tr>
											</table>
										</div>' -->
									</div>
									<div class="choiceArea" style="min-height:320px; width:90%; margin:0 auto; margin-top:30px;">
										<!-- '<div class="ui two column grid" id="surveyListArea" style="width: inherit; margin: 0 auto; margin-top:10px;">
											<div class="column" style="margin-top:10px; margin-bottom:10px; padding:0px; padding-right:5px; padding-left:5px;">
												<div class="eachSurveyBox" style="height:auto;">
													<div class="eachBox" style="min-height:20px;">
														<div class="choiceNameArea" style="padding-top:5px;">
															<div class="ui checked checkbox" style="margin-bottom: 5px;">
																<input type="checkBox" name="' + researchOrder + '" class="choiceBox" id="' + researchOrder + 'choice' + rchoiceOrder + '" value="' + rchoiceOrder + '">
																<label for="' + researchOrder + 'choice' + rchoiceOrder + '" style="cursor: pointer;"> ' + rchoiceContext + '</label>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>' -->
									</div>
									<div class="actions" style="text-align:center; margin-top:40px; margin-bottom:30px;">
										<button class="ui blue button" id="nextBtn${ q.researchOrder }" style="border-radius:2px; font-size:18px;">다 음 <i class="right chevron icon"></i></button>
									</div>
								</div>
							</div>
							<div class="actions">
								<div class="ui primary approve button" style="background-color:#6A6A6A;">
									돌아가기 
								</div>
							</div>
						</div>
					</c:if>
				
					<!-- 주관식 단답형 디자인 -->
					<c:if test="${ q.questionFormNo eq 2 }">
						<div class="ui overlay fullscreen modal" id="Q${ q.researchOrder }">
							<div class="header" style="height:61px; padding:5px;">
								<table style="width:100%; height:100%;">
									<tr>
										<td style="width:30%; height:inherit;">
											<img src="resources/images/footerLogo.png" alt="" id="footerImg">
										</td>
										<td style="width:70%; height:inherit; padding-right:20px;">
											<div class="label" style="margin-top:10px; width:60%; float:left; font-size:15px; text-align:right; padding-right:10px;">
												${ q.researchOrder -1 } of ${ qCount } done
											</div>
											<div class="ui indicating progress active" data-value="${ q.researchOrder }" data-total="${ qCount }" id="progress${ q.researchOrder }" data-percent="${ q.progressDataPercent }%" style="margin-top:10px; width:40%; float:right;">
												<input type="text" value="${ q.progressDataPercent }" style="display:none;">
												<div class="bar" style="transition-duration: 200ms; display: block;">
													<div class="progress">${ q.progressDataPercent }%</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="content insetBox">
								<div class="modalContainer ui raised segment" style="width:50%; height:auto; min-height:600px; margin:0 auto; margin-top:30px; position:absolute; top:45%; left:50%; transform: translate(-50%, -50%);">
									<div class="ui segment" style="min-height:50px; width:90%; margin:0 auto; margin-top:42px; padding:25px; background-color:#EFF8FA;">
										<div class="questionArea" style="width:100%;">
											<table id="choiceTable" style="font-size: 0.9vw; line-height: 200%; width:inherit;">
												<tr>
													<th style="width: 3%;">
														<div class="iconDiv">
															<span style="font-size:1vw;"><b>Q${ q.researchOrder }.</b></span>
														</div>
													</th>
													<td style="width:97%; padding-right:20px;">
														<span style="font-size:1vw;">
															${ q.rquestionContext }
														</span>
													</td>
												</tr>
											</table>
										</div>
									</div>
									<div class="choiceArea" style="min-height:320px; width:90%; margin:0 auto; margin-top:30px; text-align:center;">
										<div class="ui input" style="width:30%; margin-top:100px;"><input type="text" name="${ q.researchOrder }"></div>
									</div>
									<div class="actions" style="text-align:center; margin-top:40px; margin-bottom:30px;">
										<button class="ui blue button" id="nextBtn${ q.researchOrder }" style="border-radius:2px; font-size:18px;">다 음 <i class="right chevron icon"></i></button>
									</div>
								</div>
							</div>
							<div class="actions">
								<div class="ui primary approve button" style="background-color:#6A6A6A;">
									돌아가기 
								</div>
							</div>
						</div>
					</c:if>
				
					<!-- 주관식 서술형 디자인 -->
					<c:if test="${ q.questionFormNo eq 7 }">
						<div class="ui overlay fullscreen modal" id="Q${ q.researchOrder }">
							<div class="header" style="height:61px; padding:5px;">
								<table style="width:100%; height:100%;">
									<tr>
										<td style="width:30%; height:inherit;">
											<img src="resources/images/footerLogo.png" alt="" id="footerImg">
										</td>
										<td style="width:70%; height:inherit; padding-right:20px;">
											<div class="label" style="margin-top:10px; width:60%; float:left; font-size:15px; text-align:right; padding-right:10px;">
												${ q.researchOrder -1 } of ${ qCount } done
											</div>
											<div class="ui indicating progress active" data-value="${ q.researchOrder }" data-total="${ qCount }" id="progress${ q.researchOrder }" data-percent="${ q.progressDataPercent }%" style="margin-top:10px; width:40%; float:right;">
												<input type="text" value="${ q.progressDataPercent }" style="display:none;">
												<div class="bar" style="transition-duration: 200ms; display: block;">
													<div class="progress">${ q.progressDataPercent }%</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="content insetBox">
								<div class="modalContainer ui raised segment" style="width:50%; height:auto; min-height:600px; margin:0 auto; margin-top:30px; position:absolute; top:45%; left:50%; transform: translate(-50%, -50%);">
									<div class="ui segment" style="min-height:50px; width:90%; margin:0 auto; margin-top:42px; padding:25px; background-color:#EFF8FA;">
										<div class="questionArea" style="width:100%;">
											<table id="choiceTable" style="font-size: 0.9vw; line-height: 200%; width:inherit;">
												<tr>
													<th style="width: 3%;">
														<div class="iconDiv">
															<span style="font-size:1vw;"><b>Q${ q.researchOrder }.</b></span>
														</div>
													</th>
													<td style="width:97%; padding-right:20px;">
														<span style="font-size:1vw;">
															${ q.rquestionContext }
														</span>
													</td>
												</tr>
											</table>
										</div>
									</div>
									<div class="choiceArea" style="min-height:320px; width:90%; margin:0 auto; margin-top:30px; text-align:center;">
										<div class="ui form" style="width:100%; margin-top:0px; text-align:center;"><textarea style="margin:0 auto; margin-top:20px; resize:none;" placeholder="300자 이내" name="${ q.rquestionOrder }"></textarea></div>
									</div>
									<div class="actions" style="text-align:center; margin-top:40px; margin-bottom:30px;">
										<button class="ui blue button" id="nextBtn${ q.researchOrder }" style="border-radius:2px; font-size:18px;">다 음 <i class="right chevron icon"></i></button>
									</div>
								</div>
							</div>
							<div class="actions">
								<div class="ui primary approve button" style="background-color:#6A6A6A;">
									돌아가기 
								</div>
							</div>
						</div>
					</c:if>
					
					<!-- 객관식 사진포함 디자인 -->
					<c:if test="${ q.questionFormNo eq 1 }">
						<div class="ui overlay fullscreen modal" <%-- id="Q${ q.researchOrder }" --%> id="practice">
							<div class="header" style="height:61px; padding:5px;">
								<table style="width:100%; height:100%;">
									<tr>
										<td style="width:30%; height:inherit;">
											<img src="resources/images/footerLogo.png" alt="" id="footerImg">
										</td>
										<td style="width:70%; height:inherit; padding-right:20px;">
											<div class="label" style="margin-top:10px; width:60%; float:left; font-size:15px; text-align:right; padding-right:10px;">
												${ q.researchOrder -1 } of ${ qCount } done
											</div>
											<div class="ui indicating progress active" data-value="${ q.researchOrder }" data-total="${ qCount }" id="progress${ q.researchOrder }" data-percent="${ q.progressDataPercent }%" style="margin-top:10px; width:40%; float:right;">
												<input type="text" value="${ q.progressDataPercent }" style="display:none;">
												<div class="bar" style="transition-duration: 200ms; display: block;">
													<div class="progress">${ q.progressDataPercent }%</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="content insetBox">
								<div class="modalContainer ui raised segment" style="width:50%; height:auto; min-height:600px; margin:0 auto; margin-top:30px; position:absolute; top:46%; left:50%; transform: translate(-50%, -50%);">
									<div class="ui segment" style="min-height:50px; width:90%; margin:0 auto; margin-top:42px; padding:25px; background-color:#EFF8FA;">
										<div class="questionArea" style="width:100%;">
											<table id="choiceTable" style="font-size: 0.9vw; line-height: 200%; width:inherit;">
												<tr>
													<th style="width: 3%;">
														<div class="iconDiv">
															<span style="font-size:1vw;"><b>Q${ q.researchOrder }.</b></span>
														</div>
													</th>
													<td style="width:97%; padding-right:20px;">
														<span style="font-size:1vw;">
															${ q.rquestionContext }
														</span>
													</td>
												</tr>
											</table>
										</div>
									
									</div>
									<div class="choiceArea" style="height:320px; overflow-y:auto; width:90%; margin:0 auto; margin-top:30px;">
										<div class="ui two column grid" id="surveyListArea" style="width: inherit; margin: 0 auto; margin-top:10px;">
											<c:forEach var="c" items="${ q.choiceList }">
												<div class="column" style="margin-top:10px; margin-bottom:10px; padding:0px; padding-right:5px; padding-left:5px;">
													<div class="ui segment eachSurveyBox">
														<div class="eachSurveyBox" style="height:auto;">
															<div class="imgArea" style="height:80%; width:100%; margin:0 auto;">
																<img src="resources/images/img${ no }.png" style="height:100%; width:100%;">
																<div style="height:100%; width:100%; background-color:gray;"></div>
															</div>
															<div class="choiceNameArea" style="padding-top:10px;">
																<div class="ui checked checkbox" style="margin-bottom: 9px;">
																	<input type="checkBox" name="${ q.researchOrder }" class="choiceBox" id="${ q.researchOrder }choice${ c.rchoiceOrder }" value="${ c.rchoiceOrder }">
																	<label for="${ q.researchOrder }choice${ c.rchoiceOrder }" style="cursor: pointer;">  ${ c.rchoiceContext }</label>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="actions" style="text-align:center; margin-top:40px; margin-bottom:30px;">
										<button class="ui blue button" id="nextBtn${ q.researchOrder }" style="border-radius:2px; font-size:18px;">다 음 <i class="right chevron icon"></i></button>
									</div>
								</div>
							</div>
							<div class="actions">
								<div class="ui primary approve button" style="background-color:#6A6A6A;">
									돌아가기 
								</div>
							</div>
						</div>
					</c:if>
				<%-- </c:forEach> --%>
				
				
				
				</div>
				
				<br />
			</section>
			<!-- container end -->
			<%@ include file="/WEB-INF/views/panel/common/footer.jsp"%>
			
			<script>
				
				//설문조사가이드 모달창에서 조사시작버튼누르면 설문조사설명모달창으로 넘기기 
				$('#goSurveyBtn').on('click', function(){
					$('#Q0').modal('setting', 'closable', false).modal('show');
					$('#surveyStart').modal('hide');
				});
				
				
				//일반설문조사 목록 클릭 시 ajax로 값 받아와서 설문조사 모달창 시작
				$(".clickSurvey").on("click", function(){
					var researchNo = $(this).find(".top-left").children().eq(1).text();
					var userName = $(this).find(".top-left").children().eq(2).val();
					var panellevelNo = $(this).find(".top-left").children().eq(3).val();
					var reward = $(this).find(".bottom-top").children().eq(0).text();
					
					$.ajax({
						url:"selectResearchQuestions.survey",
						type:"post",
						data:{
								researchNo:researchNo,
								reward:reward,
								userName:userName,
								panellevelNo:panellevelNo
							 },
						success:function(data){
							
							var researchNo = data.researchInfo.researchNo;
							var researchName = data.researchInfo.researchName;
							var researchReward = data.researchInfo.researchReward;
							var rquestionList = data.researchQuestionList;
							var reward = data.researchReward;
							var qCount = data.questionCount;
							var time = data.time;
							var minTime = data.minTime;
							var maxTime = data.maxTime;
							var userName = data.userName;
							var panellevelNo = data.panellevelNo;
							
							var $tsQ0 = $('<div class="ui overlay fullscreen modal" id="Q0"> <div class="header" style="height:61px; padding:5px;"> <table style="width:100%;"> <tr> <td style="width:30%; height:inherit;transform:translateY(-4px);"> <img src="resources/images/footerLogo.png" alt="" id="footerImg"> </td> <td style="width:70%; height:inherit; padding-right:20px;"> <div class="label" style="margin-top:10px; width:60%; float:left; font-size:15px; text-align:right; padding-right:10px;"> 0 of ' + qCount + ' done </div> <div class="ui indicating progress active" data-value="0" data-total="' + qCount + '" id="progress0" data-percent="0%" style="margin-top:10px; width:40%; float:right;"> <input type="text" value="0" style="display:none;"> <div class="bar" style="transition-duration: 200ms; display: block; width:0%;"> <div class="progress">0%</div> </div> </div> </td> </tr> </table> </div> <div class="content insetBox"> <div class="modalContainer ui raised segment" style="width:50%; min-height:600px; margin:0 auto; margin-top:30px; position:absolute; top:46%; left:50%; transform: translate(-50%, -50%);"> <div class="ui segment" style="height:330px; width:80%; margin:0 auto; margin-top:100px; padding:25px; background-color:#EFEFEF;"> <span style="line-height:180%; font-size:1.1vw;"> <b>' + userName + '</b>님, 안녕하세요.<br>서브웨이 패널회원으로 가입해주셔서 감사합니다.<br><br>지금부터 몇 가지 기본 정보를 여쭙고자 합니다.<br><br><u>본 조사에 참여하셔야 앞으로 ' + userName + '님께 맞는 조사를 제공</u>해드릴 수 있으니,<br>성실한 답변을 부탁드립니다. </span> </div> <div class="actions" style="text-align:center; margin-top:70px;"> <button class="ui blue button" id="nextBtn0" style="border-radius:2px; font-size:18px;">다 음 <i class="right chevron icon"></i></button> </div> </div> </div> <div class="actions"> <div class="ui primary approve button" style="background-color:#6A6A6A;"> 돌아가기 </div> </div> </div>');
							var $otherQ0 = $('<div class="ui overlay fullscreen modal" id="Q0"> <div class="header" style="height:61px; padding:5px;"> <table style="width:100%;"> <tr> <td style="width:30%; height:inherit;transform:translateY(-4px);"> <img src="resources/images/footerLogo.png" alt="" id="footerImg"> </td> <td style="width:70%; height:inherit; padding-right:20px;"> <div class="label" style="margin-top:10px; width:60%; float:left; font-size:15px; text-align:right; padding-right:10px;"> 0 of ' + qCount + ' done </div> <div class="ui indicating progress active" data-value="0" data-total="' + qCount + '" id="progress0" data-percent="0%" style="margin-top:10px; width:40%; float:right;"> <input type="text" value="0" style="display:none;"> <div class="bar" style="transition-duration: 200ms; display: block; width:0%;"> <div class="progress">0%</div> </div> </div> </td> </tr> </table> </div> <div class="content insetBox"> <div class="modalContainer ui raised segment" style="width:50%; min-height:600px; margin:0 auto; margin-top:30px; position:absolute; top:46%; left:50%; transform: translate(-50%, -50%);"> <div class="ui segment" style="height:330px; width:80%; margin:0 auto; margin-top:100px; padding:25px; background-color:#EFEFEF;"> <span style="line-height:180%; font-size:1.1vw;"> <b>' + userName + '</b>님, 안녕하세요.<br><br>본 조사의 예상 소요시간은 ' + time + '분이며, 조사 목적 또는 패널님의 응답 퀄리티에 따라 ' + researchReward + 'P의 리워드를 받으실 수 있습니다.<br><br>설문 답변 소요시간이 ' + minTime + '분 미만인 경우 또는 ' + maxTime + '분을 초과하는 경우,<br>답변에 상관 없이 최저 리워드를 드리니 시간을 엄수하여 주시기 바랍니다. </span> </div> <div class="actions" style="text-align:center; margin-top:70px;"> <button class="ui blue button" id="nextBtn0" style="border-radius:2px; font-size:18px;">다 음 <i class="right chevron icon"></i></button> </div> </div> </div> <div class="actions"> <div class="ui primary approve button" style="background-color:#6A6A6A;"> 돌아가기 </div> </div> </div>');
							var $lastModal = $('<div class="ui overlay fullscreen modal" id="Q' + (qCount +1) + '"> <div class="header" style="height:61px; padding:5px;"> <table style="width:100%;"> <tr> <td style="width:30%; height:inherit;transform:translateY(-4px);"> <img src="resources/images/footerLogo.png" alt="" id="footerImg"> </td> <td style="width:70%; height:inherit; padding-right:20px;"> <div class="label" style="margin-top:10px; width:60%; float:left; font-size:15px; text-align:right; padding-right:10px;"> ' + qCount + ' of ' + qCount + ' done </div> <div class="ui indicating progress active" data-value="' + qCount + '" data-total="' + qCount + '" id="progress' + (qCount+1) + '" data-percent="100%" style="margin-top:10px; width:40%; float:right;"> <input type="text" value="100" style="display:none;"> <div class="bar" style="transition-duration: 200ms; display: block; width:100%;"> <div class="progress">100%</div> </div> </div> </td> </tr> </table> </div> <div class="content insetBox"> <div class="modalContainer ui raised segment" style="width:50%; min-height:580px; margin:0 auto; margin-top:30px; position:absolute; top:46%; left:50%; transform: translate(-50%, -50%);"> <div class="ui header" style="text-align:center; margin-top:60px; margin-bottom:40px;"> <span style="font-size:28px;"><i class="check square outline icon"></i>조사가 완료되었습니다.</span> </div> <div class="ui segment" style="height:40px; width:80%; margin:0 auto; margin-top:20px; padding:7px; background-color:white; text-align:center;"> <span style="line-height:180%; font-size:0.8vw; width:100%; color:#00679A;"> <i class="exclamation circle icon" style="color:#00679A;"></i><b>본 페이지에서 뒤로가기나 새로고침을 하면 적립금이 정상적으로 처리되지 않습니다.</b> </span> </div> <div class="ui segment" style="height:90px; width:80%; margin:0 auto; margin-top:30px; margin-bottom:20px; padding:13px; background-color:#EFEFEF; text-align:center; padding-top:15px; padding-bottom:15px;"> <span style="line-height:150%; font-size:1vw; width:100%;"> <table style="width:100%;"> <tr> <td style="width:10%;">조사명</td><td style="width:5%;"> : </td><td style="width:85%; text-align:left; padding-left:6px;">[' + researchNo + '] ' + researchName + '</td> </tr> <tr> <td style="width:10%;">적립금</td><td style="width:5%;"> : </td><td style="width:85%; text-align:left; padding-left:6px;">' + researchReward + 'P</td> </tr> </table> </span> </div> <div style="width:80%; margin:0 auto;"> <img src="resources/images/surveyEndPic.PNG" style="width:100%;"> </div> <div class="actions" style="text-align:center; margin-top:25px;"> <button class="ui blue button" id="nextBtn' + (qCount+1) +'" style="border-radius:2px; font-size:18px;">내 리워드 확인하기 <i class="right chevron icon"></i></button> </div> </div> </div> <div class="actions"> <div class="ui primary approve button" style="background-color:#6A6A6A;"> 창 닫기 </div> </div> </div>');
							
							for(var i = 0; i<qCount; i++) {
								
								//가져온 데이터 값 꺼내기
								var questionFormNo = rquestionList[i].questionFormNo;
								var researchOrder = rquestionList[i].researchOrder;
								//console.log("researchOrder : " + researchOrder);
								var progressDataPercent = rquestionList[i].progressDataPercent;
								var rquestionContext = rquestionList[i].rquestionContext;
								var rquestionVideolink = rquestionList[i].rquestionVideolink;
								var mediaExplain = rquestionList[i].mediaExplain;
								var fileType = rquestionList[i].fileType;
								var qchangeName = rquestionList[i].qchangeName;
								var filePath = rquestionList[i].filePath;
								
								
								//문제수만큼 생성할 모달 공통 틀 변수
								var $modalArea = $('<div class="ui overlay fullscreen modal" id="Q' + researchOrder + '"></div>');
								var $header = $('<div class="header" style="height:61px; padding:5px;"> <table style="width:100%; height:100%;"> <tr> <td style="width:30%; height:inherit;"> <img src="resources/images/footerLogo.png" alt="" id="footerImg"> </td> <td style="width:70%; height:inherit; padding-right:20px;"> <div class="label" style="margin-top:10px; width:60%; float:left; font-size:15px; text-align:right; padding-right:10px;"> ' + (researchOrder-1) + ' of ' + qCount + ' done </div> <div class="ui indicating progress active" data-value="' + researchOrder + '" data-total="' + qCount + '" id="progress' + researchOrder + '" data-percent="' + progressDataPercent + '%" style="margin-top:10px; width:40%; float:right;"> <input type="text" value="' + progressDataPercent + '" style="display:none;"> <div class="bar" style="transition-duration: 200ms; display: block; width:' + progressDataPercent + '%;"> <div class="progress">' + progressDataPercent + '%</div> </div> </div> </td> </tr> </table> </div>');
								var $contentArea = $('<div class="content insetBox"></div>');
								var $contentBox = $('<div class="modalContainer ui raised segment" style="width:50%; height:auto; min-height:600px; margin:0 auto; margin-top:30px; position:absolute; top:46%; left:50%; transform: translate(-50%, -50%);"></div>');
								var $questionArea = $('<div class="ui segment" style="min-height:50px; width:90%; margin:0 auto; margin-top:42px; padding:25px; background-color:#EFF8FA;"></div>');
								var $question = $('<div class="questionArea" style="width:100%;"> <table id="choiceTable" style="font-size: 0.9vw; line-height: 200%; width:inherit;"> <tr> <th style="width: 3%;"> <div class="iconDiv"> <span style="font-size:1vw;"><b>Q' + researchOrder + '.</b></span> </div> </th> <td style="width:97%; padding-right:20px;"> <span style="font-size:1vw;">' + rquestionContext + '</span> </td> </tr> </table> </div>');
								var $choiceArea = $('<div class="choiceArea" style="height:320px; overflow-y:auto; width:90%; margin:0 auto; margin-top:30px;"></div>');
								var $nextBtn = $('<div class="actions" style="text-align:center; margin-top:40px; margin-bottom:30px;"> <button class="ui blue button" id="nextBtn' + researchOrder + '" style="border-radius:2px; font-size:18px;">다 음 <i class="right chevron icon"></i></button> </div>');
								var $footer = $('<div class="actions"> <div class="ui primary approve button" style="background-color:#6A6A6A;"> 돌아가기 </div> </div>');
								var $choiceHr = $('<table style="width:90%; margin:0 auto; margin-top:50px;"> <tr> <td style="width:46%;"><hr></td> <td style="width:8%; text-align:center;">보 기</td> <td style="width:46%;"><hr></td> </tr> </table>');
								var $answerHr = $('<table style="width:90%; margin:0 auto; margin-top:50px;"> <tr> <td style="width:46%;"><hr></td> <td style="width:8%; text-align:center;">답 변</td> <td style="width:46%;"><hr></td> </tr> </table>');
								
								
								//조건걸기
								
								//1. 문제 종류에 따른 div 만들기 
								//1-1. 문제 div 만들어서 append
								$questionArea.append($question);
								
								//1-2. 문제에 사진 유
								if(qchangeName != "") {
									var $mediaArea = $('<div class="mediaArea" style="width:inherit; height:auto; margin:0 auto;"> <div class="media" style="margin:0 auto; text-align:center;"> <img src="resources/uploadFiles/' + changeName + '" style="height:320px; max-width:90%; margin:0 auto;"> </div> <div class="mediaExplain ui stacked segment" style="margin:0 auto; margin-top: 20px; width:90%; height:auto; padding:15px;"> <span>' + mediaExplain + '</span> </div> </div>');
									$choiceArea.append($mediaArea);
								}
								
								//1-3. 문제에 영상 유
								if(rquestionVideolink != "") {
									var video = rquestionVideolink.substr(rquestionVideolink.lastIndexOf("/", rquestionVideolink.length), 12);
									var $mediaArea = $('<div class="mediaArea" style="width:inherit; height:auto; margin:0 auto;"> <div class="media" style="margin:0 auto; text-align:center;"> <iframe style="margin:0 auto; height:320px; width:90%;" src="https://www.youtube.com/embed' + video + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> </div> <div class="mediaExplain ui stacked segment" style="margin:0 auto; margin-top: 20px; width:90%; height:auto; padding:15px;"> <span>' + mediaExplain + '</span> </div> </div>');
									$choiceArea.append($mediaArea);
								}
								
								
								//2. questionFormNo에 따른 선택지 영역 만들기
								//2-1. 객관식 하나선택
								if(questionFormNo == 1) {
									var $choiceBox = $('<div class="ui two column grid" id="surveyListArea" style="width: inherit; margin: 0 auto; margin-top:10px;"></div>');
									
									if(qchangeName != "" || rquestionVideolink != "") {
										$choiceBox.append($choiceHr);
									}
									
									//보기 하나씩 꺼내기
									for(var j=0; j<rquestionList[i].choiceList.length; j++) {
										var rchoiceOrder = rquestionList[i].choiceList[j].rchoiceOrder;
										var rchoiceContext = rquestionList[i].choiceList[j].rchoiceContext;
										
										var $choice = $('<div class="column" style="margin-top:10px; margin-bottom:10px; padding:0px; padding-right:5px; padding-left:5px;"> <div class="eachSurveyBox" style="height:auto;"> <div class="eachBox" style="min-height:20px;"> <div class="choiceNameArea" style="padding-top:5px;"> <div class="ui radio checkbox" style="margin-bottom: 5px;"> <input type="radio" name="' + researchOrder + '" class="choiceBox" id="' + researchOrder + 'choice' + rchoiceOrder + '" value="'+ rchoiceOrder + '"> <label for="' + researchOrder + 'choice' + rchoiceOrder + '" style="cursor: pointer;"> ' + rchoiceContext + '</label> </div> </div> </div> </div> </div>');
										$choiceBox.append($choice);
									}
									$choiceArea.append($choiceBox);
								}
								
								//2-2. 객관식 다중선택
								if(questionFormNo == 6) {
									var $choiceBox = $('<div class="ui two column grid" id="surveyListArea" style="width: inherit; margin: 0 auto; margin-top:10px;"></div>');
									
									if(qchangeName != "" || rquestionVideolink != "") {
										$choiceBox.append($choiceHr);
									}
									
									//보기 하나씩 꺼내기
									for(var j=0; j<rquestionList[i].choiceList.length; j++) {
										var rchoiceOrder = rquestionList[i].choiceList[j].rchoiceOrder;
										var rchoiceContext = rquestionList[i].choiceList[j].rchoiceContext;
										
										var $choice = $('<div class="column" style="margin-top:10px; margin-bottom:10px; padding:0px; padding-right:5px; padding-left:5px;"> <div class="eachSurveyBox" style="height:auto;"> <div class="eachBox" style="min-height:20px;"> <div class="choiceNameArea" style="padding-top:5px;"> <div class="ui checked checkbox" style="margin-bottom: 5px;"> <input type="checkbox" name="' + researchOrder + '" class="choiceBox" id="' + researchOrder + 'choice' + rchoiceOrder + '" value="'+ rchoiceOrder + '"> <label for="' + researchOrder + 'choice' + rchoiceOrder + '" style="cursor: pointer;"> ' + rchoiceContext + '</label> </div> </div> </div> </div> </div>');
										$choiceBox.append($choice);
									}
									$choiceArea.append($choiceBox);
								}
								
								//2-3. 객관식 하나선택  (보기 사진)
								if(questionFormNo == 3) {
									var $choiceBox = $('<div class="ui three column grid" id="surveyListArea" style="width: inherit; margin: 0 auto; margin-top:10px;"></div>');

									//보기 하나씩 꺼내기
									for(var j=0; j<rquestionList[i].choiceList.length; j++) {
										var rchoiceOrder = rquestionList[i].choiceList[j].rchoiceOrder;
										var rchoiceContext = rquestionList[i].choiceList[j].rchoiceContext;
										var cchangeName = rquestionList[i].choiceList[j].cchangeName;
										
										var $choice = $('<div class="column" style="margin-top:10px; margin-bottom:10px; padding:0px; padding-right:5px; padding-left:5px;"> <div class="ui segment eachSurveyBox" style="margin:10px;"> <div class="eachSurveyBox" style="height:200px;"> <div class="imgArea" style="height:73%; width:100%; margin:0 auto;"> <img src="resources/uploadFiles/' + cchangeName + '" style="height:100%; width:100%;"> </div> <div class="choiceNameArea" style="padding-top:10px; padding-left:5px;"> <div class="ui radio checkbox" style="margin-bottom: 9px;"> <input type="radio" name="' + researchOrder + '" class="choiceBox" id="' + researchOrder + 'choice' + rchoiceOrder + '" value="' + rchoiceOrder + '"> <label for="' + researchOrder + 'choice' + rchoiceOrder + '" style="cursor: pointer; line-height:150%;">  ' + rchoiceContext + '</label> </div> </div> </div> </div> </div>');
										$choiceBox.append($choice);
									}
									$choiceArea.append($choiceBox);
								}
								
								//2-4. 주관식 단답형
								if(questionFormNo == 2) {
									$answerText = $('<div style="width:100%; text-align:center;"><div class="ui input" style="width:30%; margin:0 auto; margin-top:50px; text-align:center;"><input type="text" name="' + researchOrder + '"></div></div>');
									
									if(qchangeName != "" || rquestionVideolink != "") {
										$choiceArea.append($answerHr);
									}
									
									$choiceArea.append($answerText);
								}
								
								//2-5. 주관식 서술형
								if(questionFormNo == 7) {
									$answerText = $('<div style="width:100%; text-align:center;"><div class="ui form" style="width:100%; margin-top:0px; text-align:center;"><textarea style="margin:0 auto; margin-top:20px; resize:none;" placeholder="300자 이내" name="${ q.rquestionOrder }"></textarea></div></div>');
									
									if(qchangeName != "" || rquestionVideolink != "") {
										$choiceArea.append($answerHr);
									}
									
									$choiceArea.append($answerText);
								}
								
								//2-6. 리커트 척도형
								if(questionFormNo == 4) {
									$scaleDiv = $('<div style="height:100%; width:100%; padding-top:130px; "> <table style="width:100%; height:70px; margin:0 auto; margin-bottom:0; text-align:center;"> <tr> <td style="width:9%;"></td> <td style="width:2%;"> <div class="ui radio checkbox" style="margin-bottom: 2px; padding-left:10px; text-align:center;"> <input type="radio" name="' + researchOrder + '" id="' + researchOrder + 'one" value="1"> <label for="' + researchOrder + 'one"></label> </div> </td> <td colspan="2" style="width:18%;"><hr></td> <td style="width:2%;"> <div class="ui radio checkbox" style="margin-bottom: 2px; padding-left:10px; text-align:center;"> <input type="radio" name="' + researchOrder + '" id="' + researchOrder + 'two" value="2"> <label for="' + researchOrder + 'two"></label> </div> </td> <td colspan="2" style="width:18%;"><hr></td> <td style="width:2%;"> <div class="ui radio checkbox" style="margin-bottom: 2px; padding-left:10px; text-align:center;"> <input type="radio" name="' + researchOrder + '" id="' + researchOrder + 'three" value="3"> <label for="' + researchOrder + 'three"></label> </div> </td> <td colspan="2" style="width:18%;"><hr></td> <td style="width:2%;"> <div class="ui radio checkbox" style="margin-bottom: 2px; padding-left:10px; text-align:center;"> <input type="radio" name="' + researchOrder + '" id="' + researchOrder + 'four" value="4"> <label for="' + researchOrder + 'four"></label> </div> </td> <td colspan="2" style="width:18%;"><hr></td> <td style="width:2%;"> <div class="ui radio checkbox" style="margin-bottom: 2px; padding-left:10px; text-align:center;"> <input type="radio" name="' + researchOrder + '" id="' + researchOrder + 'five" value="5"> <label for="' + researchOrder + 'five"></label> </div> </td> <td style="width:9%;"></td> </tr> <tr style="font-size:17px;"> <td colspan="3"> <label for="' + researchOrder + 'one" style="cursor: pointer;">매우 부정</label> </td> <td colspan="3"> <label for="' + researchOrder + 'two" style="cursor: pointer;">부 정</label> </td> <td colspan="3"> <label for="' + researchOrder + 'three" style="cursor: pointer;">보 통</label> </td> <td colspan="3"> <label for="' + researchOrder + 'four" style="cursor: pointer;">긍 정</label> </td> <td colspan="3"> <label for="' + researchOrder + 'five" style="cursor: pointer;">매우 부정</label> </td> </tr> </table> </div>');
									$choiceArea.append($scaleDiv);
								}
								
								//2-7. 숫자 합계형
								if(questionFormNo == 5) {
									$table = $('<table class="ui celled striped table" style="width:80%; margin:0 auto; margin-top:20px; margin-bottom:30px;"></table>');
									$thead = $('<thead> <tr> <th colspan="2" style="text-align:center; color:#00679A;">※ 답변의 총합이 100이 되도록 점수를 분배해주세요.</th> </tr> </thead>');
									$tbody = $('<tbody></tbody>');
									$lastTr = $('<tr> <td class="collapsing" style="font-size:12pt; padding-left:20px;"> 총 합 </td> <td class="center aligned collapsing"> <div class="ui input" style="width:30%; margin:0 auto;"><input type="text" value="100" readonly></div> / 100 </td> </tr>');
									
									for(var j=0; j<rquestionList[i].choiceList.length; j++) {
										var rchoiceOrder = rquestionList[i].choiceList[j].rchoiceOrder;
										var rchoiceContext = rquestionList[i].choiceList[j].rchoiceContext;
										$contentTr = $('<tr> <td class="collapsing" style="width:90%; font-size:12pt; padding-left:20px;"> ' + rchoiceContext + ' </td> <td class="center aligned collapsing" style="width:10%"> <div class="ui input" style="width:40%; margin:0 auto;"><input type="text" name="' + researchOrder + 'answer' + rchoiceOrder + '"></div> </td> </tr>');
										$tbody.append($contentTr);
									}
									$tbody.append($lastTr);
									
									$table.append($thead);
									$table.append($tbody);
									$choiceArea.append($table);
								}
								
								
								$contentBox.append($questionArea);
								$contentBox.append($choiceArea);
								$contentBox.append($nextBtn);
								$contentArea.append($contentBox);
								$modalArea.append($header);
								$modalArea.append($contentArea);
								$modalArea.append($footer);
								$("#modalAppendArea").append($modalArea);
							}
							
							//ts조사 or 일반설문조사
							if(panellevelNo == 1){
								$("#modalAppendArea").append($tsQ0);
							}else{
								$("#modalAppendArea").append($otherQ0);
							}
							//설문조사 완료창
							$("#modalAppendArea").append($lastModal);
							
							$('#surveyStart').modal('setting', 'closable', false).modal('show');
							
							//설문조사 모달창 next누르면 현재창 숨기고 다음창 띄우기 
							$(document).find("#modalAppendArea").find("[id*='nextBtn']").each(function(i, e){
								var btn = 'nextBtn'+i;
								var current = 'Q' + i;
								var next = 'Q' + (i+1);
								console.log(btn);
								$(document).on('click', '#'+btn, function(){
									$(document).find('#'+next).modal('setting', 'closable', false).modal('show');
									$(document).find('#'+current).modal('hide');
								});
							});
							
						},
						error:function(status){
							console.log(status);
						}
					});
				});
				
				
			</script>
		</div>
		<!-- wrap end -->
	</c:if>
	<c:if test="${ loginUser == null }">
		<script>
			location.href="panelResult.panel?message=notLoginAccess";
		</script>
	</c:if>
</body>
</html>









































