<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
</head>
<style>

div.ui.right.attached.rail {
	width: 200px !important;
	height:auto;
	display: inline-block;
	border-radius: 0px;
	padding-top: 0px;
	
}

div.ui.segment {
	position: relative;
	background: #fff;
	-webkit-box-shadow: 0 1px 2px 0 rgba(34, 36, 38, .15);
	box-shadow: 0 1px 2px 0 rgba(34, 36, 38, .15);
	margin: 1rem 0;
	padding: 1em 1em;
	border-radius: 0px;
	border: 1px solid rgba(34, 36, 38, .15);
	height: inherit;
}

div.ui.segment.leftArea {
	position: relative;
	background: white;
	-webkit-box-shadow: 0;
	box-shadow: 0 1px 2px 0 white;
	margin: 1rem 0;
	padding: 1em 1em;
	padding-left:0px;
	padding-right:0px;
	border-radius: 0px;
	border: 1px solid white;
	height: inherit;
	margin-right:-30px;
	height:58%;
}

#firstWing {
	height: 50px;
	-webkit-box-shadow: 0;
	box-shadow: 0 1px 2px 0 white;
	border: 1px solid white;
	padding: 0px;
	/*position:fixed;*/
	/* top:204px; */
}

#secondWing {
	height: 37px;
	-webkit-box-shadow: 0;
	box-shadow: 0 1px 2px 0 white;
	border: 1px solid white;
	padding: 0px;
	/* position:fixed;
	top:250px; */
}
#thirdWing {
	height: 75px;
	width:inherit;
	/* position:fixed;
	top:298px; */
}
#fourthWing {
	height: 235px;
	width: inherit;
	padding: 13px;
	/* position:fixed;
	top:384px; */
	background-color:white;
}
#fifthWing {
	height: 30px;
	-webkit-box-shadow: 0;
	box-shadow: 0 1px 2px 0 white;
	border: 1px solid white;
	padding: 0px;
	/* position:fixed;
	top:627px; */
}
#uploadBtn {
	background-color: #00679A;
	width: 200px;
	height: inherit;
	color: white;
	border: none;
	cursor: pointer;
	font-size:11pt;
}
#mySurveyBtn {
	background-color: #A0A0A0;
	width: 200px;
	height: inherit;
	color: white;
	border: none;
	cursor: pointer;
	font-size:10pt;
}
#voteBtn {
	background-color: #CC3399;
	width: 150px;
	height: 40px;
	color: white;
	border: none;
	cursor: pointer;
	font-size:0.9vw;
}
#searchInput, .ui.action.input {
	width: 160px;
	height: 37px;
	font-size: 11pt;
}
div.ui.segment.eachSurveyBox {
	background-color:#F2F2F4;
	padding:8px;
	cursor:pointer;
}
.ui.basic.button,.ui.toggle.button {
	height: 20px;
	width: 80px;
	font-size:0.5vw;
	background-color:white;
	box-shadow:0 0 0 1px rgba(34,36,38,.15) inset;
}
.ui.basic.button:hover,.ui.toggle.button:hover {
	box-shadow:0 0 0 1px #CC3399 inset;
}
.ui.button.toggle.active {
	background-color:#CC3399 !important;
}
</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp"%>
		<section class="container">
			<br />

			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">패널서베이</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="surveyList.panel">서베이</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">패널서베이</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>


			<div class="ui segment leftArea">
				<div style="padding-right: 3%; height: auto; margin-bottom: 100px;">
					<!-- 서베이 보기에 사진이 있는 경우 -->
					<div class="eachPanelSurvey ui segment" style="width:90%; margin:0 auto; margin-bottom:70px;">
						<div class="surveyTitleArea">
							<table style="width:100%;">
								<tr>
									<td style="padding-left:0px;">
										<img src="resources/images/q.png" alt="" class="icon" style="width:40px; height:40px;">
									</td>
									<td style="vertical-align:top;">
										<span style="font-size:1vw; font-weight:bold; color:#2B2B2B; padding-left:5px;">수도권에서 가장 가까운 바다, 강화도의 여행지 중 여러분이 가보고 싶은 곳은 어디인가요? </span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:right;">
										<span style="font-size:0.8vw; font-weight:bold; margin-right:10px; color:#008499;">카테고리 : </span>
										<span style="font-size:0.8vw; font-weight:bold;">여행 / 레저</span>
									</td>
								</tr>
							</table>
						</div>
						<hr>
						<div class="surveyDescriptionArea">
							<table style="width:100%;">
								<tr>
									<td>
										<textarea style="height:130px; width:100%; border:1px solid white;font-size:0.9vw; resize:none; line-height:150%;" readonly>
