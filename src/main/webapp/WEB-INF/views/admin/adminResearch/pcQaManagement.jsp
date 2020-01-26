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
  	
  	#excla{
  		text-align: center;
  		border-bottom: 1px solid lightgray;
  		border-top:1px solid lightgray;
  		line-height: 40px;
  		height: 40px;
  	}
  	
  	#explain{
  		text-align: center;
  	
  	}
  	
  	#segmentTwo{
  		border: 1px solid #75BCC9 !important;
  		width:60%;
  		margin: 0 auto;
  	}
  	
  	#uploadAudio{
  		width:70px;
  		height:30px;
  		 
  		
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
						<select class="ui dropdown" >
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
 							 		<input type="submit" value="업로드" id="uploadAudio" style="background: #00679A; color: white; border:0;">
								</div>
															
								<div style="text-align: center; margin: 50px auto;">
										위 아이콘을 눌렀을때 나오는 소리는 무엇입니까?	
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
	</div>
	<script>
		$(".ui.dropdown").dropdown();
		
		
	</script>
	
</body>
</html>