<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
</head>
<style>
#titleTable {
	margin: 0 auto;
	margin-top: 20px;
}

#menuTitle {
	height: 30px;
	width: 40%;
	font-size: 16pt;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	color: #3D3D3D;
}

#pagePath {
	width: 60%;
	text-align: right;
	vertical-align: bottom;
	font-weight: bold;
}

#depth1, #depth2, #depth3 {
	color: #494949;
}

#depth1:hover, #depth2:hover {
	color: #008499;
}

.sectionLine {
	padding-bottom: 40px;
}
/* 여기까지 페이지제목 및 경로 영역 */

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
	position:fixed;
	top:210px;
}

#secondWing {
	height: 37px;
	-webkit-box-shadow: 0;
	box-shadow: 0 1px 2px 0 white;
	border: 1px solid white;
	padding: 0px;
	position:fixed;
	top:257px;
}
#thirdWing {
	height: 75px;
	width:inherit;
	position:fixed;
	top:305px;
}
#fourthWing {
	height: 338px;
	width: inherit;
	padding: 13px;
	position:fixed;
	top:391px;
}
#uploadBtn {
	background-color: #00679A;
	width: 200px;
	height: inherit;
	color: white;
	border: none;
	cursor: pointer;
	font-size:12pt;
}

#searchInput, .ui.action.input {
	width: 160px;
	height: 37px;
	font-size: 11pt;
}
S</style>
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
				<div style="padding-right:3%; height:auto; margin-bottom:100px;">
					<div style="width:inherit; border:1px solid red; height:200px; margin-bottom:30px;">
						으아아ㅏ
					</div>
					<div style="width:inherit; border:1px solid red; height:200px; margin-bottom:30px;">
						으아아ㅏ
					</div>
					<div style="width:inherit; border:1px solid red; height:200px; margin-bottom:30px;">
						으아아ㅏ
					</div>
					<div style="width:inherit; border:1px solid red; height:200px; margin-bottom:30px;">
						으아아ㅏ
					</div>
					<div style="width:inherit; border:1px solid red; height:200px; margin-bottom:30px;">
						으아아ㅏ
					</div>
					<div style="width:inherit; border:1px solid red; height:200px; margin-bottom:30px;">
						으아아ㅏ
					</div>
					
				</div>
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
						<div style="margin-bottom:10px;">
							<span style="font-size:11pt; font-weight:bold;">정렬 방식</span>
						</div>
						<div style="padding-left:25px;">
							<input type="radio" name="orderType" value="recentOrder" id="recentOrder">
							<label for="recentOrder" style="font-size:10.5pt;"> 최신순</label>
							<input type="radio" name="orderType" value="rankingOrder" id="rankingOrder" style="margin-left:15px;">
							<label for="rankingOrder" style="font-size:10.5pt;"> 인기순</label>
						</div>
					</div>
					<div class="ui segment" id="fourthWing">
						<div style="margin-bottom:10px;">
							<span style="font-size:11pt; font-weight:bold;">관심 주제</span>
						</div>
						<div style="padding-left:25px;">
							<input type="checkBox" name="interests" id="love" value="love" style="margin-bottom:9px;">
							<label for="love"> 연애 / 사랑</label><br>
							<input type="checkBox" name="interests" id="economy" value="economy" style="margin-bottom:9px;">
							<label for="economy"> 경제 / 사회</label><br>
							<input type="checkBox" name="interests" id="furniture" value="furniture" style="margin-bottom:9px;">
							<label for="furniture"> 가전 / 가구</label><br>
							<input type="checkBox" name="interests" id="IT" value="IT" style="margin-bottom:9px;">
							<label for="IT"> IT / SNS</label><br>
							<input type="checkBox" name="interests" id="travel" value="travel" style="margin-bottom:9px;">
							<label for="travel"> 여행 / 레저</label><br>
							<input type="checkBox" name="interests" id="sports" value="sports" style="margin-bottom:9px;">
							<label for="sports"> 스포츠</label><br>
							<input type="checkBox" name="interests" id="car" value="car" style="margin-bottom:9px;">
							<label for="car"> 자동차</label><br>
							<input type="checkBox" name="interests" id="investment" value="investment" style="margin-bottom:9px;">
							<label for="investment"> 재테크</label><br>
							<input type="checkBox" name="interests" id="education" value="education" style="margin-bottom:9px;">
							<label for="education"> 육아 / 교육</label><br>
							<input type="checkBox" name="interests" id="food" value="food" style="margin-bottom:9px;">
							<label for="food"> 음식</label><br>
							<input type="checkBox" name="interests" id="fashion" value="fashion" style="margin-bottom:9px;">
							<label for="fashion"> 패션 / 쇼핑 / 뷰티</label><br>
							<input type="checkBox" name="interests" id="etc" value="etc">
							<label for="etc"> 기타</label>
						</div>
					</div>
				</div>
				<p></p>
				<p></p>
			</div>


			<br />
		</section>
		<!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp"%>
	</div>
	<!-- wrap end -->
</body>
</html>









































