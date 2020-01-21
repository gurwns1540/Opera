<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
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
.savedTableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}
#savedTheadArea {
	background-color: #DBDBDB;
}

#savedTheadArea>tr>th {
	height: 25px;
}
#savedTbodyArea {
	text-align: center;
}

#savedTbodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#savedTbodyArea>tr>td {
	height: 45px;
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
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">상세내역</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth3" href="myRewardMain.panel">내 리워드</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth4">상세내역</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			<div class="ui tabular menu">
				<a class="item active"> 적립내역 </a>
				<a class="item" onclick="location.href='myRewardDetail_used.panel'"> 사용내역 </a>
			</div>
			
			<div class="contentsArea">
				<div class="savedArea" style="width: 100%;">
					<br />
					<table class="savedTableArea" style="width: inherit;">
						<thead id="savedTheadArea">
							<tr>
								<th style="width: 20%;">조사번호</th>
								<th style="width: 40%;">조사명</th>
								<th style="width: 20%;">응답일</th>
								<th style="width: 20%;">리워드</th>
							</tr>
						</thead>  <!-- #savedTheadArea end -->
						<tbody  id="savedTbodyArea">
							<c:forEach begin="1" end="5" step="1">
							<tr>
								<td>84532</td>
								<td>스낵 선호도 조사</td>
								<td>2020.01.11</td>
								<td>100p</td>
							</tr>
						</c:forEach>
						</tbody>  <!-- #savedTbodyArea end -->
					</table>  <!-- .savedTableArea end -->
				</div>  <!-- .savedArea end -->
				<div id="pagingArea" align="center" style="margin-top: 50px;">
			        <span>[처음]</span>
			        <span>[이전]</span>
			        <c:forEach var="i" begin="1" end="5">
			        	<span><c:out value="${ i }"/></span>
			        </c:forEach>
			        <span>[다음]</span>
			        <span>[마지막]</span>
		     	</div>  <!-- #pagingArea end -->
			</div>  <!-- .contentsArea end -->
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>












