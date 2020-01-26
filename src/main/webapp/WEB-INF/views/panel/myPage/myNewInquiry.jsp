<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>

#depth1, #depth2, #depth3, #depth4 {
	color: #494949;
}
#depth1:hover, #depth2:hover, #depth3:hover {
	color: #008499;
	cursor: pointer;
}
/* 여기까지 페이지제목 및 경로 영역 */

.newInquiryTableArea {
	border-top: 1px solid #B4B4B4;
	border-bottom: 1px solid #B4B4B4;
	border-right: 1px solid #B4B4B4;
	border-left: 1px solid #B4B4B4;
}
newInquiryTbodyArea tr td:nth-child(n){
	text-align: right;
}

</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">문의하기</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth3" href="myOneOnOneList.panel">내 1:1 문의</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth4">문의하기</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			<div class="newInquiryArea" style="width: 100%;">
				<table class="newInquiryTableArea" style="width: inherit;" border="1">
					<tbody id="newInquiryTbodyArea">
						<tr>
							<td>구분</td>
							<td>:</td>
							<td>
								
							</td>
						</tr>
						<tr>
							<td>성명</td>
							<td>:</td>
							<td>
							
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>:</td>
							<td>
							
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>:</td>
							<td>
								<textarea name="" id="" cols="30" rows="10"></textarea>
							</td>
						</tr>
					</tbody>  <!-- newInquiryTbodyArea end -->
				</table>  <!-- newInquiryTableArea end -->
			</div>  <!-- newInquiryArea end -->
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>












