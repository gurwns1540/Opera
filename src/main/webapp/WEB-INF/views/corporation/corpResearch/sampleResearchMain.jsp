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
		margin-top: 150px;
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
					서브웨이는 조사 목적에 부합하는 신뢰성 높은 응답을 이끌어낼 수 있도록<br>
					전문적이고 체계적인 프로세스를 통해 의뢰하신 설문 문항을 재구성하여<br>
					온라인과 모바일에서 조사 수행이 가능하도록 제공합니다.<br>
					<br>
					서브웨이만의 온라인 설문조사, 지금 바로 체험해보세요!
				</td>
			</tr>
			<tr>
				<td><button id="sampleBtn">설문 체험하기</button></td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	<script>
		$("#researchMenu td div").eq(0).addClass("on");
	</script>
</body>
</html>