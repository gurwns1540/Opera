<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>

#titleTable {
	margin: 0 auto;
	margin-top: 80px;
}
#menuTitle {
	height: 30px;
	width: 40%;
	font-size: 17pt;
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
.hr {
	padding-bottom:10px;
}
.bottomHr {
	padding-top:10px;
}
/* 여기까지 페이지제목 및 경로 영역 */

#contentDiv {
	height:350px;
}

.ui.placeholder {
	background-image:none;
}

.ui.placeholder.segment {
	background:white;
	-webkit-box-shadow:none;
	box-shadow:none;
}
.leftTable {
	padding-left:30px;
}

#panelCorp {
	margin-bottom:300px;
	width:77%;
}

.inputs {
	height: 50px;
}
.first {
	width: 130px;
	text-align:left;
	font-size:13pt;
	font-weight:bold;
}
.second {
	width: 250px;
}
.third {
	width:100px;
	padding-left:8px;
}
td.leftTable.second {
	padding:0px;
}
.ui.grid>.row {
	padding-top:0px;
}
.rightTable {
	padding-left:50px;
}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
		<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">로그인</td>
				</tr>
			</table>
			
			<div class="hr">
				<hr>
			</div>


			<div class="ui placeholder segment" id="contentDiv" style="border:none;">
				<div class="ui two column stackable center aligned grid">
					<div class="ui vertical divider">Or</div>
					<div class="middle aligned row">
						<div class="column">
							<form action="login.me" method="post">
								<table style="width:95%; height:90px;">
									<tr>
										<td colspan="3" class="leftTable" style="text-align:left; padding-bottom:30px;">
											<input type="radio" id="panelCheck" name="loginMemberType" value="panelMember" checked="checked" />
											<label for="panelCheck"><span style="font-size:13pt;">패널 회원</span></label>
											<input type="radio" id="corpCheck" name="loginMemberType" value="corpMember" style="margin-left: 10%;" />
											<label for="corpCheck"><span style="font-size:13pt;">기업 회원</span></label>
										</td>
									</tr>
									<tr class="leftTable inputs">
										<td class="leftTable first">아이디</td>
										<td class="leftTable second">
											<div class="ui input" style="display: block; width:fit-content;">
												<input type="text" name="userId" placeholder="아이디" style="width:240px;">
											</div>
										</td>
										<td class="leftTable third" rowspan="2" style="width:fit-content;" >
											<button type="submit" class="ui button" style="padding:0px; float: left; width:80px; height:80px; border-radius:2px;">로그인</button>
										</td>
									</tr>
									<tr class="leftTable inputs">
										<td class="leftTable first">비밀번호</td>
										<td class="leftTable second">
											<div class="ui input" style="display: block; width:fit-content;">
												<input type="password" name="userPwd" placeholder="비밀번호" style="width:240px;">
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="column">
							<table style="width:95%; height:90px;">
									<tr class="rightTable inputs" >
										<td class="rightTable first" style="width:300px;">아직 회원이 아니신가요?</td>
										<td class="rightTable third" >
											<button type="submit" class="ui button" style="padding:0px; float: left; width:180px; height:40px; border-radius:2px;" onclick="location.href='panelSignup.panel'">회원가입하기</button>
										</td>
									</tr>
									<br>
									<tr class="rightTable inputs">
										<td class="rightTable first" style="width:280px;">회원 정보를 잊으셨나요?</td>
										<td class="rightTable third" >
											<button type="submit" class="ui button" style="padding:0px; float: left; width:180px; height:40px; border-radius:2px;">아이디/비밀번호 찾기</button>
										</td>
									</tr>
								</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="hr bottomHr">
				<hr>
			</div>			
			
			
			<button class="ui button" style="float:right; margin-top:10px; width:180px; height:40px; border-radius:2px;" onclick="location.href='panelMain.panel'">메인으로 돌아가기</button>
			
			<br />
		</section>  <!-- container end -->
		<c:if test="${ !empty param.msg }">
			<script>
				Swal.fire(
				      '실패',
				      '${ param.msg }',
				      'warning'
				);
			</script>
		</c:if>
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
</body>
</html>












