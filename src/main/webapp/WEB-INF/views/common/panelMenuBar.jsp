<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin: 0;
	}
	#mainMenuArea {
		width:100%
	}
	#mainMenuTable {
		width: 100%;
		background: #001E2D;
	}
	#mainMenuTable tr td {
		padding: 0;
	}
	#loaginBtnArea {
		margin-rop: 20px;
		margin-right: 10px;
	}
</style>
</head>
<body>
	<div id="mainMenuArea" align="center">
		<table id="mainMenuTable">
			<tr>
				<td style="width: 48%"><img alt="logo" src="${ contextPath }/resources/images/logo.png" style="float:left; margin-left: 10px; margin-top: 20px; width: 150px;"></td>
				<td style="width: 70x; height: 90px; padding: "><img alt="logo" src="${ contextPath }/resources/images/logo2.png" style="float:center; width: 60px; margin-top: 6 px;"></td>
				<td style="width: 40%">
					<div id="loaginBtnArea" align="right">
						<button id="loginBtn" style="background: none; border: none; font-size: 15pt; color: white;">로그인</button>
						<button id="signUp" style="background: none; border: none; font-size: 15pt; color: white;">회원가입</button>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<h1>hi?</h1>
</body>
</html>