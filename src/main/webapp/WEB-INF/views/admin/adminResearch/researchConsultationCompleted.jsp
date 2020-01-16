<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리서치 승인 대기 목록</title>
<style>
	#approvalBtnArea {
		position: relative;
		right: 10px;
		float: right;
		margin-bottom: 10px;
	}
	#approvalBtnArea button {
		width: 130px;
		height: 30px;
		background: #EDEBEB;
		font-size: 10pt;
	}
	#searchInput {
		margin-top: 10px;
	}
	#searchInput, .ui.action.input {
		width: 200px;
		height: 37px;
		font-size: 11pt;
		position: relative;
		right: 10px;
		float: right;
	}
	#adminBoxTable {
		width: 100%;
	}
	#listTable {
		width: 100%;
		border-spacing: 0;
		border-collapse: collapse;
		margin-top: 10px;
	}
	#listTable th {
		font-size: 11pt;
		height: 40px;
	}
	#listTable td {
		font-size: 11pt;
		height: 50px;
	}
	#tableTitle {
		background: #DBDBDB;
		border-top: 1px solid #454545;
	}
	.tableContext {
		border-top: 1px solid #AEAEAE;
		border-bottom: 1px solid #AEAEAE;
		text-align: center;
	}
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
	.detail {
		font-size: 9pt;
		background: #EDEBEB;
		width: 80px;
		height: 30px;
	}
	.detail2 {
		font-size: 9pt;
		background: #EDEBEB;
		width: 80px;
		height: 30px;
	}
	.payStatus {
		width: 170px;
		height: 50px;
		font-size: 15pt;
		color: #B4B4B4;
		border-radius: 13px;
		border: 1px solid #B4B4B4;
		margin: 20px auto;
		padding: 5px;
		text-align: center;
		vertical-align: middle;
		line-height: 35px;
	}
	#completePayment {
		color: #0F83BD;
		border: 2px solid #0F83BD;
	}
	#payTable {
		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#payTable th {
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#payTable td {
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	.arrow {
  		margin: 20px auto;
  		width: fit-content;
  	}
  	#completeBtn {
  		width: 60%;
  		height: 40px;
  		float: right;
  	}
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<table id="adminBoxTable">
			<tr>
				<td>
					<div id="approvalBtnArea">
						<button onclick="location.href='researchWaitingPayment.admin'">협의중</button>
						<button onclick="location.href='researchConsultationCompleted.admin'" id="clickBtn">협의완료</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						리서치 협의 완료 목록
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="searchInput">
						<div class="ui action input">
			  				<input type="text" placeholder="Search...">
							<button class="ui icon button">
								<i class="search icon"></i>
							</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<table id="listTable">
			<tr id="tableTitle">
				<th style="width: 10%;">리서치 번호</th>
				<th style="width: 20%;">기업명</th>
				<th style="width: 40%;">리서치 제목</th>
				<th style="width: 10%;">승인일</th>
				<th style="width: 10%;">상태</th>
				<th style="width: 10%;"> 상세보기</th>
			</tr>
			<tr class="tableContext">
				<td>리서치 번호</td>
				<td>기업명</td>
				<td>리서치 제목</td>
				<td>승인일</td>
				<td>결제 대기중</td>
				<td><button class="detail2">상세 보기</button></td>
			</tr>
			<c:forEach var="i" begin="0" end="8">
				<tr class="tableContext">
					<td>리서치 번호</td>
					<td>기업명</td>
					<td>리서치 제목</td>
					<td>승인일</td>
					<td>결제 완료</td>
					<td><button class="detail">상세 보기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<span>[처음]</span>
			<span>[이전]</span>
			<c:forEach var="i" begin="1" end="10">
				<span><c:out value="${ i }"/></span>
			</c:forEach>
			<span>[다음]</span>
			<span>[마지막]</span>
		</div>
	</div>
	<div class="ui modal" id="payment">
		<div class="header">결제 상태</div>
		<div class="scrolling content">
			<div>
				<table id="payTable">
					<tr>
						<td rowspan="4">
							<div id="paymentStatus">
								<div class="payStatus" id="completePayment">결제 대기중</div>
								<div class="arrow" id="completeArrow"><i class="large primary chevron down icon"></i></div>
								<div class="payStatus" id="completePayment">결제 완료</div>
							</div>
						</td>
						<th>문항 수</th>
						<td>5개</td>
					</tr>
					<tr>
						<th>설문 예상소요시간</th>
						<td>3분</td>
					</tr>
					<tr>
						<th>목표 인원</th>
						<td>200명</td>
					</tr>
					<tr>
						<th>예상 금액</th>
						<td>3,500,000원</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>	
	
	<div class="ui modal" id="payment2">
		<div class="header">결제 상태</div>
		<div class="scrolling content">
			<div>
				<table id="payTable">
					<tr>
						<td rowspan="4">
							<div id="paymentStatus">
								<div class="payStatus" id="completePayment">결제 대기중</div>
								<div class="arrow" id="completeArrow"><i class="large primary chevron down icon"></i></div>
								<div class="payStatus">결제 완료</div>
							</div>
						</td>
						<th>문항 수</th>
						<td>5개</td>
					</tr>
					<tr>
						<th>설문 예상소요시간</th>
						<td>3분</td>
					</tr>
					<tr>
						<th>목표 인원</th>
						<td>200명</td>
					</tr>
					<tr>
						<th>예상 금액</th>
						<td>3,500,000원</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>	
	
	<script>
		$(".detail").on("click", function(){
			var num = $(this).parent().siblings().eq(0).text();
			$('#payment').modal('show');
			//console.log(num);
		});
		
		$(".detail2").on("click", function(){
			var num = $(this).parent().siblings().eq(0).text();
			$('#payment2').modal('show');
			//console.log(num);
		});
		
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(2)").addClass("on");
	</script>
</body>
</html>