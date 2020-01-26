<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  	#box{
  		width: 100%;
  		height: auto;
  		
  	}
  	
  	.ui.dropdown{
  		float: right;
  		text-align: center !important;
  		min-width: 100px !important;
  	}
  	
  	#pcQaTable{
  		width:100%;
  	}
  	
  	#excla, #segmentVideo{
  		text-align: center;
  		border-bottom: 1px solid lightgray;
  		border-top:1px solid lightgray;
  		line-height: 40px;
  	}
  	
  	#explain{
  		text-align: center;
  	
  	}
  	
  	#segmentTwo, #segmentVideo{
  		border: 1px solid #75BCC9 !important;
  		width:60%;
  		margin: 0 auto;
  	}
  	
  	#uploadAudio,#uploadVideo{
  		width:70px;
  		height:30px;
  		 
  		
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
  	#choice, .choice {
  		margin: 0 auto;
  		margin-top: 20px;
  		width: fit-content;
  		display: inline-block;
  	}
  	.choiceInput {
  		width: 100px;
  	}
  	.choiceArr {
  		width: fit-content;
  		margin: 0 auto;
  		margin-bottom: 30px;
  	}
  	
  	.ui.input{
  		margin-bottom: 10%;
  	}
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<div class="ui segment" id="box">
			<table id="pcQaTable">
				<tr>
					<td><div id="adminTitle">패널 pc환경조사 질문관리</div></td>
				</tr>
				<tr>
					<td>
						<select class="ui dropdown" id="choose">
							<option value="">음성/영상</option>
							<option value="1" selected="selected">음성</option>
							<option value="0">영상</option>
						</select>
					</td>
				</tr>

				

			</table>
			
			
			<div>
				<table style="width: 100%; ">
					<tr>
						<td >
							<div id="excla">
								<i class="exclamation triangle icon"></i>멀티미디어 환경조사 입니다.
							</div>
						</td>
					
					</tr>
					<tr>
						<td id="explain">
							본 조사는 멀티미디어 환경 이용이 가능한 패널만 조사 참여가 가능합니다.
						</td>
					
					</tr>
					
					
					<tr>
						<td>
							<div class="ui segment" id="segmentTwo">
							<div style="margin: 0 auto; width: fit-content;">
 							 	<div style="width: fit-content; height: 50%; margin: 0 auto; font-size: 19em; line-height: 260px; display: inline-block;"><i class="volume up icon"></i></div>
 							 		<input type="button" value="업로드" id="uploadAudio" style="background: #00679A; color: white; border:0;">
 							 		<input type="file" id="audioFile" value="허현주" style="display:none">
								</div>
															
								<div style="text-align: center; margin: 50px auto;">
										위 아이콘을 눌렀을때 나오는 소리는 무엇입니까?	
								</div>							
								
								<div class="choiceArr">
									<div class="choice">
										<div class="ui input">
			 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
										</div>
										<span class="add">
											<i class="plus circle icon"></i>
										</span><span class="delete"><i class="minus circle icon"></i></span>
									</div>
								</div>
								
								<div  id="saveAudio" style="text-align: center; ">
									<input type="button" style="width: 100px; height: 40px; border: 0; background: #00679A; color: white;" value="저장하기" >
								</div>
							</div>
						
						</td>
						
						
					</tr>
					
					<tr>
						<td>
							<div class="ui segment" id="segmentVideo" >
								<div style="margin: 0 auto; width: fit-content;">
 							 	<div style="width: fit-content; height: 50%; margin: 0 auto; font-size: 19em; line-height: 260px;   margin-top: 10%;"><i class="play icon"></i></div>
									<div class="ui labeled input" style="margin:0; margin-top: 10px;">
										<div class="ui label">https://</div>
										<input type="text" placeholder="mysite.com">
									</div>
								</div>
								<div style="text-align: center; margin: 30px auto; margin-bottom: 10px;">
										다음은 무슨 품목의 광고 입니까?	
								</div>							
								
								<div class="choiceArr">
									<div class="choice">
										<div class="ui input">
			 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="보기">
										</div>
										<span class="add">
											<i class="plus circle icon"></i>
										</span><span class="delete"><i class="minus circle icon"></i></span>
									</div>
								</div>
								<div  id="saveAudio" style="text-align: center; ">
									<input type="button" style="width: 100px; height: 40px; border: 0; background: #00679A; color: white;" value="저장하기" >
								</div>
							</div>
								
																
						
						</td>
						
					</tr>
					
					
				</table>
			</div>
			
		
		
		  <p></p>
		</div>
	</div>0
	<script>
		$(".ui.dropdown").dropdown();
		
		$(function(){
			$("#segmentVideo").hide();
		})
		
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
		$(document).on("click", ".delete", function(){
			$(this).parent().remove();
		})
		
		$(document).on("click", "#uploadAudio", function(){
			$("#audioFile").click();
		})
		
		$(document).on("change", "#choose", function(){
			if($(this).val() == "1"){
				$("#segmentVideo").hide();
				$("#segmentTwo").show();
			}else if($(this).val() == "0"){
				$("#segmentTwo").hide();
				$("#segmentVideo").show();
			}
		})
		
	</script>
	
</body>
</html>