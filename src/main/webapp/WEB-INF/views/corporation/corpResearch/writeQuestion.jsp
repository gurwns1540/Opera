<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
	#requestMainArea {
		width: 100%;
		height: 800px;
	}
	#requestHeader {
		width: 100%;
		border-bottom: 1px solid black;
		font-size: 20px;
		height: 50px;
		color: #A0A0A0;
		margin: 0 auto;
		
	}
	#requestHeaderTable {
	 width: fit-content;
	 text-align: center;
	 margin: 0 auto;
	 line-height: 42px;
	 margin-top: 15px;
	}
	#requestHeaderTable td {
		padding-left: 60px;
		padding-right: 60px;
	}
	.onMenu{
		color: black;
		border-bottom: 2px solid black;
	}
	button:hover{
		cursor: pointer;
	}
	#editingTools{
		float: left;
		width: 80%;
		height: 100%;
		border: 1px solid black;
		background: #F1F1F1; 
		padding-top: 10px;
	}
	#editingTools div, #editingOption div{
		width: 100%;
		text-align: center;
	}
	#editingOption{
		float: right;
		width: 80%;
		height: 100%;
		border: 1px solid black;
		background: #F1F1F1; 
		padding-top: 10px;
	}
	#editingMain{
		width: 100%;
		height: 100%;
		border: 1px solid black;
	}
	#editTable {
		width: 100%;
		height: 700px;
		margin: 50px auto;
	}
	#sortable { 
  		list-style-type: none; 
  		margin: 0; 
  		padding: 0; 
  		width: 90%;
  		margin: 0 auto; 
  		margin-bottom: 30px;
  	}
  	#sortable li { 

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
  	.choiceNameInput:focus {
  		border: 0 !important;
  	}
  	.plusBtn {
  		margin: 0 5px 12px 5px;
  		text-align: center;
	    font-size: 0.5em;
	    border-radius: 7px;
	    border: 1px solid #c5c5c5;
	    line-height: 60px;
	    background: #f6f6f6;
		right: 0;
		bottom: 23px; 
	    position: absolute;
	    padding-left: 4px;
  	}
  	.plusMain {
  		z-index: 2;
  		position: absolute;
  		margin: 0 5px 12px 5px;
  		padding: 10px; 
  		font-size: 0.8em;
  		height: fit-content;
  		border-radius: 7px !important;
	    background: #f6f6f6;
	    border: 1px solid #c5c5c5;
    	background: #f6f6f6;
    	font-weight: normal;
    	color: #454545;
  	}
  	.ui-state-default {
  		min-height: 100px;
  		position: relative;
  		border: 0 !important;
    	background: none !important;
  	}
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar2.jsp"/>
	<div id="requestMainArea">
		<div id="requestHeader">
			<table id="requestHeaderTable">
				<tr>
					<td>
						<div>01. 기본정보</div>
					</td>
					<td>
						<div class="onMenu">02. 설문작성</div>
					</td>
				</tr>
			</table>
		</div>
		<table id="editTable">
			<tr>
				<td style="width: 20%">
					<div id="editingTools">
						<div style="font-size: 20px; font-weight: bold;">문항 편집 도구</div>
						<div style="margin-top: 10px; margin-bottom: 20px; border-bottom: 1px solid #9C9C9C; padding-bottom: 5px;">전체 <span></span>문항</div>
						<ul id="sortable">
							<li class="ui-state-default">
								<div class="plusBtn" style=" width: 30px; height: 40px;"><i class="plus icon"></i></div>
								<div class="plusMain">
									<div class="ui input" style="width: 85%;">
										<input type="text" readonly class="choiceNameInput" style="background: none; border: 0;">
									</div>
									<div style="width: fit-content; float: right;" id="deleteQuiz">
										<i class="large times icon"></i>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</td>
				<td style="width: 60%">
					<div id="editingMain">
			
					</div>
				</td>
				<td style="width: 20%">
					<div id="editingOption">
			
					</div>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	<script>
		$(".row li").on("click", function(){
			$(this).children("input[type=radio]").prop("checked", true);
			isChecked();
		})
		$(function(){
			isChecked();
		})
		function isChecked() {
			$("input[type=radio]").each(function(){
				if($(this).prop("checked")){
					$(this).parent().css({"background":"#00679A", "color":"white"});
					if($(this).prop("id") == "all"){
						$("#genderText").text("전체");
					}
					else if($(this).prop("id") == "male"){
						$("#genderText").text("남성");
					}
					else if($(this).prop("id") == "female"){
						$("#genderText").text("여성");
					}
					if($("#config").prop("checked")){
						console.log("gkgk");
						$("#rangeAge").css("display", "inline-block");
					}else {
						$("#rangeAge").css("display", "none");
					}
				}else {
					$(this).parent().css({"background":"#E7E7E7", "color":"#aaa"});
				}
			});
		}
		
		$("#researchMenu td div").eq(1).addClass("on");
		$(".ui.dropdown").dropdown();
		
		$('#standard_calendar').calendar();
		$('#standard_calendar2').calendar();
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$( function() {
	    	$( "#slider-range" ).slider({
	      		range: true,
	     		min: 20,
	      		max: 60,
	      		values: [ 20, 30 ],
	      		slide: function( event, ui ) {
	        		$( "#amount" ).text(ui.values[ 0 ] + "세 이상 " + ui.values[ 1 ] + "세 이하" );
	      		}
	    	});
	    	$( "#amount" ).text($( "#slider-range" ).slider( "values", 0 ) + "세 이상   " + $( "#slider-range" ).slider( "values", 1 ) + "세 이하");
	  	});
		$(document).on("click", "#plusBtn", function(){
			var $quiz = $('<li class="ui-state-default"> <div class="plusBtn" style=" width: 30px; height: 40px;"><i class="plus icon"></i></div> <div class="plusMain"> <div class="ui input" style="width: 85%;"> <input type="text" readonly class="choiceNameInput" style="background: none; border: 0;"> </div> <div style="width: fit-content; float: right;" id="deleteQuiz"> <i class="large times icon"></i> </div> </div> </li>');
			$("#sortable").append($quiz);
		});
  </script>
</body>
</html>