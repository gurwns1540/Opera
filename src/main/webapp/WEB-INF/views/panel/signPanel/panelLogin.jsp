<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<!-- <br />
			로그인페이지입니다.
		<br /> -->
			<h2 id="loginLabel">로그인</h2>
			<div class="loginArea">
				<div class="login1Contents">
					<form action="" method="post">
						<table class="inputArea" border="1">
							<tr>
								<td></td>
								<td colspan="2" style="text-align: left;">
									<input type="radio" name="loginType" checked="checked"/><span>패널회원</span>
									<input type="radio" name="loginType" style="margin-left: 10%;"/><span>기업회원</span>
								</td>
							</tr>
							<tr>
								<td>아이디 : </td>
								<td><input type="text" name=""/></td>
								<td rowspan="2"><button type="submit">로그인</button></td>
							</tr>
							<tr>
								<td>비밀번호 : </td>
								<td><input type="password" name="" /></td>
							</tr>
						</table>
					</form>
				</div>  <!-- login1Contents end -->
				<div class="login2Contents">
				
				</div>  <!-- login2Contents end -->
			</div>  <!-- loginArea end -->
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>