수도권에서 가장 가까운 바다로 손꼽히는 강화도. 도심과 근접한 위치로 당일치기 여행으로도 제격인 강화도는 산이나 사찰, 바다를 중심으로 볼거리가 한 가득이라고 하는데요. :)
‘호텔스닷컴’에서 선정한 강화도에서 가볼 만한 곳들 중, 여러분이 가보고 싶은 여행지는 어디인가요?
											</textarea>
										</td>
									</tr>
									<tr>
										<td style="text-align:right;">
										<span style="font-size:0.75vw; font-weight:bold; color:#717171;">최소 1개에서 최대 10개 선택</span>
									</td>
								</tr>
							</table>
						</div>
						<hr>
						<div class="choiceArea">
							<div class="ui four column grid" id="surveyListArea" style="width: inherit; margin: 0 auto;">
								<c:forEach var="no" begin="1" end="10" step="1">
									<div class="column">
										<div class="ui segment eachSurveyBox">
											<div class="eachBox" style="height:200px;">
												<div class="imgArea" style="height:80%; width:100%; margin:0 auto;">
													<img src="resources/images/img${ no }.png" style="height:100%; width:100%;">
												</div>
												<div class="choiceNameArea" style="padding-top:10px;">
													<div class="ui checked checkbox" style="margin-bottom: 9px;">
														<input type="checkBox" name="interests" class="choiceBox" id="choice${ no }" value="choice${ no }">
														<label for="choice${ no }" style="cursor: pointer;"> 보기 ${ no }</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="bottomArea" style="margin-top:30px;">
							<table style="width:100%;">
								<tr>
									<td>
										<button class="ui toggle button">
											<i class="heart outline icon"></i> 좋아요
											</button>
										<button class="ui basic button" id="commentBtn">
											<i class="comment dots outline icon"></i> 댓글
										</button>
										<button class="ui basic button" id="reportBtn">
											<i class="bell outline icon"></i> 신고
										</button>
									</td>
									<td style="text-align:right;">
										<button id="voteBtn">투표하기</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					
					<!-- 서베이 보기에 사진이 없는 경우 -->
					<div class="eachPanelSurvey ui segment" style="width:90%; margin:0 auto; margin-bottom:70px;">
						<div class="surveyTitleArea">
							<table style="width:100%;">
								<tr>
									<td style="padding-left:0px;">
										<img src="resources/images/q.png" alt="" class="icon" style="width:40px; height:40px;">
									</td>
									<td style="vertical-align:top;">
										<span style="font-size:1vw; font-weight:bold; color:#2B2B2B; padding-left:5px;">수도권에서 가장 가까운 바다, 강화도의 여행지 중 여러분이 가보고 싶은 곳은 어디인가요? </span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:right;">
										<span style="font-size:0.8vw; font-weight:bold; margin-right:10px; color:#008499;">카테고리 : </span>
										<span style="font-size:0.8vw; font-weight:bold;">여행 / 레저</span>
									</td>
								</tr>
							</table>
						</div>
						<hr>
						<div class="surveyDescriptionArea">
							<table style="width:100%;">
								<tr>
									<td>
										<textarea style="height:130px; width:100%; border:1px solid white;font-size:0.9vw; resize:none; line-height:150%;" readonly>
