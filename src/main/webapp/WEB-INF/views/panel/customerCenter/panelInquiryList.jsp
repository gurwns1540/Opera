<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
</head>
<style>
#inquiryTableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}
.newInquiryTableArea {
	border-collapse: collapse;
	border: 1px solid #b4b4b4;
	margin-left: auto !important;
}
.newInquiryTableArea>tbody>tr>td {
	border-top: 1px solid #b4b4b4;
	border-bottom: 1px solid #b4b4b4;
	text-align: center;
}
#inquiryTheadArea {
	background-color: #DBDBDB;
}

#inquiryTheadArea>tr>th {
	height: 25px;
}

#inquiryTbodyArea {
	text-align: center;
}

#inquiryTbodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#inquiryTbodyArea>tr>td {
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
	border: none;
    cursor: pointer;
}
#goQuestion{
	  background-color: #00679A;
      border-radius: 5px;
      width: 120px;
      height: 35px;
      color: white;
      border: none;
      cursor: pointer;
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
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
		<section class="container">
			<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">패널 1:1문의</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a> <i
								class="right angle icon divider"></i> <a class="section"
								id="depth2" href="notice.panel">고객센터</a> <i
								class="right angle icon divider"></i>
							<div class="active section" id="depth3">패널 1:1문의</div>
						</div>
					</td>
				</tr>
			</table>

			<div class="sectionLine">
				<hr>
			</div>

			<div class="inquiryContentsArea" style="width: 100%;">
				<div class="inquirySearchArea" align="right">
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
				</div>
				<!-- inquirySearchArea end -->
				<br />
				<div class="inquiryArea" style="width: inherit;">
					<table id="inquiryTableArea" align="center" style="width: inherit;">
						<thead id="inquiryTheadArea">
							<tr>
								<th style="width: 10%;">글 번호</th>
								<th style="width: 60%;">제목</th>
								<th style="width: 10%;">조회수</th>
								<th style="width: 20%;">작성일</th>

							</tr>
						</thead>
						<!-- #inquiryTheadArea end -->
						<tbody id="inquiryTbodyArea">
							<c:forEach begin="1" end="5" step="1">
								<tr>
									<td>10</td>
									<td>리워드 기준이 뭔가요?</td>
									<td>1</td>									
									<td>2020.01.03</td>
								</tr>
							</c:forEach>

						</tbody>
						<!-- #inquiryTbodyArea end -->
					</table>
					<!-- #inquiryTableArea end -->
				</div>
				<!-- .inquiryArea end -->
				<br>
				<div align="right">
					<button id="goQuestion">1:1문의하기</button>
				</div>
				<div id="pagingArea" align="center" style="margin-top: 50px;">
					<span>[처음]</span> <span>[이전]</span>
					<c:forEach var="i" begin="1" end="5">
						<span><c:out value="${ i }" /></span>
					</c:forEach>
					<span>[다음]</span> <span>[마지막]</span>
				</div>
				<!-- #pagingArea end -->
			</div>
			<!-- .inquiryContentsArea end -->
			<br />
		</section>
		<!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>
	<!-- wrap end -->
	
	<!-- modal Area -->
	<div class="ui modal">
		<i class="close icon"></i>
		<div class="header">문의하기</div>
		<div class="newInquiryArea" style="width: 90%; height: 510px;" align="center">
			<table class="newInquiryTableArea" style="width: inherit; height: inherit;">
				<tbody id="newInquiryTbodyArea">
					<tr>
						<td style="height: 50px;">구분</td>
						<td>:</td>
						<td>
							<input type="radio" name="division" value="signup" checked="checked"/> 가입관련
							<input type="radio" name="division" value="research" style="margin-left: 10%;"/> 조사관련
							<input type="radio" name="division" value="point" style="margin-left: 10%;"/> 포인트관련
							<input type="radio" name="division" value="etc" style="margin-left: 10%;"/> 기타
						</td>
					</tr>
					<tr>
						<td style="text-align: center; height: 50px;">성명</td>
						<td>:</td>
						<td><input class="ui input" type="text" name="" style="width: 90%;"/></td>
					</tr>
					<tr>
						<td style="text-align: center; height: 50px;">제목</td>
						<td>:</td>
						<td><input class="ui input" type="text" name="" style="width: 90%;"/></td>
					</tr>
					<tr>
						<td style="height: 350px; vertical-align: top; padding-top: 20px;">내용</td>
						<td style="vertical-align: top; padding-top: 20px;">:</td>
						<td style="vertical-align: top; padding-top: 20px;"><textarea name="" id="" style="width: 90%; height: 90%; resize: none;"></textarea></td>
					</tr>
				</tbody>
				<!-- newInquiryTbodyArea end -->
			</table>
			<!-- newInquiryTableArea end -->
		</div>
		<!-- newInquiryArea end -->
		<div class="actions">
			<div class="ui positive right button">문의하기</div>
			<div class="ui black deny button">취소하기</div>
		</div>
	</div>
	<!-- modal Area end -->

	<script>
		$("#inquiryTableArea>#inquiryTbodyArea>tr").hover(function() {
			var tr = $(this);
			var td = $(this).children();
			$(td).css({
				"cursor" : "pointer"
			});
		}).click(function() {
			var tr = $(this);
			var td = tr.children().eq(0).text();

			console.log(td);
		});
		$("#goQuestion").click(function() {
			$(".ui.modal").modal("show");
		});
	</script>
</body>
</html>









































