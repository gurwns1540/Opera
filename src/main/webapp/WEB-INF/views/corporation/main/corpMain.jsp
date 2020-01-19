<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#mainArea {
		width: 100%;
		height: 100vh;
		background-image: url("resources/images/corpMain.png");
		background-repeat: no-repeat;
		background-size: cover;
		margin-top: 10px;
		padding-top: 30px;
	}
	#mainArea div {
		margin: 20px auto;
		width: fit-content;
		font-size: 22px;
		color: white;
	}
	#corpMainLetter {
		margin: 100px auto !important;
	}
	#btnArea {
		width: 60%;
		margin: 0 auto;
		text-align: center;
	}
	#btnArea td div:hover {
		background: rgba(196, 196, 196, 0.25);
		cursor: pointer;
	}
	#btnArea td div{
		width: fit-content;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/corporation/common/corpMenuBar.jsp" %>
	<div id="mainArea">
		<div id="corpName">Welcome! (주)OrangeRed</div>
		<div id="corpMainLetter"><img alt="corpMainLetter" src="${ contextPath }/resources/images/corpMainLetter.png"></div>
		
		<table id="btnArea">
			<tr>
				<td><div><img alt="sampleResearch" src="${ contextPath }/resources/images/sampleResearch.png"></div></td>
				<td><div><img alt="newResearch" src="${ contextPath }/resources/images/newResearch.png"></div></td>
				<td><div><img alt="previousResearch" src="${ contextPath }/resources/images/previousResearch.png"></div></td>
			</tr>
		</table>
	</div>
	
	<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	
	<script>
		
	</script>
</body>
</html>