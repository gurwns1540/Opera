<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<header class="headerArea">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>

	<table class="headerTableArea" align="center">
		<tr>
			<td class="headerLogoArea">
				<a href="panelMain.panel"><img src="resources/images/headerLogo.png" alt="" id="logoImg" /></a>
			</td>
			<td class="smallLogoArea">
				<a href="panelMain.panel"><img src="resources/images/smallLogo.png" alt="" id="logo2Img" /></a>
			</td>
			<td class="headerLoginArea">
				<c:choose>
					<c:when test="${ not empty sessionScope.loginUser }">
						<a href="logout.me" style="margin-right: 5%;">로그아웃</a>
						<a href="#">내 정보 관리</a>
					</c:when>
					<c:otherwise>
						<a href="panelLogin.panel" style="margin-right: 5%;">로그인</a>
						<a href="panelSignup.panel">회원가입</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>  <!-- headerTableArea end -->
</header>  <!-- headerArea end -->
<nav class="navArea">
	<div class="navContainer">
		<div class="ui four inverted item menu" id="nav">
			<div class="ui simple dropdown item" style="border-left: 1px solid #b4b4b4; height: 35px; letter-spacing: 10px;">
				안내
				<div class="menu" style="letter-spacing: 0">
					<a href="benefitInfo.panel" class="item">혜택 안내</a>
			    	<a href="surveyGuide.panel" class="item">조사참여 가이드</a>
				</div>
			</div>
			<div class="ui simple dropdown item" style="border-left: 1px solid #b4b4b4; height: 35px;">
		   		 서베이
		   		 <div class="menu">
			    	<a href="surveyList.panel" class="item">진행중인 설문조사</a>
			    	<a href="mySurveyList.panel" class="item">참여한 설문조사</a>
			    	<a href="panelSurvey.panel" class="item">패널서베이</a>
		    	</div>
		  	</div>
			<div class="ui simple dropdown item" style="border-left: 1px solid #b4b4b4; height: 35px;">
		   		 마이페이지
		    	<div class="menu">
			    	<a href="myInfo.panel" class="item">내 정보 관리</a>
			    	<a href="myRewardMain.panel" class="item">내 리워드 관리</a>
			    	<a href="myInquiryList.panel" class="item">내 1:1 문의</a>
			    	<a href="panelDrop.panel" class="item">패널 탈퇴</a>
		    	</div>
		  	</div>
			<div class="ui simple dropdown item" style="border-left: 1px solid #b4b4b4; border-right: 1px solid #b4b4b4; height: 35px;">
		   		 고객센터
		    	<div class="menu">
			    	<a href="notice.panel" class="item">공지사항</a>
			    	<a href="faq.panel" class="item">자주묻는 질문</a>
			    	<a href="panelInquiryList.panel" class="item">패널 1:1 문의</a>
		    	</div>
		  	</div>
		</div>
	</div>  <!-- navContainer end -->
</nav>  <!-- navArea end -->