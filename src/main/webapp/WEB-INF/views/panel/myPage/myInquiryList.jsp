<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
	#inquiryTableArea {
		border-top: 1px solid #3C3C3C;
		border-collapse: collapse;
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
	#newInquiryBtn {
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
	/* 페이징 css end */
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
		<br />
		<table id="titleTable" height="10px;" width="99%;">
			<tr>
				<td id="menuTitle">내 1:1 문의</td>
				<td id="pagePath">
					<div class="ui breadcrumb">
						<a class="section" id="depth1" href="panelMain.panel">Home</a>
						<i class="right angle icon divider"></i>
						<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
						<i class="right angle icon divider"></i>
						<div class="active section" id="depth3">내 1:1 문의</div>
					</div>  <!-- .ui .breadcrumb end -->
				</td>
			</tr>
		</table>  <!-- #titleTable end -->
		
		<div class="sectionLine">
			<hr>
		</div>  <!-- .sectionLine end -->
			
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
				</div>  <!-- inquirySearchArea end -->
				<br />
				<div class="inquiryArea" style="width: inherit;">	
					<table id="inquiryTableArea" align="center" style="width: inherit;">
						<thead id="inquiryTheadArea">
							<tr>
								<th style="width: 10%;">문의번호</th>
								<th style="width: 50%;">문의제목</th>
								<th style="width: 20%;">문의일자</th>
								<th style="width: 20%;">답변일자</th>
								
							</tr>
						</thead>  <!-- #inquiryTheadArea end -->
						<tbody id="inquiryTbodyArea">
						<c:forEach begin="1" end="5" step="1">
							<tr>
								<td>84532</td>
								<td>스낵 선호도 조사</td>
								<td>2020.01.03</td>
								<td>답변 대기</td>
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
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
	<script>
		$("#inquiryTableArea>#inquiryTbodyArea>tr").hover(function(){
			var tr = $(this);
			var td = $(this).children();
			$(td).css({"cursor":"pointer"});
		}).click(function(){
			var tr = $(this);
			var td = tr.children().eq(0).text();
			
			console.log(td);
		});
	</script>
</body>
</html>












