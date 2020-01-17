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
		height: 30px;
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
	
	
	#complitedTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#complitedTable th {
  		width: 20%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#complitedTable td {
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
						
					<!-- 	<button>결과 전송 목록</button>				 -->		
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						완료된 리서치 목록
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
				<th style="width: 20%;">리서치번호</th>
				<th style="width: 20%;">기업명</th> 
				<th style="width: 30%;">리서치제목</th>
				<th style="width: 15%;">리서치마감일</th>
				<th style="width: 15%;">상세보기</th>
			</tr>
			<c:forEach var="i" begin="0" end="9">
				<tr class="tableContext">
					<td>리서치번호</td>
					<td>기업명</td>
					<td>리서치제목</td>
					<td>리서치마감일</td>
					<td><button class="detail">상세보기</button></td>
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
		
	
	<div class="ui modal" id="complited">
		<div class="header">리서치 상세이력</div>
		
		<div class="scrolling content">
			<div>
				<table id="complitedTable" >
					<tr>
						<th>번호: </th>
						<td colspan="3">1</td>
					</tr>
					<tr>
						<th>리서치명: </th>
						<td colspan="3">소비자 브랜드 인지도 조사</td>
					</tr>
					<tr>
						<th style="width:10%">신청자</th>
						<td style="width:40%">A기업</td>
						<th style="width:10%">날짜: </th>
						<td style="width:40%">2019-12-31</td>
					</tr>
					<tr>
						<th style="width:10%">상태: </th>
						<td style="width:40%">완료</td>
						<th style="width:10%">사유:</th>
						<td style="width:40%"></td>						
						
					
					</tr>						
					<tr>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">close</div>
  		</div>		
	
	</div>		
		
	
	<script>
		$(".detail").on("click",function(){
			var num =$(this).parent().siblings().eq(0).text();
			$('#complited').modal('show');
		});
	
	
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(8)").addClass("on");
	</script>
</body>
</html>