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
	#requestTable {
		width: 50%;
		margin: 10px auto;
		font-size: 18px;
		font-weight: bold;
		text-align: left;
		border-spacing: 0;
		border-collapse: collapse;
	}
	#requestTable td {
		font-size: 12px;
		font-weight: normal;
		border-bottom: 1px solid #C5C5C5;
	}
	#requestTable td.link {
		width: 15px !important;
	}
	#requestTable th {
		height: 70px;
		width: 20%;
		border-bottom: 1px solid #C5C5C5;
	}
	.ui.input {
		width: 100%;
		height: 40px;
	}
	.menu.transition.visible {
		height: auto;
	}
	button:focus {
		outline: none;
	}
	.row {
		float: left;
	}
	ul {
	  list-style: none;
	  margin: 0;
	  padding: 0;
	  display: inline-block;
	}
	
	li {
	  position: relative;
	  float: left;
	  margin-right: 20px;
	  width: 100px;
	  height: 40px;
 	  background: #E7E7E7;
 	  text-align: center;
 	  line-height: 40px;
	}
	
	li label {
	  position: relative;
	  width: 100px;
	  height: 40px;
	  margin-left: 10px;
	  margin-right: 10px;
	  color: #aaa;
	  font-weight: 600;
	  cursor: pointer;
	  z-index: 1;
	}
	
	input[type="radio"] {
	  position: absolute;
	  visibility: hidden;
	}
	
	input[type="radio"]:checked ~ label {
	  color: white;
	}
	li:hover {
		cursor: pointer;
	}
	#standard_calendar, #standard_calendar2 {
		width: 35%;
	}
	.ui.calendar .ui.table tr td, .ui.calendar .ui.table tr th {
	    padding: 1em !important;
	    padding-top: 0.5em !important;
	    padding-bottom: 0.5em !important;
	    
	    white-space: nowrap;
	}
	.ui.calendar .ui.table.day tr:nth-child(2) th {
	    padding-top: 0 !important;
	    padding-bottom: 0 !important;
	    height: 35px !important;
	}
	.ui.calendar .ui.table.day tr:first-child th {
    	border: none;
    	padding-top: 0 !important;
    	padding-bottom: 0 !important;
    	height: 35px !important;
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
						<div class="onMenu">01. 기본정보</div>
					</td>
					<td>
						<div>02. 설문작성</div>
					</td>
				</tr>
			</table>
		</div>
		<table id="requestTable">
			<tr>
				<th>프로젝트 제목</th>
				<td>
					<div class="ui input">
						<input type="text" placeholder="프로젝트 제목을 입력해주세요">
					</div>
				</td>
			</tr>
			<tr>
				<th>목표 인원</th>
				<td>
					<select class="ui dropdown">
						<option value="">Number of people</option>
						<option value="100">100명</option>
						<option value="200">200명</option>
						<option value="200">300명</option>
						<option value="200">400명</option>
						<option value="200">500명</option>
					</select>
					
					<span style="font-size: 10px; margin-left: 20px; color: #646464;">(*예상완료시간이 지나도 목표인원이 채워져야 투표가 종료됩니다.)</span>
					<button id="expectCost" style="background: #00679A; color: white; border: 0; width: 70px; height: 25px; margin-left: 20px;">예상 비용</button>
				</td>
			</tr>
			<tr>
				<th rowspan="2">기본 설정</th>
				<td style="padding-bottom: 10px; padding-top: 10px; border-bottom: 0;">
					<div class="row">
						<ul>
							<li>
								<input type="radio" id="all" name="gender" checked>
								<label for="all">설정 안함</label>
							</li>
							<li>
								<input type="radio" id="female" name="gender">
								<label for="female">여성</label>
							</li>
							<li>
								<input type="radio" id="male" name="gender">
								<label for="male">남성</label>
							</li>
						</ul>
					</div>
					<div id="genderText" style="float: right; line-height: 40px; margin-right: 30px; color: #425DA1; font-size: 13px; font-weight: bold;"></div> 
				</td>
			</tr>
			<tr>
				<td style="padding-top: 10px; padding-bottom: 10px;">
					<div class="row">
						<ul>
							<li>
								<input type="radio" id="all" name="age" checked>
								<label for="all">설정 안함</label>
							</li>
							<li>
								<input type="radio" id="config" name="age">
								<label for="config">연령 설정</label>
							</li>
						</ul>
					</div>
					<div id="rangeAge" style="display: none;">
						<div style="display: inline-block; float: right; padding-top: 10px; margin-left: 68px;">
							<p>
							  <span id="amount" style="border:0; color:#00679A; font-weight:bold;"></span>
							</p>
						</div>
						<div style="display: inline-block; float: right; padding-top: 10px; margin-left: 40px;">
							<div id="slider-range" style="display: inline-block; width: 150px;"></div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<div class="row">
						<ul>
							<li>
								<input type="radio" id="all" name="age" checked>
								<label for="all">설정 안함</label>
							</li>
							<li style="width: 150px;">
								<input type="radio" id="metropolitan" name="age">
								<label for="metropolitan">서울 및 수도권</label>
							</li>
							<li style="width: 200px;">
								<input type="radio" id="city" name="age">
								<label for="city">서울, 경기 및 9대 광역시</label>
							</li>
						</ul>
					</div>
				</td>
			</tr>
			<tr>
				<th>조사 시작 기간</th>
				<td>
					<div class="ui calendar" id="standard_calendar">
						<div class="ui input left icon">
							<i class="calendar icon"></i>
							<input type="text" name="startDate" placeholder="Date/Time">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>예상 완료 시간</th>
				<td>
					<div class="ui calendar" id="standard_calendar2">
						<div class="ui input left icon">
							<i class="calendar icon"></i>
							<input type="text" name="endDate" placeholder="Date/Time">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button style="float:left;">목록</button><button style="float:right;">저장</button>
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
  </script>
</body>
</html>