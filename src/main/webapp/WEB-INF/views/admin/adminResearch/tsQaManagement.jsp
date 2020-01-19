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
	#sortable { 
  		list-style-type: none; 
  		margin: 0; 
  		padding: 0; 
  		width: 50%;
  		margin: 0 auto; 
  		margin-bottom: 30px;
  	}
  	#sortable li { 
  		margin: 0 5px 12px 5px;
  		padding: 10px; 
  		font-size: 0.8em;
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
  	#choice, .choice {
  		margin: 0 auto;
  		margin-top: 20px;
  		width: fit-content;
  	}
  	.choiceInput {
  		width: 100px;
  	}
  	.choiceNameInput {
  		width: 100% !important;
  		background: none !important;
  		border: 0 !important;
  	}
  	.ui.input {
  		margin-right: 5px;
  	}
  	#addQuiz {
  		width: 150px;
  		height: 50px;
  		font-size: 13pt;
  		text-align: center;
  		margin: 0 auto;
  		margin-top: 30px;
  	}
  	#addQuiz:hover, #deleteQuiz:hover {
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
						<button id="editTsComplete">상태 저장</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						TS질문관리
					</div>
				</td>
			</tr>
		</table>
		<ul id="sortable">
			<li class="ui-state-default">
				<div>
					<div class="ui input" style="width: 85%;">
						<input type="text" placeholder="문항 작성" class="choiceNameInput">
					</div>
					<div style="width: fit-content; float: right;" id="deleteQuiz">
						<i class="large times icon"></i>
					</div>
				</div>
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
		<div>
			<div id="addQuiz">
				<i class="primary large plus circle icon"></i>질문  추가
			</div>
		</div>
	</div>

	<script>
		$("#addQuiz").on("click", function(){
			var $quiz = $('<li class="ui-state-default"> <div><div class="ui input" style="width: 85%;"> <input type="text" placeholder="문항 작성" class="choiceNameInput"> </div> <div style="width: fit-content; float: right;" id="deleteQuiz"> <i class="large times icon"></i> </div> </div> <div class="choiceArea"> <div class="choice"> <div class="ui input"> <input type="text" placeholder="보기 작성" class="choiceInput" value="보기"> </div> <span class="add"> <i class="plus circle icon"></i> </span><span class="delete"><i class="minus circle icon"></i></span> </div> </div> </li>')
			var $accordian = $("#sortable");
			$accordian.append($quiz);
		});
		$(document).on("click", "#deleteQuiz", function(){
			$(this).parent().parent().remove();
		});
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(9)").addClass("on");
	</script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  		$("#editTsComplete").on("click", function(){
			//에이작스로 저장
  		});
  		$(function(){
		 	$( "#sortable" ).sortable({
		 		placeholder: "ui-state-highlight"
		 	});
		 	$( "#sortable" ).disableSelection();
		});
  	</script>
</body>
</html>