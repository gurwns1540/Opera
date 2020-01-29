<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<c:if test="${ sessionScope.loginUser.panellevelNo eq 1 }">
						<div class="column">
							<div class="ui segment cards eachSurveyBox" id="thanksSurvey"> <!-- 설문조사 시작 페이지로 넘어갈때 이 div영역에 링크걸면됩니다. -->
								<div class="eachBox" style="width: 100%;">
									<div class="top">
										<table style="width: 100%;">
											<tr>
												<td class="top-left"><span style="font-size:0.9vw;">[ TS ]</span></td>
												<td class="top-right">
													<img src="resources/images/pc.png" alt="" class="icon"/>
													<img src="resources/images/mobile.png" alt="" class="icon"/>
												</td>
											</tr>
											<tr>
										</table>
									</div>
									<div class="middle" style="height: 60px;">
										<span style="font-size:1vw;">Thanks Survey</span>
									</div>
									<div class="bottom" style="height: 111px;">
										<div class="bottom-top" style="height: 25%; text-align:center; padding-top:14px;">
											<span style="font-weight:bold; font-size:1vw; color:#005E8C;">1000P</span>
										</div>
										<div class="bottom-middle" style="padding-top:14px;">
											<span style="font-size:0.8vw; font-weight:bold;">${ sessionScope.loginUser.userName }님, 안녕하세요!</span>
										</div>
										<div class="bottom-bottom" style="height: 45%; padding-top:5px;">
											<span style="font-size:0.7vw;">Thanks Survey에 참여하신 후<br>다양한 설문조사를 받아보세요.</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${ sessionScope.loginUser.panellevelNo ne 1 }">
						<c:forEach begin="1" end="10" step="1">
							<div class="column">
								<div class="ui segment cards eachSurveyBox"> <!-- 설문조사 시작 페이지로 넘어갈때 이 div영역에 링크걸면됩니다. -->
									<div class="eachBox" style="width: 100%;">
										<div class="top">
											<table style="width: 100%;">
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
					</c:if>
				</div>
	
				<div id="pagingArea" align="center">
					<span>[처음]</span> <span>[이전]</span>
					<c:forEach var="i" begin="1" end="10">
						<span><c:out value="${ i }" /></span>
					</c:forEach>
					<span>[다음]</span> <span>[마지막]</span>
				</div>
				
				
				<div class="ui modal" id="tsModal">
					
				</div>
				
				
				
				<br />
			</section>
			<!-- container end -->
			<%@ include file="/WEB-INF/views/panel/common/footer.jsp"%>
			
			
			<script>
				$(document).on("click", "#thanksSurvey",function(){
					$('#tsModal').modal('show');
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









































