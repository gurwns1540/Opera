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
		height: 750px;
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
		background: #F1F1F1; 
		padding-top: 10px;
	}
	#editingMain{
		width: 100%;
		height: 100%;
		margin-top: 50px;
	}
	.editTable {
		width: 100%;
		height: 700px;
		margin: 70px auto;
		margin-top: 0;
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
  		background: none !important;
  		border-color: white !important;
  	}
  	.choiceNameInput:focus {
  		border: 0 !important;
  	}
  	.plusBtn {
		margin: 0 0px 12px 0px;
  		text-align: center;
	    font-size: 0.5em;
	    border-radius: 7px;
	    border: 1px solid #c5c5c5;
	    line-height: 60px;
	    background: #f6f6f6;
		right: 5px;
		bottom: 2px;
	    position: absolute;
	    padding-left: 4px;
	    cursor: pointer;
  	}
  	.plusMain {
  		z-index: 2;
  		position: absolute;
  		margin: 0 5px 12px 0px;
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
  		min-height: 80px;
  		position: relative;
  		border: 0 !important;
    	background: none !important;
  	}
  	#quizHead {
  		width: 100%;
  		height: 70px;
  		background: rgba(57, 42, 76, 0.54);
  		text-align: left;
  		padding-left: 40px; 
  		padding-right: 20px;
  		line-height: 67px;
    	font-size: 14pt;
    	color: #ECECEC;
  	}
  	#quizTable {
  		width: 80%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#quizTable th, #quizTable td {
  		border: 1px solid #9A9A9A;
  		height: 70px;
  	}
  	#mediaArea {
  		text-align: center;
  	}
  	#mediaAdd {
  		color: #900583;
  		text-decoration: underline;
  		font-weight: 600;
  		text-underline-position: under;
  		cursor: pointer;
  	}
  	#imageTable {
  		width: 90%;
  		margin: 0 auto;
  	}
  	#imageTable td {
  		height: 30px;
  		border: 0;
  	}
  	#imageArea {

  	}
  	#chioceArea {
  		width: 100%;
  		height:	300px;
  	}
  	.deleteQuiz {
  		cursor: pointer;
  	}
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar2.jsp"/>
	<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.userType ne '기업' }">
		<c:set var="msg" value="기업회원만 접근 가능합니다." scope="request"/>
		<jsp:forward page="/WEB-INF/views/common/errorPage.jsp"/>
	</c:if>
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
		<form action="" method="post">
			<table class="editTable">
				<tr>
					<td style="width: 20%">
						<input type="hidden" value="${ research }" name="research" id="research">
						<div id="editingTools">
							<div style="font-size: 20px; font-weight: bold;">문항 편집 도구</div>
							<div style="margin-top: 10px; border-bottom: 1px solid #9C9C9C; padding-bottom: 5px;">전체 <span id="quizAmount"></span>문항</div>
							<div style="color: #666666; font-size: 11px; text-align: left; margin: 10px auto; width: fit-content;">
								※ 각 문항 사이 [+]버튼을 통해 문항 추가가 가능합니다.<br>
								※ 아래 문항을 Drag & Drop하여 문항 순서를 <br>
								  이동할 수 있습니다.
							</div>
							<div style="width: 100%; overflow: auto; height: 500px;">
								<ul id="sortable">
									<li class="ui-state-default">
										<div class="plusBtn" style=" width: 30px; height: 40px;"><i class="plus icon"></i></div>
										<div class="plusMain">
											<div class="ui input" style="width: 85%;">
												<input type="text" readonly class="choiceNameInput" style="background: none; border: 0;" value="1">
											</div>
											<div style="width: fit-content; float: right;" class="deleteQuiz">
												<i class="large times icon"></i>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div style="width: 100%; background: #DEDEDE; border-top: 1px solid #9C9C9C; height: 53px; padding: 15px 10px;">
							</div>
						</div>
					</td>
					<td style="width: 60%">
						<div id="editingMain">
							<table id="quizTable">
								<tr>
									<th id="quizHead" colspan="3">
										<div>
											Q<span id="quizNum">1</span>.
											<div class="ui input" style="width: 85%;">
												<input type="text" class="quizTitle" style="background: none; border: 0;" placeholder="질문 제목">
											</div>
											<span style="float: right; font-size: 20pt;">
												<i class="times icon"></i>
											</span>
										</div>
									</th>
								</tr>
								<tr>
									<td colspan="3">
										<div id="mediaArea">
											설명 : 질문에 대한 설명 또는 이미지, 동영상이 필요한 경우 <span id="mediaAdd">여기를 클릭</span>해 주세요.
											
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<div id="chioceArea">
											<div style="width: fit-content; margin: 0 auto;"><i class="plus icon" style="color: #BD45B1; margin-top: 150px;"></i>우측 옵션패널에서 문항형식을 선택해주세요.</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="border: 0; width: 40%"><hr></td>
									<td style="border: 0; width: 20%"><div class="plusBtn2" style="margin: 0 auto; cursor:pointer; width: fit-content; font-size: 16pt;"><span style="color: #BD45B1"><i class="plus circle icon"></i></span>문항 추가</div></td>
									<td style="border: 0; width: 40%"><hr></td>
								</tr>
								<tr>
									<td colspan="3" style="border: 0;">
										<div style="float: right; width: 90px; height:40px; cursor: pointer; background: #600050; color: white; text-align: center; line-height: 37px;">완 료</div>
									</td>
								</tr>
							</table>
						</div>
					</td>
					<td style="width: 20%">
						<div id="editingOption">
							<div style="font-size: 20px; font-weight: bold;">문항 옵션 선택</div>
							<div style="margin-top: 10px; border-bottom: 1px solid #9C9C9C; padding-bottom: 5px;">문항 형식</div>
							
							<div class="ui vertical buttons">
								<button class="ui button">객관식</button>
								<button class="ui button">주관식</button>
								<button class="ui button">객관식 & 이미지</button>
								<button class="ui button">리커트 척도</button>
								<button class="ui button">숫자 합계형</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	<script>
		$(document).on("click", "#allCheck", function(){
			$('#allcheckBox').prop('checked',function(){
		        return !$(this).prop('checked');
		    });
			if($("#allcheckBox").prop("checked")){
	        	$(".deleteCheck").prop("checked",true);
	        }else{
	        	$(".deleteCheck").prop("checked",false);
	        }
		});
		$(".row li").on("click", function(){
			$(this).children("input[type=radio]").prop("checked", true);
			isChecked();
		})
		$(function(){
			isChecked();
			orderQuizAmount();
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
		
		$(document).on("click", ".deleteQuiz", function(){
			if($(".deleteQuiz").length == 1){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '문항은 최소 1개 이상이어야 합니다.',
				})
			}else {
				$(this).parent().parent().remove();
				index--;
			}
			orderQuizAmount();
			quizIndex();
		});
		
		$("#researchMenu td div").eq(1).addClass("on");
		$(".ui.dropdown").dropdown();
		
		var index = 2;
		
		$('#standard_calendar').calendar();
		$('#standard_calendar2').calendar();
		$(document).on("click", ".plusBtn", function(){
			
			var $quiz = $('<li class="ui-state-default"> <div class="plusBtn" style=" width: 30px; height: 40px;"><i class="plus icon"></i></div> <div class="plusMain"> <div class="ui input" style="width: 85%;"> <input type="text" readonly class="choiceNameInput" style="background: none; border: 0;" value="' + index++ + '"> </div> <div style="width: fit-content; float: right;" class="deleteQuiz"> <i class="large times icon"></i> </div> </div> </li>');
			$("#sortable").append($quiz);
			orderQuizAmount();
			quizIndex();
		});
		$(document).on("click", ".plusBtn2", function(){
			
			var $quiz = $('<li class="ui-state-default"> <div class="plusBtn" style=" width: 30px; height: 40px;"><i class="plus icon"></i></div> <div class="plusMain"> <div class="ui input" style="width: 85%;"> <input type="text" readonly class="choiceNameInput" style="background: none; border: 0;" value="' + index++ + '"> </div> <div style="width: fit-content; float: right;" class="deleteQuiz"> <i class="large times icon"></i> </div> </div> </li>');
			$("#sortable").append($quiz);
			orderQuizAmount();
			quizIndex();
		});
		
		$(document).on("click", "#mediaAdd", function(){
			var $image = $('<table style="width: 90%; border: 0;" id="imageTable"> <tr> <td colspan="2"> <div style="float: right;"> <button id="imageBtn"><i class="images outline icon"></i></button> <button id="videoBtn"><i class="video icon"></i></button> </div> </td> </tr> <tr> <td colspan="2"> <textarea style="width: 100%; height: 60px; resize: none; border-radius: 5px; padding: 7px;" placeholder="설명 글을 입력해주세요"></textarea> </td> </tr> <tr> <td style="text-align: left; width: 70%; vertical-align: top; padding-top: 20px;"> <input type="file" id="imageUpload" value="파일 선택"> <div style="font-size: 10pt; text-align: left; margin-left: 14%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </td> <td style="width: 30%;"> <div style="width: 100%; height: 110px; margin-bottom: 20px;" id="imageArea"><img src="resources/images/imageBackground.png" id="image" style="width: 100%; height:110px;"></div> </td> </tr> </table>');
			$("#mediaArea").html($image);
		});
		$(document).on("click", "#imageBtn", function(){
			var $image = $('<table style="width: 90%; border: 0;" id="imageTable"> <tr> <td colspan="2"> <div style="float: right;"> <button id="imageBtn"><i class="images outline icon"></i></button> <button id="videoBtn"><i class="video icon"></i></button> </div> </td> </tr> <tr> <td colspan="2"> <textarea style="width: 100%; height: 60px; resize: none; border-radius: 5px; padding: 7px;" placeholder="설명 글을 입력해주세요"></textarea> </td> </tr> <tr> <td style="text-align: left; width: 70%; vertical-align: top; padding-top: 20px;"> <input type="file" id="imageUpload" value="파일 선택"> <div style="font-size: 10pt; text-align: left; margin-left: 14%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </td> <td style="width: 30%;"> <div style="width: 100%; height: 110px; margin-bottom: 20px;" id="imageArea"><img src="resources/images/imageBackground.png" id="image" style="width: 100%; height:110px;"></div> </td> </tr> </table>');
			$("#mediaArea").html($image);
		});
		$(document).on("click", "#videoBtn", function(){
			var $video = $('<table style="width: 90%; border: 0;" id="imageTable"> <tr> <td> <div style="float: right;"> <button id="imageBtn"><i class="images outline icon"></i></button> <button id="videoBtn"><i class="video icon"></i></button> </div> </td> </tr> <tr> <td> <textarea style="width: 100%; height: 60px; resize: none; border-radius: 5px; padding: 7px;" placeholder="설명 글을 입력해주세요"></textarea> </td> </tr> <tr> <td style="text-align: left; width: 70%; vertical-align: top; padding-top: 20px; padding-bottom: 20px;"> <div class="ui labeled input"> <div class="ui label"> https:// </div> <input type="text" name="youtubeLink" placeholder="youtu.be/..."> </div><span style="font-size: 9pt; margin-left: 30px;">미풍양속을 해치는 동영상을 쓸 경우 큰 불이익을 당할 수 있습니다.</span></td> </tr> </table>');
			$("#mediaArea").html($video);
		});
		
		$(document).on("change", "#imageUpload", handleImgFileSelect);
		
		function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function (f) {
                if (!f.type.match("image.*")) {
                    alert("이미지 확장자 파일만 등록 가능합니다.");
                    return;
                }
                selFile = f;

                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#image").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
		
		function orderQuizAmount() {
			var num = $(".ui-state-default").length;
			$("#quizAmount").text(num);
		} 
		function quizIndex() {
			var index = 1;
			$(".ui-state-default").each(function(){
				$(this).find(".choiceNameInput").val(index++);
			});
		}
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			console.log($("#research").val());
		 	$( "#sortable" ).sortable({
		 		placeholder: "ui-state-highlight",
		 		update: function( event, ui ) {
		 			$(this).find(".choiceNameInput").each(function(index){
		 				$(this).val(index + 1);
		 			});
		 		}
		 	});
		 	$( "#sortable" ).disableSelection();
		 });
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