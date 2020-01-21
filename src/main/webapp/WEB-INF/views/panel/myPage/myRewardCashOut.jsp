<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
.cashOutImgArea {
	width: inherit;
	height: 100px;
	background-color: #98E5FD;
}
.moneyResultArea {
	width: inherit;
	height: 50px;
	background-color: #e5e5e5;
	border-radius: 5px;
}
#resultTableArea {
	width: 100%;
	height: 100%;
}
.result {
	font-size: 16px;
}
#resultName {
	text-align: left;
	padding-left: 5%;
	font-weight: bold;
	width: 40%;
}
#resultMoney {
	text-align: right;
	padding-right: 1%;
	font-size: 20px;
	color: orangered;
	font-weight: bold;
	width: 45%;
}
#resultMoneyKor {
	text-align: left;
	font-weight: bold;
	width: 15%;
}
</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">캐시아웃 신청</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth3" href="myRewardMain.panel">내 리워드</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth4">캐시아웃 신청</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			<div class="contentsArea" style="width: 100%;">
				<div><b>회원님의 리워드를 캐시아웃 신청하는 공간입니다.</b></div>
				<br />
				<div class="cashOutImgArea">
				
				</div>  <!-- .cashOutImgArea end -->
				<br />
				<hr />
				<br />
				<div class="cashOutArea">
					<div><b>금액을 선택해주세요</b></div>
					<br />
					<div class="ui buttons moneyArea">
						<button class="ui button active" value="10000">1만원</button>
						<button class="ui button" value="20000">2만원</button>
						<button class="ui button" value="30000">3만원</button>
						<button class="ui button" value="40000">4만원</button>
						<button class="ui button" value="50000">5만원</button>
					</div>
					<br /><br />
					<div class="moneyResultArea">
						<table id="resultTableArea">
							<tr>
								<td class="result" id="resultName">신청 금액</td>
								<td class="result" id="resultMoney">10000</td>
								<td class="result" id="resultMoneyKor">원</td>
							</tr>
						</table>
					</div>  <!-- moneyResultArea end -->
					<br /><br />
					<div class="btnArea" align="center">
						<button class="ui blue button">신청하기</button>
					</div>
				</div>  <!-- cashOutArea end -->
			</div>  <!-- .contentsArea end -->
			<script>
				$(".moneyArea").children().click(function(){
					$(".moneyArea").children().removeClass("active");
					$(this).addClass("active");
					$("#resultMoney").text($(this).val());
				});
			</script>
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>












