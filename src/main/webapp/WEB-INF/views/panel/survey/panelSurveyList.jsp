<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
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
#panelSurvayUpload {
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
.ui.basic.button, .ui.toggle.button {
    height: 25px;
    width: 90px;
    font-size: 0.5vw;
    background-color: white;
    box-shadow: 0 0 0 1px rgba(34,36,38,.15) inset;
}
.ui.basic.button:hover,.ui.toggle.button:hover {
	box-shadow:0 0 0 1px #CC3399 inset;
}
.ui.button.toggle.active {
	background-color:#CC3399 !important;
}
.noImage {
	width: 50% !important;
}
textarea:focus {
	outline: none;
}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
			<br />

			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">패널서베이</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="surveyList.survey">서베이</a>
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
					<c:forEach var="survey" items="${surveyList}">
						<div class="eachPanelSurvey ui segment" style="width:90%; margin:0 auto; margin-bottom:70px;">
							<input type="hidden" value="${ survey.surveyNo }" class="surveyNo">
							<div class="surveyTitleArea">
								<table style="width:100%;">
									<tr>
										<td style="padding-left:0px; width: 40px;">
											<img src="resources/images/q.png" alt="" class="icon" style="width:40px; height:40px;">
										</td>
										<td style="vertical-align: middle;">
											<span style="font-size:1vw; font-weight:bold; color:#2B2B2B; padding-left:5px;">${ survey.surveyTitle }</span>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:right;">
											<span style="font-size:0.8vw; font-weight:bold; margin-right:10px; color:#008499;">카테고리 : </span>
											<span style="font-size:0.8vw; font-weight:bold;">${ survey.scategoryName }</span>
										</td>
									</tr>
								</table>
							</div>
							<hr>
							<div class="surveyDescriptionArea">
								<table style="width:100%;">
									<tr>
										<td>
											<textarea style="height:130px; line-height: 30px !important; width:100%; border:1px solid white;font-size:0.9vw; resize:none; line-height:150%;" readonly>${ survey.surveyContext }</textarea>
										</td>
									</tr>
									<tr>	
										<td style="text-align:right;">
											<span style="font-size:0.75vw; font-weight:bold; color:#717171;"></span>
										</td>
									</tr>
								</table>
							</div>
							<hr>
							<div class="choiceArea">
								<div class="ui four column grid" id="surveyListArea" style="width: inherit; margin: 0 auto;">
									<c:forEach var="choice" items="${ survey.choiceList }">
										<c:if test="${ choice.changeName ne null }">
											<div class="column">
												<div class="ui segment eachSurveyBox">
													<div class="eachBox" style="height:200px;">
														<div class="imgArea" style="height:80%; width:100%; margin:0 auto;">
															<img src="resources/uploadFiles/${ choice.changeName }" style="height:100%; width:100%;">
														</div>
														<div class="choiceNameArea" style="padding-top:10px;">
															<div class="ui radio checkbox" style="margin-bottom: 9px;">
																<input type="radio" class="choicebox" name="interests" id="choice${ choice.schoiceNo }" value="${ choice.schoiceOrder }">
																<label for="choice${ choice.schoiceNo }" style="cursor: pointer;"> ${ choice.schoiceContext }</label>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<c:if test="${ choice.changeName eq null }">
											<div class="column noImage">
												<div class="ui segment eachSurveyBox">
													<div class="eachBox" style="height:70px;">
														<div class="choiceNameArea" style="padding-top:10px;">
															<div class="ui radio checkbox" style="margin-bottom: 9px;">
																<input type="radio" class="choicebox" name="interests" id="choice${ choice.schoiceNo }" value="${ choice.schoiceOrder }">
																<label for="choice${ choice.schoiceNo }" style="cursor: pointer;"> ${ choice.schoiceContext }</label>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							<div class="bottomArea" style="margin-top:30px;">
								<table style="width:100%;">
									<tr>
										<td>
											<button class="like ui toggle button"><i class="heart outline icon"></i> 좋아요 ${ survey.surveyLike }</button>
											<button class="reply ui basic button" id="commentBtn"><i class="comment dots outline icon"></i> 댓글  ${ survey.replyCount }</button>
											<button class="report ui basic button" id="reportBtn"><i class="bell outline icon"></i> 신고</button>
										</td>
										<td style="text-align:right;">
											<button class="loginCheck" id="voteBtn">투표하기</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</c:forEach>
				</div>
				
				
						
				
				
				
				
				
			<div id="scroll" style="position:absolute;right:0;top:0;">
				<div class="ui right attached rail">
					<div class="ui segment" id="firstWing">
						<button class="panelSurvay" id="panelSurvayUpload">내 투표 올리기</button>
					</div>
					<form action="panelSurveyLists.survey" method="get">
						<div class="ui segment" id="secondWing">
							<div id="searchInput">
								<div class="ui action input">
									<input type="text" name="searchValue" placeholder="Search...">
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
									<input type="radio" name="interests" id="love" value="love">
									<label for="love" style="cursor:pointer;"> 연애 / 사랑</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="economy" value="economy">
									<label for="economy" style="cursor:pointer;"> 경제 / 사회</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="travel" value="travel">
									<label for="travel" style="cursor:pointer;"> 여행 / 레저 / 스포츠</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="education" value="education">
									<label for="education" style="cursor:pointer;"> 육아 / 교육</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="food" value="food">
									<label for="food" style="cursor:pointer;"> 음식 / 주류</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="fashion" value="fashion">
									<label for="fashion" style="cursor:pointer;"> 패션 / 쇼핑 / 뷰티</label>
								</div>
								<div class="ui checked checkbox">
									<input type="radio" name="interests" id="etc" value="etc">
									<label for="etc" style="cursor:pointer;"> 기타</label>
								</div>
							</div>
						</div>
					</form>
					<div class="ui segment" id="fifthWing">
						<button id="mySurveyBtn" class="panelSurvay">내 패널서베이 보러가기</button>
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
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
	<!-- wrap end -->
	<c:if test="${ !empty sessionScope.loginUser }">
		<script>
			$(function(){
				var mno = "${ loginUser.mno }";
				$.ajax({
					url:"likeCheck.survey",
					type:"post",
					data:{
						mno:mno
					},
					success:function(data){
						var likeSurveyList = data.likeSurveyList;
						for(var i = 0; i < likeSurveyList.length; i++){
							$(".surveyNo").each(function(){
								if($(this).val() == likeSurveyList[i]){
									$(this).parent().find(".like").addClass('active');
								}
							})
						}
						
					}
					
				});
			});
			$(document).on("click", ".like", function(){
				var likeCount = Number($(this).text().substr(5, 6));
				var surveyNo = $(this).parent().parent().parent().parent().parent().parent().find(".surveyNo").val();
				var mno = "${ loginUser.mno }";
				var likeStatus = "";
				if($(this).hasClass('active')){
					$(this).removeClass('active');
					$(this).html("<i class='heart outline icon'></i> 좋아요 " + (likeCount - 1));
					likeStatus = "minus";
				}else {
					$(this).addClass('active');
					$(this).html("<i class='heart outline icon'></i> 좋아요 " + (likeCount + 1));
					likeStatus = "plus";
				}
				
				$.ajax({
					url:"changeLikeCount.survey",
					type:"post",
					data:{
						surveyNoStr:surveyNo,
						likeStatus:likeStatus,
						mnoStr:mno
					},
					success:function(data){
						console.log(data);
					}
				})
			});
		</script>
	</c:if>
	<script>
		$(document).on("click", ".ui.segment.eachSurveyBox", function(){
			$(this).find(".choicebox").prop("checked", true);
		});
	</script>
	<c:if test="${ empty sessionScope.loginUser }"> 
		<script>
			$(".panelSurvay").click(function() {
				Swal.fire('안내', '로그인 후 이용해주세요', 'warning').then(function(){
					location.href="panelLogin.panel";
				});
			});
		</script>
	</c:if>
	<c:if test="${ !empty sessionScope.loginUser }"> 
		<script>
			$("#panelSurvayUpload").click(function() {
				location.href = "panelSurvayUpload.survey";
			});
		</script>
	</c:if>
</body>
</html>