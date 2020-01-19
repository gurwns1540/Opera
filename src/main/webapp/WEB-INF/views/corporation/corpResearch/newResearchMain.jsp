<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mainArea {
		width: 100%;
		height: 100vh;
		background-image: url("resources/images/corpMain.png");
		background-repeat: no-repeat;
		background-size: cover;
		margin-top: 10px;
		padding-top: 20px;
	}
	#researchMenuArea {
		margin: 0 auto;
		width: 70%;
	}
	#researchMenu {
		width: 100%;
	}
	#researchMenu td {
		width: 33%;
		margin: 0 auto;
		color: #C4C4C4;
		font-size: 22px;
		text-align: center;
	}
	#researchMenu td div{
		height: 35px;
		margin: auto;
		width: 60%;
		text-align: center;
		border: 2px solid rgba(0, 0, 0, 0);
	}
	#researchMenu td div:hover {
		cursor: pointer;
		color: white;
		/* text-decoration: underline;
		text-underline-position: under; */
		border-bottom: 2px solid #C4C4C4; 
	}
	#btnArea {
		width: 60%;
		margin: 0 auto;
		text-align: left;
		color: white;
		font-size: 27px;
		margin-top: 150px;
	}
	.on {
		cursor: pointer !important;
		color: white !important;
		border-bottom: 2px solid #C4C4C4 !important; 
	}
	#intro {
		line-height: 65px;
	}
	#sampleBtn {
		border: 1px solid white;
		color: #EDEBEB;
		background: none;
		width: 172px; 
		height: 43px;
		float: right;
		margin-top: 85px;
		font-size: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<div id="mainArea">
		<div id="researchMenuArea">
			<table id="researchMenu">
				<tr>
					<td><div onclick="location.href='sampleResearchMain.corp'">Survway 리서치 체험</div></td>
					<td><div onclick="location.href='newResearchMain.corp'">새 리서치 신청</div></td>
					<td><div onclick="location.href='previousResearchMain.corp'">리서치 의뢰 이력</div></td>
				</tr>
			</table>
		</div>
		<table id="btnArea">
			<tr>
				<td id="intro">
					서브웨이의 전문적이고 체계적인 설문조사 프로세스를 통해<br>
					신뢰성 있는 설문 결과를 도출하고<br>
					자체 빅데이터 분석 시스템을 통해<br>
					정확하고 유의미한 분석 결과를 제공합니다.<br>
					<br>
					서브웨이만의 온라인 리서치, 지금 바로 신청하세요!<br>
				</td>
			</tr>
			<tr>
				<td><button id="sampleBtn">조사 신청하기</button></td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	<script>
		$("#researchMenu td div").eq(1).addClass("on");
	</script>
</body>
</html>