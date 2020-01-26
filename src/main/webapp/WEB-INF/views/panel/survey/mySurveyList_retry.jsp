<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	margin-top: 50px;
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

#retryBtn {
	background-color: #00679A;
	border-radius: 4px;
	width: 100px;
	height: 25px;
	color: white;
	border: none;
	cursor: pointer;
	font-size:9pt;
}

#disableBtn {
	background-color: #C1332A;
	border-radius: 4px;
	width: 100px;
	height: 25px;
	color: white;
	border: none;
	cursor: pointer;
	font-size:9pt;
}

#overBtn {
	background-color: #494949;
	border-radius: 4px;
	width: 100px;
	height: 25px;
	color: white;
	border: none;
	cursor: pointer;
	font-size:9pt;
}
#disableBtn:hover,#overBtn:hover {
	cursor:default;
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
				<a class="item" onclick="location.href='mySurveyList_complete.panel'"> 참여 완료 조사 </a>
				<a class="item active"> 참여 시도 조사 </a>
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
								<th style="width: 15%;">조사번호</th>
								<th style="width: 50%;">문의제목</th>
								<th style="width: 15%;">시도일자</th>
								<th style="width: 20%;">상  태</th>
								
							</tr>
						</thead>  <!-- #inquiryTheadArea end -->
						<tbody id="tBodyArea">
						<%-- <c:forEach begin="1" end="5" step="1"> --%>
							<tr>
								<td>84532</td>
								<td>스낵 선호도 조사</td>
								<td>2020.01.05</td>
								<td><button id="retryBtn">재참여하기</button></td>
							</tr>
							<tr>
								<td>84524</td>
								<td>소비자 인식 조사</td>
								<td>2020.01.10</td>
								<td><button id="disableBtn" disabled>재참여불가</button></td>
							</tr>
							<tr>
								<td>84532</td>
								<td>음료 선호도 조사</td>
								<td>2020.01.15</td>
								<td><button id="overBtn" disabled>기간만료</button></td>
							</tr>
						<%-- </c:forEach> --%>
							
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
</body>
</html>









































