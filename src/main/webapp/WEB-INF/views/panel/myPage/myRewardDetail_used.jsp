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
.usedTableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}
#usedTheadArea {
	background-color: #DBDBDB;
}

#usedTheadArea>tr>th {
	height: 25px;
}
#usedTbodyArea {
	text-align: center;
}

#usedTbodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#usedTbodyArea>tr>td {
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
				<a class="item" onclick="location.href='myRewardDetail_saved.panel'"> 적립내역 </a>
				<a class="item active"> 사용내역 </a>
			</div>
			
			<div class="contentsArea">
				<div class="usedArea" style="width: 100%;">
					<br />
					<table class="usedTableArea" style="width: inherit;">
						<thead id="usedTheadArea">
							<tr>
								<th style="width: 10%;">리워드번호</th>
								<th style="width: 40%;">신청내역</th>
								<th style="width: 20%;">신청일</th>
								<th style="width: 15%;">신청 리워드</th>
								<th style="width: 15%;">잔여 리워드</th>
							</tr>
						</thead>  <!-- #usedTheadArea end -->
						<tbody  id="usedTbodyArea">
							<c:forEach begin="1" end="5" step="1">
							<tr>
								<td>12345</td>
								<td>출금</td>
								<td>2020.01.11</td>
								<td>10000p</td>
								<td>3900p</td>
							</tr>
						</c:forEach>
						</tbody>  <!-- #usedTbodyArea end -->
					</table>  <!-- .usedTableArea end -->
				</div>  <!-- .usedArea end -->
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











