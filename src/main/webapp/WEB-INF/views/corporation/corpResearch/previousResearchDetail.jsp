<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>

	#listArea {
		width: 90%;
		margin: 0 auto;
		margin-top: 50px;
	}
	#listArea div {
		margin: 20px auto;
		width: fit-content;
	}
	#mainTitle {
		font-size: 30px;
	}
	#subTitle {
		font-size: 20px;
	}
	#searchArea {
		width: 80%;
		margin: 50px auto;
		margin-bottom: 100px;
	}
	#listMainArea {
		width: 100%;
		height: auto;
	}
	.menu.transition.visible {
		height: 150px;
	}
	#corpTable, #priceConferenceTable, #referTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#corpTable th, #priceConferenceTable th, #referTable th {
  		width: 20%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#corpTable td, #priceConferenceTable td, #referTable td {
  		width: 80%;
  		border-bottom: 1px solid #C5C5C5;
  	}
	#payTable {
		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#payTable th {
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#payTable td {
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	.arrow {
  		margin: 20px auto;
  		width: fit-content;
  	}
  	#completeBtn {
  		width: 60%;
  		height: 40px;
  		float: right;
  	}
  	.payStatus {
		width: 170px;
		height: 50px;
		font-size: 15pt;
		color: #B4B4B4;
		border-radius: 13px;
		border: 1px solid #B4B4B4;
		margin: 20px auto;
		padding: 5px;
		text-align: center;
		vertical-align: middle;
		line-height: 35px;
	}
	#completePayment {
		color: #0F83BD;
		border: 2px solid #0F83BD;
	}
	.thDiv {
		text-align: left;
		width: 150px;
		float: right;
	}
	.disabledArrow {
		color: #B4B4B4 !important;
	}
	.disabledStatus {
		color: #B4B4B4 !important;
		border: 1px solid #B4B4B4 !important;
	}
	input[type=button]:focus {
		outline: none;
	}
	.swal2-input[type=number] {
   		max-width: 16em !important;
	}	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar2.jsp"/>
	<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.userType ne '기업' }">
		<c:set var="msg" value="기업회원만 접근 가능합니다." scope="request"/>
		<jsp:forward page="/WEB-INF/views/common/errorPage.jsp"/>
	</c:if>
	<div id="listMainArea">
		<div id="listArea">
			<div id="mainTitle">리서치 의뢰 내용</div>
			<div id="subTitle">의뢰한 리서치의 상세 내용을 확인할 수 있습니다.</div>
		</div>
		
		<div id="searchArea">
			<table id="corpTable">
				<tr>
					<th><div class="thDiv">프로젝트 명</div></th>
					<td>${ research.researchName }</td>
				</tr>
				<tr>
					<th><div class="thDiv">목적</div></th>
					<td>${ research.researchPerpose }</td>
				</tr>
				<tr>
					<th><div class="thDiv">목표 인원</div></th>
					<td>${ research.researchEngagementGoals }명</td>
				</tr>
				<tr>
					<th><div class="thDiv">조사 대상 성별</div></th>
					<td>
						<c:if test="${ research.targetGender == 'A' }">
							전체
						</c:if>
						<c:if test="${ research.targetGender == 'M' }">
							남성
						</c:if>
						<c:if test="${ research.targetGender == 'F' }">
							여성
						</c:if>
					</td>
				</tr>
				<tr>
					<th><div class="thDiv">조사 대상 연령</div></th>
					<td>${ research.targetAgeRange }</td>
				</tr>
				<tr>
					<th><div class="thDiv">조사 대상 지역</div></th>
					<td>
						<c:if test="${ research.targetLocation == 'all' }">
							전체
						</c:if>
						<c:if test="${ research.targetLocation == 'metropolitan' }">
							서울 및 수도권
						</c:if>
						<c:if test="${ research.targetLocation == 'city' }">
							서울, 경기 및 9대 광역시
						</c:if>
					</td>
				</tr>
				<tr>
					<th><div class="thDiv">조사 대상 직업군</div></th>
					<td>${ research.occupationNo }</td>
				</tr>
				<tr>
					<th><div class="thDiv">조사 예상 기간</div></th>
					<td>${ research.researchPeriod }</td>
				</tr>
			</table>
			<c:if test="${ research.researchState != '반려' }">
				<table id="payTable">
						<tr>
							<td rowspan="5" style="width: 50%; /* 드래그 방지용 소스*/ -ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none; /* 드래그 방지용 소스*/">
								<div id="paymentStatus" style="padding-top: 20px; padding-bottom: 20px;">
									<div class="payStatus" id="completePayment">승인 대기중</div>
									<div class="arrow" id="completeArrow"><i class="large primary chevron down icon"></i></div>
									<div class="payStatus" id="completePayment">결제 대기중</div>
									<div class="arrow" id="completeArrow"><i class="large primary chevron down icon"></i></div>
									<div class="payStatus" id="completePayment">결제 완료</div>
								</div>
							</td>
							<th>문항 수</th>
							<td>${ questionCount }개</td>
						</tr>
						<tr>
							<th>설문 예상소요시간</th>
							<td>
								<c:choose>
									<c:when test="${ questionCount <= 10 }">
										5분(10문항 이내)
									</c:when>
									<c:when test="${ questionCount > 10 and questionCount <= 30 }">
										10분(11~30문항 이내)
									</c:when>
									<c:when test="${ questionCount > 30 and questionCount <= 50 }">
										15분(31~50문항 이내)
									</c:when>
									<c:when test="${ questionCount > 50 and questionCount <= 70 }">
										20분(51~70문항 이내)
									</c:when>
									<c:otherwise>
										20분 이상(70문항 이상)
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>목표 인원</th>
							<td>${ research.researchEngagementGoals }명</td>
						</tr>
						<tr>
							<th>
								<c:if test="${ research.researchPrice == 0 }">
									예상 금액
								</c:if>
								<c:if test="${ research.researchPrice != 0 }">
									<c:if test="${ researchState == '가격 협의중' }">
										마지막 협의 가격
									</c:if>
									<c:if test="${ researchState != '가격 협의중' }">
										결제 금액
									</c:if>
								</c:if>
							</th>
							<td>
								<c:if test="${ research.researchState == '승인 대기' }">
									<c:choose>
										<c:when test="${ questionCount <= 10 }">
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4500 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3800 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3400 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3000 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 2800 }"/>
												</c:when> 
											</c:choose>
										</c:when>
										<c:when test="${ questionCount > 10 and questionCount <= 30 }">
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 5100 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4500 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3800 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3400 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 2800 }"/>
												</c:when> 
											</c:choose>
										</c:when>
										<c:when test="${ questionCount > 30 and questionCount <= 50 }">
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 6700 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 5500 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4700 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4200 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3700 }"/>
												</c:when> 
											</c:choose>
										</c:when>
										<c:when test="${ questionCount > 50 and questionCount <= 70 }">
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 8400 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 7000 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 6300 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 5800 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4500 }"/>
												</c:when> 
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 9400 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 8000 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 7300 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 6500 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 5700 }"/>
												</c:when> 
											</c:choose>
										</c:otherwise>
									</c:choose>
									 원 + ∂ (추후 협의)
								</c:if>
								<c:if test="${ research.researchState != '승인 대기' }">
									<c:if test="${ research.researchState == '가격 협의중' }">
										<fmt:formatNumber value="${ research.researchPrice }"/> 원 (협의 중)
									</c:if>
									<c:if test="${ research.researchState != '가격 협의중' }">
										<fmt:formatNumber value="${ research.researchPrice }"/> 원
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div style="width: 45%; margin: 0 auto;">
									<input type="button" id="payment" value="결  제" disabled style="border: 0; width: 100%; height: 50px;">
								</div>
							</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${ research.researchState == '반려' }">
					<table id="referTable">
						<tr>
							<th><div class="thDiv">반려 사유</div></th>
							<td>${ research.referReason }</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${ research.researchState == '리서치 완료' }">
					데이터들 들어갈거임
				</c:if>
				<c:if test="${ research.researchState == '질문 재구성 협의중' }">
					질문 재구성 협의 시 질문들 나올거임
				</c:if>
				<c:if test="${ research.researchState == '가격 협의중' || research.researchState == '납부 대기' }">
					<table id="priceConferenceTable">
						<tr>
							<th><div class="thDiv">이전 협상 가격</div></th>
							<td><fmt:formatNumber value="${ research.conferencePrice }"/> 원</td>
						</tr>
						<tr>
							<th><div class="thDiv">현재 가격</div></th>
							<td><fmt:formatNumber value="${ research.researchPrice }"/> 원</td>
						</tr>
						<tr>
							<th colspan="2">
								<div style="width: 40%; margin: 0px auto;">
									<input type="hidden" id="priceConference" value="가격  협의" disabled style="border: 0; width: 100%; height: 50px;">
								</div>
							</th>
						</tr>
					</table>
				</c:if>
				<div style="width: fit-content; margin: 30px auto;">
					<input type="button" onclick="location.href='previousResearchMain.corpResearch'" value="목록으로" style="color: white; background: #00679A; border: 0; width: 270px; height: 50px;">
				</div>
			</div>
	</div>
	<div style="margin-top: 100px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
	<script>
		$(function(){
			var researchState = "${research.researchState}";
			
			if(researchState == '승인 대기'){
				$(".payStatus").eq(1).addClass("disabledStatus");
				$(".payStatus").eq(2).addClass("disabledStatus");
				$(".arrow i").eq(0).addClass("disabledArrow");
				$(".arrow i").eq(1).addClass("disabledArrow");
				$("#payment").css({"background":"#EFEFEF", "color":"#808080"});
			}else if(researchState == '가격 협의중') {
				$(".payStatus").eq(1).addClass("disabledStatus");
				$(".payStatus").eq(2).addClass("disabledStatus");
				$(".arrow i").eq(1).addClass("disabledArrow");
				$("#priceConference").prop("type", "button");
				$("#priceConference").val("가격 협의중");
				$("#payment").prop("type", "hidden");
				$("#priceConference").css({"background":"#EFEFEF", "color":"#808080", "margin":"auto;"});
				$("#payment").css({"background":"#EFEFEF", "color":"#808080"});
			}else if(researchState == '납부 대기') {
				$(".payStatus").eq(2).addClass("disabledStatus");
				$(".arrow i").eq(1).addClass("disabledArrow");
				$("#payment").css({"background":"#00679A", "color":"white"});
				$("#priceConference").prop("type", "button");
				$("#payment").prop("disabled", false);
				$("#priceConference").prop("disabled", false);
			}else {
				$("#payment").css({"background":"#EFEFEF", "color":"#808080"});
				$("#payment").val("결제  완료");
			}
		});
		
		$(document).on("click", "#payment", function(){
			console.log("하하");
			// 결제 api쓸 예정
		});
		researchNo = ${research.researchNo}
		$(document).on("click", "#priceConference", function(){
			
			const start = async function() {
				const { value: text } = await Swal.fire({
					  input: 'number',
					  inputPlaceholder: '협상하실 가격을 적어주세요',
					  inputAttributes: {
					    'aria-label': 'Type your message here'
					  },
					  showCancelButton: true,
					  inputValidator: (value) => {
					    if (!value) {
					      return '협상가격을 적어주세요!'
					    }
					  }
				});
	
				if (text) {
					Swal.fire({
					  title: '가격 협상을 진행하시겠습니까?',
					  text: "협상을 통해 가격을 조정하실 수 있습니다.",
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes'
					}).then((result) => {
					  	if (result.value) {
					  		
						  	$.ajax({
								url:"priceConference.corpResearch",
								type:"post",
								data:{
									researchNoStr:researchNo,
									priceStr : text
								},
								success:function(data){
									Swal.fire(
							      		'가격협상!',
							      		'입력하신 가격으로 협상을 진행하였습니다.',
							      		'success'
						    		)
								  	setTimeout(function(){
									  location.reload();
									},1500)
								},
								error:function(status){
									console.log(status);
								}
							});
					  }
					})
				}
			}
			start();
		});
	</script>

</body>
</html>