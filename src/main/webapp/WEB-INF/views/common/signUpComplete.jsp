<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
<title>Insert title here</title>
<style>
#title {
	font-weight: bold;
}

#stitle {
	color: lightgray;
}

h4 {
	font-weight: bold;
}
#completetable{
	margin-top: 50px;
	margin-bottom: 50px;
}
.ui.button {
	background: #00679A !important;
	margin: 0;
}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<div id="complete">
			<table id="completetable" align="center">
				<tr>
					<td><h1>회원가입</h1></td>
					<td style="width: 100px;"></td>
					<td style="width: 200px;"></td>
					<td id="stitle" style="width: 100px;"><h4>이용약관</h4></td>
					<td id="stitle"><h4 style="width: 100px;">정보입력</h4></td>
					<td id="title"><h4 style="width: 100px;">가입완료</h4></td>
				</tr>
				<tr>
					<td colspan="6"><hr></td>
				</tr>
				<tr>
					<td><br><br></td>
				</tr>
				<tr>
					<td colspan="6" align="center">
						<img src="resources/images/footerLogo.png" width="500px" >
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="6" align="center"><h2>정회원 인증이 완료되었습니다.<br></h2>
													<h4 style="color: #4A4A4A;">로그인을 하여 설문조사를 진행해주세요!</h4></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="6"><hr></td>
				</tr>
				<tr>
					<td colspan="6" align="center">
						<button class="ui blue button">로그인</button>
						<button class="ui blue button">메인으로</button>
					</td>
				</tr>
			</table> <!-- completetable end -->
		</div> <!-- complete end -->
	</div><!-- wrap end -->
</body>
</html>