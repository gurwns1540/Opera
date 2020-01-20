<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
#titleTable {
	margin: 0 auto;
	margin-top: 20px;
}
#menuTitle {
	height: 30px;
	width: 40%;
	font-size: 16pt;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	color: #3D3D3D;
}
#pagePath {
	width: 60%;
	text-align: right;
	vertical-align: bottom;
	font-weight: bold;
}
#depth1, #depth2, #depth3 {
	color: #494949;
}
#depth1:hover, #depth2:hover {
	color: #008499;
}
.sectionLine {
	padding-bottom:40px;
}
/* 여기까지 페이지제목 및 경로 영역 */

#faqTitle {
	background: #DBDBDB;
	border-top: 1px solid #454545;
}
#faqlist{
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
	margin-top: 10px;
	
	/* 드래그 방지용 소스*/
	-ms-user-select: none; 
	-moz-user-select: -moz-none; 
	-webkit-user-select: none; 
	-khtml-user-select: none; 
	user-select:none;
	/* 드래그 방지용 소스*/
}
.tableContext {
		border-top: 1px solid #AEAEAE;
		border-bottom: 1px solid #AEAEAE;
		text-align: center;
}
	#faqlist th {
		font-size: 11pt;
		height: 40px;
	}
	#faqlist td {
		font-size: 11pt;
		height: 50px;
	}

</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">자주 묻는 질문</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="notice.panel">고객센터</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">자주 묻는 질문</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			<table id="faqlist" align="center">
				<tr id="faqTitle">
					<th style="width:10%;">글 번호</th>
					<th style="width:60%;">제목</th>
					<th style="width:10%;">조회수</th>
					<th style="width:20%;">작성날짜</th>
				</tr>
				<tr class="tableContext">
					<td>10</td>
					<td>리워드 규정 안내</td>
					<td>10</td>
					<td>2020-01-20</td>
				</tr>
			</table>
			
			<c:forEach var="i" begin="0" end="8">
				<tr class="tableContext">
					<td>10</td>
					<td>리워드 규정 안내</td>
					<td>10</td>
					<td>2020-01-20</td>
				</tr>
			</c:forEach>
			
			<div>
			
			</div>
			
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>












