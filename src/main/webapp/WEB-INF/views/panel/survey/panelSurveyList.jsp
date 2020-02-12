<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script>
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
.voteBtn {
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
.ui.reply.form {
	width: 100% !important;
	height: 180px;
}
.show {display:block} /*보여주기*/

.hide {display:none} /*숨기기*/

.ui.comments .comment>.comments {
    margin: 0 0 0.5em 1.5em !important;
    padding: 0em 0 0em 1em !important;
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
											<span style="font-size:1vw; font-weight:bold; color:#2B2B2B; padding-left:5px;" class="surveyTitle">${ survey.surveyTitle }</span>
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
											<button class="replyModal ui basic button"><i class="comment dots outline icon"></i> 댓글  ${ survey.replyCount }</button>
											<button class="report ui basic button"><i class="bell outline icon"></i> 신고</button>
										</td>
										<td style="text-align:right;">
											<button class="voteBtn">투표하기</button>
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
									<input type="radio" name="interests" id="love" value="1">
									<label for="love" style="cursor:pointer;"> 연애 / 사랑</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="economy" value="2">
									<label for="economy" style="cursor:pointer;"> 경제 / 사회</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="travel" value="3">
									<label for="travel" style="cursor:pointer;"> 여행 / 레저 / 스포츠</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="education" value="4">
									<label for="education" style="cursor:pointer;"> 육아 / 교육</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="food" value="5">
									<label for="food" style="cursor:pointer;"> 음식 / 주류</label>
								</div>
								<div class="ui checked checkbox" style="margin-bottom: 9px;">
									<input type="radio" name="interests" id="fashion" value="6">
									<label for="fashion" style="cursor:pointer;"> 패션 / 쇼핑 / 뷰티</label>
								</div>
								<div class="ui checked checkbox">
									<input type="radio" name="interests" id="etc" value="7">
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
		
		<div class="ui modal" id="replyModal">
			<div class="header">Header</div>
			<div class="scrolling content">
				<div id="chartArea">
				
				</div>
	    		<div id="replyArea" style="width: 90%; margin: 10px auto;">
	    			<div class="ui comments" id="commentArea" style="width: 100%; max-width: 1000px;">
						<h3 class="ui dividing header">Comments</h3>
						<div class="field">
							<div class="ui form" style="width: 100%">
								<textarea id="replyContext" style="resize: none; line-height: 30px;"></textarea>
							</div>
						</div>
						<div class="ui blue labeled submit icon button" style="float:right; margin-top: 15px;">
							<i class="icon edit"></i> Add Reply
						</div>
					</div>
	    		</div>
			</div>
			 <div class="actions">
				<div class="ui cancel button">Cancel</div>
			</div>
		</div>

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
			
			$(document).on("click", ".voteBtn", function(){
				var mno = "${ loginUser.mno }";
				var surveyNo = $(this).parent().parent().parent().parent().parent().parent().find(".surveyNo").val();
				var isChecked = false;
				var choiceNo = 0;
				$(this).parent().parent().parent().parent().parent().parent().find(".choicebox").each(function(){
					if($(this).is(":checked")){
						isChecked = true;
						choiceNo = $(this).prop("id").substr(6,7);
					}
				})
				
				if(isChecked == false){
					Swal.fire(
						'선택 없음!',
						'보기를 선택해주세요!',
						'error'
					)
				}else {
					$.ajax({
						url:"vote.survey",
						type:"post",
						data:{
							mnoStr:mno,
							surveyNoStr:surveyNo,
							choiceNoStr:choiceNo
						},
						success:function(data){
							if(data.alreadyVoted == true){
								Swal.fire(
									'투표 오류!',
									'이미 투표하셨습니다.',
									'error'
								)
							}else {
								Swal.fire(
									'투표 완료!',
									'투표가 적용되었습니다.',
									'success'
								)
								setTimeout(function(){
								    location.reload();
								},1500);
							}
						}
					})
				}
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
					}
				})
			});
		</script>
	</c:if>
	<script>
		$(document).on("click", ".replyModal.ui.basic.button", function(){
			var surveyTitle = $(this).parent().parent().parent().parent().parent().parent().find(".surveyTitle").text();
			$("#replyModal").find(".header").eq(0).text(surveyTitle);
			var surveyNo = $(this).parent().parent().parent().parent().parent().parent().find(".surveyNo").val();
			$.ajax({
				url:"statisticAndReply.survey",
				type:"post",
				data:{
					surveyNoStr:surveyNo
				},
				success:function(data){
					var statisticList = data.statisticList;
					var replyList = data.replyList;
					
					console.log(statisticList);
					var $commnetTitle = $("<h3 class='ui dividing header'>Comments</h3>");
					var $commentInput = $('<div class="field" style="margin-top: 20px;"> <div class="ui form" style="width: 100%"> <textarea id="replyContext" style="resize: none; line-height: 30px;"></textarea> </div> </div> <div class="ui blue labeled submit icon button" style="float:right; margin-top: 15px;"> <i class="icon edit"></i> Add Reply </div>');
					$("#chartArea").html("");
					$("#commentArea").html("");
					
					$("#commentArea").append($commnetTitle);
					
					if(statisticList.length == 0){
						var $statistic = $("<div style='text-align:center; padding-top: 80px; padding-bottom: 80px; padding-left: 21%; padding-right: 20%;'>응답 이력이 없습니다.</div>");
						$("#chartArea").html($statistic);
					}else {
						var $canvas = $('<div style="width:75%;margin:0 auto;"> <canvas id="chart_canvas" class="chartjs" style="display: block; width: 100%; height: 300px;"></canvas> </div>');
						$("#chartArea").append($canvas);
						var ctx = $("#chart_canvas");
						var lables = [];
						var data = [];
						for(var i = 0; i < statisticList.length; i++){
							lables.push(statisticList[i].choiceContext);
							data.push(statisticList[i].choiceCount);
						}
						var myChart = new Chart(ctx, {
						  type: 'pie',
						  data: {
						    labels: lables,
						    datasets: [{
						      label: '# of Tomatoes',
						      data: data,
						      backgroundColor: [
						        'rgba(204, 51, 153, 0.7)',
						        'rgba(242, 242, 242, 0.7)',
						        'rgba(231, 230, 230, 0.7)',
						        'rgba(217, 217, 217, 0.7)',
						        'rgba(203, 203, 203, 0.7)',
						        'rgba(191, 191, 191, 0.7)',
						        'rgba(182, 182, 182, 0.7)',
						        'rgba(174, 174, 174, 0.7)',
						        'rgba(166, 166, 166, 0.7)',
						        'rgba(159, 159, 159, 0.7)'
						        
						      ],
						      borderColor: [
						        'rgba(204, 51, 153, 1)',
						        'rgba(242, 242, 242, 1)',
						        'rgba(231, 230, 230, 1)',
						        'rgba(217, 217, 217, 1)',
						        'rgba(203, 203, 203, 1)',
						        'rgba(191, 191, 191, 1)',
						        'rgba(182, 182, 182, 1)',
						        'rgba(174, 174, 174, 1)',
						        'rgba(166, 166, 166, 1)',
						        'rgba(159, 159, 159, 1)'
						      ],
						      borderWidth: 1
						    }]
						  },
						  options: {
						   	cutoutPercentage: 40,
						    responsive: false,

						  }
						});
					}
					if(replyList.length == 0){
						
						var $comment = $("<div style='text-align:center; padding-top: 35px; padding-bottom: 40px; padding-left: 21%; padding-right: 20%;'>댓글이 없습니다.</div>");
						
						$("#commentArea").append($comment);
						
					}else {
						for(var i = 0; i < replyList.length; i++){
								console.log(replyList[i].surveyReplyRefrid);
							var refrid = replyList[i].surveyReplyRefrid;
							if(typeof refrid == "undefined"){
								var $commentClass = $('<div class="comment">');
								var $content = $('<div class="content">');
								var $author = $('<a class="author">' + replyList[i].userName + '</a>');
								var $metadata = $('<div class="metadata"> <span class="date">' + replyList[i].surveyReplyDate + '</span> </div>');
								var $text = $('<div class="text">' + replyList[i].surveyReplyContext + '</div>');
								var $replyBtn = $('<div class="actions"> <a class="reply">Reply</a> </div>');
								var $rereplyArea = $('<div class="ui reply form hide"> <div class="field" style="height: 100px;"> <textarea style="resize: none; line-height: 30px; height: 100%"></textarea> <div class="ui primary submit labeled icon button" style="float:right; margin-top: 15px;"> <i class="icon edit"></i> Add Reply </div> </div> </div>');
								$content.append($author);
								$content.append($metadata);
								$content.append($text);
								$content.append($replyBtn);
								$content.append($rereplyArea);
								var $rereplyComments = $('<div class="comments">');
								for(var j = 0; j < replyList.length; j++){
									var refrid2 = replyList[j].surveyReplyRefrid;
									if(replyList[i].surveyReplyNo == refrid2){
										var $rereplyComment = $('<div class="comment">');
										var $rereplyContent = $('<div class="content">');
										var $rereplyauthor = $('<a class="author">' + replyList[j].userName + '</a>');
										var $rereplymetadata = $('<div class="metadata"> <span class="date">' + replyList[j].surveyReplyDate + '</span> </div>');
										var $rereplytext = $('<div class="text">' + replyList[j].surveyReplyContext + '</div>');
										
										$rereplyContent.append($rereplyauthor);
										$rereplyContent.append($rereplymetadata);
										$rereplyContent.append($rereplytext);
										$rereplyComment.append($rereplyContent);
										
										$rereplyComments.append($rereplyComment);
										
									}
								}
								
								$commentClass.append($content);
								$commentClass.append($rereplyComments);
								
								$("#commentArea").append($commentClass);
							}
						}
					}
				
					$("#commentArea").append($commentInput);
				}
			})	
			$("#replyModal").modal("show");
		});
		$(document).on("click", ".reply", function(){
			$(this).parent().parent().find(".ui.reply.form").toggle(
				function(){$(this).addClass('show')}, //클릭하면 show클래스 적용되서 보이기
				function(){$(this).addClass('hide')} //한 번 더 클릭하면 hide클래스가 숨기기
			);
		});
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