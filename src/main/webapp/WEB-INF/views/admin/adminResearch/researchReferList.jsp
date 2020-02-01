<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
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
	.reason {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	.reason th {
  		width: 20%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	.reason td {
  		width: 80%;
  		border-bottom: 1px solid #C5C5C5;
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
						<button onclick="location.href='researchApprovalWaitList.adminResearch'">미처리 목록</button>
						<button onclick="location.href='researchReferList.adminResearch'" id="clickBtn">반려 목록</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						반려 목록
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
				<th style="width: 20%;">처리일</th>
				<th style="width: 10%;">상세보기</th>
			</tr>
			<c:forEach var="research" items="${ researchReferList }">
				<tr class="tableContext">
					<td>${ research.researchNo }</td>
					<td>${ research.companyName }</td>
					<td>${ research.researchName }</td>
					<td><fmt:formatDate value="${ research.lastDate }"/></td>
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
	<div class="ui modal">
	  	<div class="header">기업명</div>
  		<div class="scrolling content">
  			<table class="reason">
					<tr>
						<th>프로젝트 명</th>
						<td></td>
					</tr>
					<tr>
						<th>목적</th>
						<td></td>
					</tr>
					<tr>
						<th>목표 인원</th>
						<td></td>
					</tr>
					<tr>
						<th>반려 사유</th>
						<td></td>
					</tr>
				</table>
  		</div>
  		<div class="actions">
		    <div class="ui cancel button">Close</div>
  		</div>
	</div>
		
	
	<script>
		$(document).on("click", ".detail", function(){
			researchNoStr = $(this).parent().siblings().eq(0).text();
			$.ajax({
				url:"researchReferDetail.adminResearch",
				type:"post",
				data:{researchNoStr:researchNoStr},
				success:function(data){
					console.log(data);
					
					var researchDetail = data.researchDetail[0];
					$(".reason").find("td").eq(0).text(researchDetail.researchName);
					$(".reason").find("td").eq(1).text(researchDetail.researchPerpose);
					$(".reason").find("td").eq(2).text(researchDetail.researchEngagementGoals + "명");
					$(".reason").find("td").eq(3).text(researchDetail.researchReferReason);
					
					$('.ui.modal').modal('show');
				},
				error:function(data){
					console.log(data);
				}
			});
			
		});
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(1)").addClass("on");
	</script>
</body>
</html>