<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<title>Insert title here</title>
<style>
	body, html {
		margin: 0px;
		height: 100%;
	}
	#accordian {
		background: #003E5C;
		width: 250px;
		margin: 0;
		height: 100%;
		color: white;
		box-shadow: 0 0px 7px 1px rgba(0, 0, 0, 0.6), 0 0 1px rgba(255, 255, 255, 0.5);
			
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
		
		display: inline-block;
		position: fixed;
		top: 50px;
		left: 0;
	}
	
	/* 메뉴 스타일 */
	#accordian h3 {
		font-size: 12px;
		line-height: 55px;
		font-size: 0.7vw;
		border-bottom: 1px solid #003753;
		border-top: 1px solid #003753;
		padding: 0 10px;
		margin: 0;
		cursor: pointer;
		background: #003E5C;
		/* background: linear-gradient(#003040, #002535); */
	}
	#accordian h3:hover {
		text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
	}
	
	/* 아이콘폰트 스타일 */
	#accordian h3 span {
		font-size: 16px;
		margin-right: 10px;
		height: 80px;
	}
	#accordian li {
		list-style-type: none;
	}
	
	/* 서브메뉴 스타일 */
	#accordian ul ul li a {
		color: #87949A;
		text-decoration: none;
		font-size: 0.6vw;
		text-align: right;
		line-height: 50px;
		display: block;
		padding: 0 15px;
		background: #124C67;
		border-top: 1px solid #245972;
		border-bottom: 1px solid #245972;
		-webkit-transition: all 0.15s;
		-moz-transition: all 0.15s;
		-o-transition: all 0.15s;
		-ms-transition: all 0.15s;
		transition: all 0.15s;
	}
	#accordian ul ul li a:hover {
		background: #36677E;
		text-shadow:
		color: white;
	}
	.innerMenu.on a{
		background: #124C67 !important;
		color: white !important;
	}
	.innerMenu.on a:hover {
		background: #36677E !important;
		color: white !important;
	}
	#accordian ul {
		margin: 0;
    	padding: 0;
	}
	/* active 클래스 외에 것은 보이지 않게 하기 */
	#accordian ul ul {
		display: none;
	}
	#accordian li.active ul {
		display: block;
	} 
	/* li active시 */
	#logoArea {
		width: 250px;
	    height: 50px;
	    background: #001E2D;
	    text-align: center;
	    vertical-align: middle;
	    display: table-cell;
	    cursor: pointer;
	}
	#AdminArea {
		width: 250px;
		height: 90px;
		background: #00344F;
		padding-top: 15px;
	}
	
	#AdminImg {
		width: 63px;
		height: 63px;
		border-radius: 50px;
		background: white;
		margin-right: 15px;
	}
	
	#AdminInfo {
		color: white;
	}
	#logoutBtn {
		background: #8F8F8F;
		color: #0F364A;
		border: 0;
		margin-left: 11px;
		margin-bottom: 6px;
		font-size: 9pt;
	}
	#statusBar {
		width: 100%;
		height: 50px;
		background: #008499;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
		
		position: fixed;
	}
	#adminBox {
		display: inline-block;
		position: relative;
		width: 80%;
		top: 110px;
    	left: 315px;
		margin: 30px auto;
		font-size: 1.2vw;
	}
	#adminTitle {
		border-left: 7px solid #008499;
		vertical-align: middle; 
		padding-left: 10px;
	}
	#dayTime {
		top: 0;
		right: 0;
		width: 150px;
		font-size: 10pt;
		position: fixed;
		text-align: center;
	}
	#day, #time { 
		color: white;
	}
	button:focus {
		outline:none;
	}
</style>
</head>
<body>

	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div id="statusBar">
		<div id="logoArea" onclick="location.href='adminMain.admin'">
			<img alt="logo.png" src="${ contextPath }/resources/images/AdminLogo.png" width="100px">
		</div>
		<div id="dayTime">
			<table>
				<tr>
					<td><span id="day"></span></td>
				</tr>
				<tr>
					<td><span id="time"></span></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="accordian">
		
		<div id="AdminArea">
			<table align="center">
				<tr>
					<td><div id="AdminImg"></div></td>
					<td><div id="AdminInfo">오수민<button id="logoutBtn">로그아웃</button>
						<br>as Administrator</div></td>
				</tr>
			</table>
			
		</div>
		<ul id="accordianMenu">
			<li class="topMenu">
				<h3><span class="icon-dashboard"></span>회원관리</h3>
				<ul>
					<li class="innerMenu"><a href="#" style="border-top: 0;">회원정보 관리</a></li>
					<li class="innerMenu"><a href="#" style="border-bottom: 0;">신규 패널 관리</a></li>
				</ul>
			</li>
			<li class="topMenu">
				<h3><span class="icon-tasks"></span>리서치 관리</h3>
				<ul>
					<li class="innerMenu"><a href="researchApprovalWaitList.admin" style="border-top: 0;">리서치 승인 대기 목록</a></li>
					<li class="innerMenu"><a href="#">리서치 결제 대기 목록</a></li>
					<li class="innerMenu"><a href="#">서베이 문항 재구성 대기 목록</a></li>
					<li class="innerMenu"><a href="#">단체 메일링 대기 목록</a></li>
					<li class="innerMenu"><a href="#">폐기 응답 관리</a></li>
					<li class="innerMenu"><a href="#">불량 응답 이의신청 관리</a></li>
					<li class="innerMenu"><a href="#">리서치 보고서 작성 대기 목록</a></li>
					<li class="innerMenu"><a href="#">완료된 리서치 목록</a></li>
					<li class="innerMenu"><a href="#">TS 질문 관리</a></li>
					<li class="innerMenu"><a href="#" style="border-bottom: 0;">패널 PC 환경조사 질문 관리</a></li>
				</ul>
			</li>
			<li class="topMenu">
				<h3><span class="icon-calendar"></span>패널 리워드 관리</h3>
				<ul>
					<li class="innerMenu"><a href="#" style="border-top: 0;">월별 패널 리워드 사용 추이</a></li>
					<li class="innerMenu"><a href="#" style="border-bottom: 0;">리워드 기프티콘 신청 관리</a></li>
				</ul>
			</li>
			<li class="topMenu">
				<h3><span class="icon-heart"></span>Survway 빅데이터</h3>
				<ul>
					<li class="innerMenu"><a href="#" style="border-top: 0;">패널 데이터 분석</a></li>
					<li class="innerMenu"><a href="#" style="border-bottom: 0;">리서치 분석</a></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<script>
		$(function(){
			$("#accordian h3").click(function(){
				$("#accordian ul ul").slideUp();
				if(!$(this).next().is(":visible"))
				{
					$(this).next().slideDown();
				}
			});
		});
		
		// 웹소켓을 지정한 url로 연결한다.
        let sock = new SockJS("<c:url value="/serverTime.web"/>");
        sock.onmessage = onMessage;
        sock.onclose = onClose;

        // 메시지 전송
        function sendMessage() {
               sock.send($("#message").val());
        }

        // 서버로부터 메시지를 받았을 때
        function onMessage(msg) {
        	var data = msg.data;
        	var day = data.split("/")[0];
        	var time = data.split("/")[1];
        	$("#day").text(day);
        	$("#time").text(time);
        }

        // 서버와 연결을 끊었을 때
        function onClose(evt) {
               //$("#data").append("연결 끊김");
        }
	</script>
</body>
</html>