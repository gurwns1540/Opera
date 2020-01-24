<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#approvalBtnArea {
		position: relative;
		right: 10px;
		height: 30px;
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
  	#sortable { 
  		list-style-type: none; 
  		margin: 0; 
  		padding: 0; 
  		width: 60%;
  		margin: 0 auto; 
  		margin-bottom: 30px;
  	}
  	#sortable li { 
  		margin: 0 5px 12px 5px;
  		padding: 10px; 
  		font-size: 1.2em; 
  		height: fit-content;
  		border-radius: 7px;
  	}
 	html>body #sortable li { 
	  	height: fit-content;
	  	line-height: 1.2em; 
	}
  	.ui-state-highlight { 
  		height: 3.5em; 
  		line-height: 1.2em; 
  	}
  	.ui-sortable-placeholder {
  		background: white !important;
  		border-color: white !important;
  	}
  	#outbreak {
  		margin: 20px auto;
  		width: 70%;
  		height: 10%;
  		border-radius: 7px;
  		border: 1px solid #C5C5C5;
  		background: #F6F6F6;
  		padding: 15px;
  		margin-top: 30px;
  	}
  	#choice, .choice {
  		margin: 0 auto;
  		margin-top: 20px;
  		width: fit-content;
  	}
  	#corpTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#corpTable th {
  		width: 20%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#corpTable td {
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
						<button onclick="location.href='manageCashoutApplication.admin'" id="clickBtn">신청 목록</button>
						<button onclick="location.href='manageCashoutComplete.admin'">완료 목록</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						리워드 캐시아웃 신청 관리
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
				<th id="allCheck" style="width: 5%">전체 체크<br><input type="checkbox" id="allCheckMailing" style="display: none;"></th>
				<th style="width: 10%;">패널번호</th>
				<th style="width: 20%;">캐시아웃 신청 금액</th>
				<th style="width: 30%;">신청 계좌</th>
				<th style="width: 15%;">신청일</th>
				<th style="width: 20%;">개별 캐시아웃</th>
			</tr>
			<c:forEach var="pr" items="${panelRewardHistoryList}">
				<tr class="tableContext">
					<td><input type="checkbox" class="checkPoorMailing"></td>
					<td>${ pr.mno }</td>
					<td>${ pr.cashoutAmount }<i class="won sign icon"></i></td>
					<td>${ pr.account }</td>
					<td>${ pr.applicantDate }</td>
					<td><button class="detail">캐시아웃</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8"><input type="button" value="캐시아웃" id="cashOut"></td>
			</tr>
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
		
	
	<script>
		$("#cashOut").on("click", function(){
			Swal.fire({
			  	title: '캐시아웃 처리를 하시겠습니까?',
			  	text: "이 결정은 되돌릴 수 없습니다!",
			  	icon: 'warning',
			  	showCancelButton: true,
			  	confirmButtonColor: '#3085d6',
			  	cancelButtonColor: '#d33',
			  	confirmButtonText: 'Yes'
			}).then((result) => {
			  	if (result.value) {
			  		Swal.fire(
						'캐시아웃 처리 완료!',
						'해당 회원에 대한 캐시아웃처리를 하였습니다.',
						'success'
					)
			  }
			})
		});
		$(".detail").on("click", function(){
			var num = $(this).parent().siblings().eq(0).text();
			Swal.fire({
			  	title: '캐시아웃 처리를 하시겠습니까?',
			  	text: "이 결정은 되돌릴 수 없습니다!",
			  	icon: 'warning',
			  	showCancelButton: true,
			  	confirmButtonColor: '#3085d6',
			  	cancelButtonColor: '#d33',
			  	confirmButtonText: 'Yes'
			}).then((result) => {
			  	if (result.value) {
			  		Swal.fire(
						'캐시아웃 처리 완료!',
						'해당 회원에 대한 캐시아웃처리를 하였습니다.',
						'success'
					)
			  }
			})
		});
		$(document).on("click", "#allCheck", function(){
			$('#allCheckMailing').prop('checked',function(){
		        return !$(this).prop('checked');
		    });
			if($("#allCheckMailing").prop("checked")){
	        	$(".checkPoorMailing").prop("checked",true);
	        }else{
	        	$(".checkPoorMailing").prop("checked",false);
	        }
		});
		$(".topMenu:nth-child(3)").addClass("active");
		$(".topMenu:nth-child(3)").find(".innerMenu:nth-child(2)").addClass("on");
	</script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  		/* $(function() {
		 	$( "#sortable" ).sortable({
		 		placeholder: "ui-state-highlight"
		 	});
		 	$( "#sortable" ).disableSelection();
		 }); */
  	</script>
</body>
</html>