수도권에서 가장 가까운 바다로 손꼽히는 강화도. 도심과 근접한 위치로 당일치기 여행으로도 제격인 강화도는 산이나 사찰, 바다를 중심으로 볼거리가 한 가득이라고 하는데요. :)
‘호텔스닷컴’에서 선정한 강화도에서 가볼 만한 곳들 중, 여러분이 가보고 싶은 여행지는 어디인가요?
											</textarea>
										</td>
									</tr>
									<tr>
										<td style="text-align:right;">
										<span style="font-size:0.75vw; font-weight:bold; color:#717171;">최소 1개에서 최대 10개 선택</span>
									</td>
								</tr>
							</table>
						</div>
						<hr>
						<div class="choiceArea">
							<div class="ui two column grid" id="surveyListArea" style="width: inherit; margin: 0 auto;">
								<c:forEach var="no" begin="1" end="5" step="1">
									<div class="column">
										<div class="ui segment eachSurveyBox">
											<div class="eachBox" style="height:70px;">
												<div class="choiceNameArea" style="padding-top:10px;">
													<div class="ui checked checkbox" style="margin-bottom: 9px;">
														<input type="checkBox" name="interests" class="choiceBox" id="choice${ no }" value="choice${ no }">
														<label for="choice${ no }" style="cursor: pointer;"> 보기 ${ no }</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="bottomArea" style="margin-top:30px;">
							<table style="width:100%;">
								<tr>
									<td>
										<button class="ui toggle button">
											<i class="heart outline icon"></i> 좋아요
											</button>
										<button class="ui basic button" id="commentBtn">
											<i class="comment dots outline icon"></i> 댓글
										</button>
										<button class="ui basic button" id="reportBtn">
											<i class="bell outline icon"></i> 신고
										</button>
									</td>
									<td style="text-align:right;">
										<button id="voteBtn">투표하기</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					
				</div>
				
				
						
				
				
				
				
				
			<div id="scroll" style="position:absolute;right:0;top:0;">
				<div class="ui right attached rail">
					<div class="ui segment" id="firstWing">
						<button id="uploadBtn">내 투표 올리기</button>
					</div>
					<div class="ui segment" id="secondWing">
						<div id="searchInput">
							<div class="ui action input">
								<input type="text" placeholder="Search...">
								<button class="ui icon button">
									<i class="search icon"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="ui segment" id="thirdWing">
						<div style="margin-bottom: 10px;">
							<span style="font-size: 11pt; font-weight: bold;">정렬 방식</span>
						</div>
						<div class="ui form">
							<div class="inline fields" style="margin-left:5px;">
								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="frequency" checked id="recentOrder" value="recentOrder">
										<label class="choices" for="recentOrder" style="font-size: 10.5pt; cursor:pointer;">최신순</label>
									</div>
								</div>
								<div class="field">
									<div class="ui radio checkbox">
										<input type="radio" name="frequency" id="rankingOrder" value="rankingOrder">
										<label class="choices" for="rankingOrder" style="font-size: 10.5pt; cursor:pointer;">인기순</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ui segment" id="fourthWing">
						<div style="margin-bottom: 10px;">
							<span style="font-size: 11pt; font-weight: bold;">관심 주제</span>
						</div>
						<div style="padding-left: 25px;">
							<div class="ui checked checkbox" style="margin-bottom: 9px;">
								<input type="checkBox" name="interests" id="love" value="love">
								<label for="love" style="cursor:pointer;"> 연애 / 사랑</label>
							</div>
							<div class="ui checked checkbox" style="margin-bottom: 9px;">
								<input type="checkBox" name="interests" id="economy" value="economy">
								<label for="economy" style="cursor:pointer;"> 경제 / 사회</label>
							</div>
							<div class="ui checked checkbox" style="margin-bottom: 9px;">
								<input type="checkBox" name="interests" id="travel" value="travel">
								<label for="travel" style="cursor:pointer;"> 여행 / 레저 / 스포츠</label>
							</div>
							<div class="ui checked checkbox" style="margin-bottom: 9px;">
								<input type="checkBox" name="interests" id="education" value="education">
								<label for="education" style="cursor:pointer;"> 육아 / 교육</label>
							</div>
							<div class="ui checked checkbox" style="margin-bottom: 9px;">
								<input type="checkBox" name="interests" id="food" value="food">
								<label for="food" style="cursor:pointer;"> 음식 / 주류</label>
							</div>
							<div class="ui checked checkbox" style="margin-bottom: 9px;">
								<input type="checkBox" name="interests" id="fashion" value="fashion">
								<label for="fashion" style="cursor:pointer;"> 패션 / 쇼핑 / 뷰티</label>
							</div>
							<div class="ui checked checkbox">
								<input type="checkBox" name="interests" id="etc" value="etc">
								<label for="etc" style="cursor:pointer;"> 기타</label>
							</div>
						</div>
					</div>
					<div class="ui segment" id="fifthWing">
						<button id="mySurveyBtn">내 패널서베이 보러가기</button>
					</div>
				</div>
			</div>
			<script>
				$(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
					var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
				    $("#scroll").stop().animate({top:position+"px"}, 700); //해당 오브젝트 위치값 재설정
				});
			</script>
				<p></p>
				<p></p>
			</div>


			<br />
		</section>
		<!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp"%>
	</div>
	<!-- wrap end -->
	
	<script>
		$(document).on("click", "div.ui.segment.eachSurveyBox ", function(){
			$(this).find(".choiceBox").click();
		});
		
		$(document).on("click", ".ui.toggle.button", function(){
			$(this).toggleClass('active');
		});
		
	</script>
</body>
</html>









































