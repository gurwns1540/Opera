<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/footer.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<meta charset="UTF-8">
<title>Survway - 기업</title>
<style>
	body {
		margin: 0px;
		overflow-x: hidden;
	}
	#corpHead {
		width: 100%;
		margin: 0 auto;
		text-align: center;
		vertical-align: bottom;
	}
	#corpHead td {
		padding-bottom: 0;
    	vertical-align: bottom;
    	padding-top: 10px;
    	width: 20%;
	}
	.menu {
		color: #616161;
		font-size: 18px;
		height: 30px;
		line-height: 40px;
	}
	.menu:hover {
		color: black;
		font-weight: bold;
		cursor: pointer;
	}
	#logout {
		position: absolute;
		right: 10px;
		top: 10px;
	}
	.logo:hover {
		cursor: pointer;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<c:if test="${ !empty sessionScope.loginUser }">
		<c:if test="${ sessionScope.loginUser.userType eq '기업' }">
			<table id="corpHead">
				<tr>
					<td>
						<div class="menu" onclick="#">회사 및 사업 소개</div>
					</td>
					<td>
						<div class="menu" onclick="#">신뢰성 확보 방법</div>
					</td>
					<td class="logo">
						<div onclick="location.href='corpMain.corp'"><img alt="corpLogo.png" src="${ contextPath }/resources/images/corpLogo.png"></div>
					</td>
					<td>
						<div class="menu" onclick="#">리서치 관련 안내</div>
					</td>
					<td>
						<div class="menu" onclick="#">Survway 빅데이터</div>
						<button id="logout" onclick="location.href='logout.me'">로그아웃</button>
					</td>
				</tr>
			</table>
		</c:if>
	</c:if>
	<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.userType ne '기업' }">
		<c:set var="msg" value="기업회원만 접근 가능합니다." scope="request"/>
		<jsp:forward page="/WEB-INF/views/common/errorPage.jsp"/>
	</c:if>
</body>
</html>