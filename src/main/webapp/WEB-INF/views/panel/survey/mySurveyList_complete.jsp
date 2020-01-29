<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
</head>
<style>

.ui.tabular.menu .active.item {
	width: 20%;
	padding-left: 6%;
	cursor: default;
}

.ui.tabular.menu .item {
	width: 20%;
	padding-left: 6%;
}
.searchArea {
	margin-top:50px;
}
#tableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}

#tHeadArea {
	background-color: #DBDBDB;
}

#tHeadArea>tr>th {
	height: 25px;
}

#tBodyArea {
	text-align: center;
}

#tBodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#tBodyArea>tr>td {
	height: 45px;
}

.ui.input {
	height: 30px;
}

#searchBtn {
	background-color: #00679A;
	border-radius: 5px;
	width: 65px;
	height: 30px;
	color: white;
}

/*페이징 css */
#pagingArea {
	margin-top: 40px;
	/* 드래그 방지용 소스*/
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
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
/* 페이징 css end */
</style>
<body>
	<c:if test="${ loginUser != null }">
		<div class="wrap">
			<%@ include file="/WEB-INF/views/panel/common/header.jsp"%>
			<section class="container">
				<br />
	
				<table id="titleTable" height="10px;" width="99%;">
					<tr>
						<td id="menuTitle">참여한 설문조사</td>
						<td id="pagePath">
							<div class="ui breadcrumb">
								<a class="section" id="depth1" href="panelMain.panel">Home</a>
								<i class="right angle icon divider"></i>
								<a class="section" id="depth2" href="surveyList.panel">서베이</a>
								<i class="right angle icon divider"></i>
								<div class="active section" id="depth3">참여한 설문조사</div>
							</div>
						</td>
					</tr>
				</table>
				
				<div class="sectionLine">
					<hr>
				</div>
	
	
	
				<div class="ui tabular menu">
					<a class="item active"> 참여 완료 조사 </a>
					<a class="item" onclick="location.href='mySurveyList_retry.panel'"> 참여 시도 조사 </a>
				</div>
	
	
				
				<div class="ContentsArea" style="width: 100%;">
					<div class="searchArea" align="right">
						<table>
							<tr>
								<td>
									<h4>검색어</h4>
								</td>
								<td></td>
								<td></td>
								<td>
									<div class="ui input">
										<input type="search" name="" />
									</div>
								</td>
								<td>
									<button id="searchBtn">검색</button>
								</td>
							</tr>
						</table>
					</div>  <!-- inquirySearchArea end -->
					<br />
					<div class="listArea" style="width: inherit;">	
						<table id="tableArea" align="center" style="width: inherit;">
							<thead id="tHeadArea">
								<tr>
									<th style="width: 20%;">조사번호</th>
									<th style="width: 60%;">조사명</th>
									<th style="width: 20%;">응답일자</th>
									
								</tr>
							</thead>  <!-- #inquiryTheadArea end -->
							<tbody id="tBodyArea">
							<c:forEach begin="1" end="5" step="1">
								<tr>
									<td>84532</td>
									<td>스낵 선호도 조사</td>
									<td>2020.01.11</td>
								</tr>
							</c:forEach>
								
							</tbody>  <!-- #inquiryTbodyArea end -->
						</table>  <!-- #inquiryTableArea end -->
					</div>  <!-- .inquiryArea end -->
					<div id="pagingArea" align="center" style="margin-top: 50px;">
				        <span>[처음]</span>
				        <span>[이전]</span>
				        <c:forEach var="i" begin="1" end="5">
				        	<span><c:out value="${ i }"/></span>
				        </c:forEach>
				        <span>[다음]</span>
				        <span>[마지막]</span>
			     	</div>  <!-- #pagingArea end -->
				</div>  <!-- .inquiryContentsArea end -->
	
	
	
	
	
	
				<br />
			</section>
			<!-- container end -->
			<%@ include file="/WEB-INF/views/panel/common/footer.jsp"%>
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









































