<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>

#title {
	font-weight: bold;
}

#stitle {
	color: lightgray;
}


#agreetable {
	margin-top: 50px;
	margin-bottom: 50px;
}

tr {
	border-collapse: separate;
	border-spacing: 100px;
}
h4{
	font-weight: bold;
}
.contents1{
	padding-left: 390px !important;
	padding-right: 0px !important; 
}
.contents2{
	padding-left: 300px !important;
	padding-right: 0px !important; 
}
.contents3{
	padding-left: 330px !important;
	padding-right: 0px !important; 
}
.contents4{
	padding-left: 285px !important;
	padding-right: 0px !important; 
}
.contents5{
	padding-left: 175px !important;
	padding-right: 0px !important; 
}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		
			<div id="agreediv">
				<table id="agreetable" align="center">
					<tr>
						<td><h1>회원가입</h1></td>
						<td style="width: 100px;"></td>
						<td style="width: 200px;"></td>
						<td id="title" style="width: 100px;"><h4>이용약관</h4></td>
						<td id="stitle" style="width: 100px;"><h4>정보입력</h4></td>
						<td id="stitle" style="width: 100px;"><h4>가입완료</h4></td>
					</tr>
					<tr>
						<td colspan="6"><hr></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td colspan="6"><h3>이용약관 안내</h3></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<div class="ui styled accordion" id="aco1">

								<div class="title">
									<label for="agree1" style="color: black"><input
										type="checkbox" id="agree1" name="agree1">이용약관 동의</label>
										<span class="contents1">내용보기</span>
									<i class="angle down icon"></i>

								</div>
								<div class="content">
									<p class="transition hidden">
										<jsp:include page="/WEB-INF/views/panel/signPanel/provision.jsp"></jsp:include>
									</p>
								</div>

							</div> <!-- accordion1 end -->
						</td>
					</tr>
					<tr>
						<td><br><br></td>
					</tr>
					<tr>
						<td colspan="6"><h3>개인정보 수집 및 이용안내</h3></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td colspan="6" align="center">


							<div class="personalagree" id="personalagree">

								<div style="" id="agreePersonal">
									<label for="allagree"><input type="checkbox"
										id="allagree" name="agreep">아래 모든 개인정보 수집 및 이용 항목에 동의
										합니다.</label>
								</div>

								<div class="ui styled accordion" id="aco2">

									<div class="title">
										<label for="agree2" style="color: black"><input
											type="checkbox" id="agree2" name="agreep">수집하는 개인정보
											항목 동의</label>

										<span class="contents2">내용보기<i class="angle down icon"></i></span> 

									</div>
									<div class="content">
										<p class="transition hidden">
											<jsp:include page="/WEB-INF/views/panel/signPanel/personalInfo1.jsp"></jsp:include>
										</p>
									</div>
									<div class="title">
										<label for="agree3" style="color: black"><input
											type="checkbox" id="agree3" name="agreep">개인정보 수집목적
											동의</label>
											<span class="contents3">내용보기<i class="angle down icon"></i></span>
									</div>
									<div class="content">
										<p class="transition hidden">
											<jsp:include page="/WEB-INF/views/panel/signPanel/personalInfo2.jsp"></jsp:include>
										</p>
									</div>

									<div class="title">
										<label for="agree4" style="color: black"><input type="checkbox" id="agree4" name="agreep">개인정보 보유 및 이용기간 동의</label>

									    <span class="contents4">내용보기<i class="angle down icon"></i></span>
										

									</div>
									<div class="content">
										<p class="transition hidden">
											<jsp:include page="/WEB-INF/views/panel/signPanel/personalInfo3.jsp"></jsp:include>
										</p>
									</div>

								</div>
								<!-- accordion2 end -->
							</div>
						</td>
					</tr>
					<tr>
						<td><br><br></td>
					</tr>
					<tr>
						<td colspan="6"><h3>개인정보 유효기간</h3></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<div class="ui styled accordion" id="aco3">
								<div class="title">
									<label for="agree5" style="color: black"><input
										type="checkbox" id="agree5" name="agree5">개인정보를 파기 또는
										분리 저장 및 관리 기간 동의</label>

									<span class="contents5">내용보기</span> <i
										class="angle down icon"></i>

								</div>
								<div class="content">
									<p class="transition hidden">
										<jsp:include page="/WEB-INF/views/panel/signPanel/personalInfoPeriod.jsp"></jsp:include>
									</p>
								</div>

							</div>
						</td>
					</tr>
					<tr>
						<td><br></td>
					<tr>
						<td colspan="6" align="center"><button class="ui teal button" onclick="location.href='panelSignup2.panel'">다음</button></td>
					</tr>
				</table>
			</div>

		<br><br>







		



		
	</div>
	<!-- wrap end -->

	<script>
		$('.ui.accordion').accordion();

		$("#allagree").click(function() {

			if ($("#allagree").prop("checked")) {
				$("input[name=agreep]").prop("checked", true);
			} else {
				$("input[name=agreep]").prop("checked", false);
			}

		})
	</script>
</body>
</html>