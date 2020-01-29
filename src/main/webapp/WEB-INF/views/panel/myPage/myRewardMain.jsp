<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
</head>
<style>
	.ui.circular.segment {
		width:230px;
		height:230px;
		display:inline-block;
		margin:0;
		margin-left:20px;
		margin-right:20px;
		padding-top:80px;
		background-color:#F8F8F8;
	}
</style>
<body>
	<c:if test="${ loginUser != null }">
		<div class="wrap">
			<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
			<section class="container">
			<br />
			
			
				<table id="titleTable" height="10px;" width="99%;">
					<tr>
						<td id="menuTitle">내 리워드 관리</td>
						<td id="pagePath">
							<div class="ui breadcrumb">
								<a class="section" id="depth1" href="panelMain.panel">Home</a>
								<i class="right angle icon divider"></i>
								<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
								<i class="right angle icon divider"></i>
								<div class="active section" id="depth3">내 리워드 관리</div>
							</div>
						</td>
					</tr>
				</table>
				
				<div class="sectionLine">
					<hr>
				</div>
				<div style="margin-bottom:60px;">
	        <span style="font-size:1vw; padding-left:40px;"><b>회원님의 현재 리워드 현황입니다.</b></span>
				</div>
				
				
				<div id="myRewardArea" style="width: 80%; height:auto; margin: 0 auto; text-align:center; margin-bottom:40px;">
					<div class="ui circular segment">
						<h3 class="ui header">
							모으신 총 포인트는
							<div class="sub header" style="">15,600 P</div>
						</h3>
					</div>
					<div class="ui circular segment">
					</div>
					<div class="ui inverted circular segment" style="background-color:#0E597D;">
					</div>
				</div>
				
				
				<div align="center" style="margin-top:80px;">
					<button class="ui blue button" onclick="location.href='myRewardDetail_saved.panel'">리워드 상세내역</button>
					<button class="ui blue button" onclick="location.href='myRewardCashOut.panel'">리워드 신청하기</button>
				</div>
				
				
			<br />
			</section>  <!-- container end -->
			<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
		</div>  <!-- wrap end -->
	</c:if>
	<c:if test="${ loginUser == null }">
		<script>
			location.href="panelResult.panel?message=notLoginAccess";
		</script>
	</c:if>
</body>
</html>












