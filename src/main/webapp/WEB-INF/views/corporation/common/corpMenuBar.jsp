<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/footer.css" />

<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">

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
	}
	.menu:hover {
		color: black;
		font-weight: bold;
		cursor: pointer;
	}

</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<table id="corpHead">
		<tr>
			<td class="menu">
				<div onclick="#">회사 및 사업 소개</div>
			</td>
			<td class="menu">
				<div onclick="#">신뢰성 확보 방법</div>
			</td>
			<td class="logo">
				<div onclick="#"><img alt="corpLogo.png" src="${ contextPath }/resources/images/corpLogo.png"></div>
			</td>
			<td class="menu">
				<div onclick="#">리서치 관련 안내</div>
			</td>
			<td class="menu">
				<div onclick="#">Survway 빅데이터</div>
			</td>
		</tr>
	</table>

</body>
</html>