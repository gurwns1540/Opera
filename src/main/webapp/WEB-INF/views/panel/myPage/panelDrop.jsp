<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
	.panelDropArea {
		width: 100%;
	}
	.panelDropImgArea {
		width: inherit;
		height: 100px;
		background-color: #98E5FD;
	}




</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">패널 탈퇴</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">패널 탈퇴</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			<div class="panelDropArea">
				<div class="panelDropImgArea">
					<!-- 이미지 영역입니다. -->
				</div>  <!-- panelDropImgArea end -->
				<br />
				<hr />
				<br />
				<div class="panelDropReasonArea" align="center">
					<b>
						회원님께서 탈퇴하시는 사유 또는 저희 사이트에 건의하고 싶은 점 있으신가요?<br />
						글을 남겨주시면 회원님의 의견을 소중히 경청하겠습니다.
					</b>
					
					<textarea name="" id="" cols="133" rows="10" style="margin-top: 20px;"></textarea>
				</div>  <!-- panelDropReasonArea end -->
				<br />
				<hr />
				<br />
				<div class="panelDropPasswordArea" style="width: 100%;">
					<table align="center" style="width: inherit;">
						<tr align="center">
							<td colspan="2"><b>개인정보보호를 위해 탈퇴를 원하시면 비밀번호를 한번 더 입력 후 [탈퇴하기]를 선택해 주시기 바랍니다.</b></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td align="center">
								비밀번호 :   
								<div class="ui input" >
									<input type="password" name="userPwd" style="margin-left: 10px;">
								</div>
							</td>
						</tr>
						<tr>
							<td><br><br></td>
						</tr>
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button class="ui blue button" onclick="location.href='#'">탈퇴하기</button>
								<button class="ui blue button" onclick="location.href='#'">메인으로</button>
							</td>
						</tr>
					</table>
				
				</div>  <!-- panelDropPasswordArea end -->
			</div>  <!-- panelDropArea end -->
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>












