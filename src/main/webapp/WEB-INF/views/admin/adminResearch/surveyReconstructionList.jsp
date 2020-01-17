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
  	.choiceInput {
  		width: 100px;
  	}
  	.ui.input {
  		margin-right: 5px;
  	}
  	#nextBtn, #nextBtn2 {
  		background: #00679A;
  		color: white;
  	}
  	#approvalBtn {
  		background: #00679A;
  		color: white;
  	}
  	#referBtn {
  		background: #C1332A;
  		color: white;
  	}
  	.add, .delete {
  		display:inline-block; 
  		width: 25px;
  	}
  	.add {
  		margin-right: 2px;
  	}
  	.add:hover, .delete:hover {
  		cursor: pointer;
  	}
  	#surveyQuizAccordion {
  		margin: 0 auto;
  		font-size: 13pt;
  	}
  	.surveyQuizTitle, .surveyQuizContext {
  		background: none;
  		border: none;
  		width: 80%;
  		
  	}
  	.surveyQuizTitle:focus, .surveyQuizContext:focus {
		outline: none;  		
  	}
  	#addQuiz {
  		width: 150px;
  		height: 50px;
  		font-size: 16pt;
  		text-align: center;
  		margin: 0 auto;
  		margin-top: 30px;
  	}
  	#addQuiz:hover {
  		cursor: pointer;
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
						<!-- <button onclick="location.href='researchWaitingPayment.admin'">협의중</button>
						<button onclick="location.href='researchConsultationCompleted.admin'">협의완료</button> -->
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						서베이 문항 재구성 대기 목록
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
				<th style="width: 30%;">리서치 제목</th>
				<th style="width: 10%;">최근작업일시</th>
				<th style="width: 15%;">상태</th>
				<th style="width: 15%;">재구성하기</th>
			</tr>
			<c:forEach var="i" begin="0" end="9">
				<tr class="tableContext">
					<td>리서치 번호</td>
					<td>기업명</td>
					<td>리서치 제목</td>
					<td>최근작업일시</td>
					<td>상태</td>
					<td><button class="detail">재구성하기</button></td>
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
		
	<div class="ui modal" id="research">
		<div class="header">리서치 제목</div>
		<div class="scrolling content">
			<div>
				<ul id="sortable">
					<li class="ui-state-default">Q1.
						<div class="choiceArea">
							<div class="choice">
								<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
							</div>
						</div>
					</li>
			  		<li class="ui-state-default">Q2.
						<div class="choiceArea">
							<div class="choice">
								<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
							</div>
						</div>
					</li>
			  		<li class="ui-state-default">Q3.
						<div class="choiceArea">
							<div class="choice">
								<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
							</div>
						</div>
					</li>
			  		<li class="ui-state-default">Q4.
						<div class="choiceArea">
							<div class="choice">
								<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
							</div>
						</div>
					</li>
			  		<li class="ui-state-default">Q5.
						<div class="choiceArea">
							<div class="choice">
								<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
							</div>
						</div>
					</li>
			  		<li class="ui-state-default">Q6.
						<div class="choiceArea">
							<div class="choice">
								<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
							</div>
						</div>
					</li>
			  		<li class="ui-state-default">Q7.
			  			<div class="choiceArea">
							<div class="choice">
								<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
							</div>
						</div>
			  		</li>
			  		<li class="ui-state-default">Q8.
				  		<div class="choiceArea">
							<div class="choice">
								<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
							</div>
						</div>
				  	</li>
				</ul>
				<hr>
				<div id="outbreak">
					<big style="font-weight: bold">돌발퀴즈</big>
					<div id="outbreakQuestion">
						문제
					</div>
					<div id="choice">
						보기
					</div>
				</div>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="nextBtn2">Next</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	<div class="ui modal" id="corp">
		<div class="header">기업 명</div>
		<div class="scrolling content">
			<div>
				<table id="corpTable">
					<tr>
						<th>프로젝트 명</th>
						<td>피자 선호도 조사</td>
					</tr>
					<tr>
						<th>목적</th>
						<td>우리 브랜드 피자 선호도는 얼마나 되는가 궁금한 점과 앞으로 나아갈 피자의 방향</td>
					</tr>
					<tr>
						<th>목표 인원</th>
						<td>200명</td>
					</tr>
					<tr>
						<th>조사 대상 성별</th>
						<td>전체</td>
					</tr>
					<tr>
						<th>조사 대상 연령</th>
						<td>20~29</td>
					</tr>
					<tr>
						<th>조사 대상 지역</th>
						<td>서울 및 수도권</td>
					</tr>
					<tr>
						<th>조사 예상 기간</th>
						<td>2020-01-20 ~ 2020-01-27</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="nextBtn">Next</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	
	<div class="ui modal" id="surveyQuiz">
		<div class="header">조사 대상자 퀴즈</div>
		<div class="scrolling content">
			<div>
				<div class="ui styled accordion" id="surveyQuizAccordion">
					<div class="title">
						<i class="dropdown icon"></i>
						<input type="text" placeholder="질문 작성" class="surveyQuizTitle">
					</div>
					<div class="content">
						<p class="transition hidden">
							<div class="choiceArea">
								<div class="choice">
									<div class="ui input">
	 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
								</div>
								<span class="add">
									<i class="plus circle icon"></i>
								</span><span class="delete"><i class="minus circle icon"></i></span>
								</div>
							</div>
						</p>
					</div>
				</div>
				<div>
					<div id="addQuiz">
						<i class="primary large plus circle icon"></i>질문  추가
					</div>
				</div>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="approvalBtn">Approve</div>
		    <div class="ui approve button" id="referBtn">Refer</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	<script>
		$("#addQuiz").on("click", function(){
			var $quiz = $("<div class='title'> <i class='dropdown icon'></i> <input type='text' placeholder='질문 작성' class='surveyQuizTitle'> </div> <div class='content'> <p class='transition hidden'> <div class='choiceArea'> <div class='choice'> <div class='ui input'> <input type='text' placeholder='보기 작성' class='choiceInput' value='보기'> </div> <span class='add'> <i class='plus circle icon'></i> </span> <span class='delete'> <i class='minus circle icon'></i> </span> </div> </div> </p> </div>")
			var $accordian = $("#surveyQuizAccordion");
			$accordian.append($quiz);
			
		});
		$(document).on("click", ".add", function(){
			var $choice = $("<div class='ui input'><input type='text' placeholder='보기 작성' class='choiceInput' value='보기'></div>");
			var $add = $("<span class='add'><i class='plus circle icon'></i></span>&nbsp;");
			var $delete = $("<span class='delete'><i class='minus circle icon'></i></span>");
			
			var $choiceDiv = $("<div class='choice'>");
			$choiceDiv.append($choice);
			$choiceDiv.append($add);
			$choiceDiv.append($delete);
			
			$(this).parent().parent().append($choiceDiv);
		});
		
		$('.ui.accordion').accordion();
		
		$(document).on("click", ".delete", function(){
			$(this).parent().remove();
		})
		$("#nextBtn").on("click", function(){
			$('#research').modal('show');
		});
		$("#nextBtn2").on("click", function(){
			$('#surveyQuiz').modal('show');
		});
		
		$(".detail").on("click", function(){
			var num = $(this).parent().siblings().eq(0).text();
			$('#corp').modal('show');
			//console.log(num);
		});
		$("#approvalBtn").on("click", function(){
			Swal.fire({
			  title: '정말 승인하시겠습니까?',
			  text: "이 결정은 되돌릴 수 없습니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
			    Swal.fire(
			      '승인!',
			      '이 리서치는 승인되었습니다.',
			      'success'
			    )
			  }else {
				  $('#research').modal('show');
			  }
			})
		});
		$("#referBtn").on("click", function(){
			const start = async function() {
				const { value: text } = await Swal.fire({
					  input: 'textarea',
					  inputPlaceholder: '반려 사유를 적어주세요..',
					  inputAttributes: {
					    'aria-label': 'Type your message here'
					  },
					  showCancelButton: true,
					  inputValidator: (value) => {
					    if (!value) {
					      return '반려 사유를 꼭 적어주세요!'
					    }
					  }
				});
	
				if (text) {
					Swal.fire({
					  title: '정말 반려하시겠습니까?',
					  text: "이 결정은 되돌릴 수 없습니다!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes'
					}).then((result) => {
					  if (result.value) {
						  Swal.fire(
				      		'반려!',
				      		'이 리서치는 반려되었습니다.',
				      		'success'
				    		)
					  }else {
						  $('#research').modal('show');
					  }
					})
				}
			}
			start();
		});
	
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(3)").addClass("on");
	</script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  		$(function() {
		 	$( "#sortable" ).sortable({
		 		placeholder: "ui-state-highlight"
		 	});
		 	$( "#sortable" ).disableSelection();
		 });
  	</script>
</body>
</html>