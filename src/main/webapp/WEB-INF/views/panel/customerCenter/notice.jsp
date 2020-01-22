<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
</head>
<style>
#noticeTableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}

#noticeTheadArea {
	background-color: #DBDBDB;
}

#noticeTheadArea>tr>th {
	height: 25px;
}

#noticeTbodyArea {
	text-align: center;
}

#noticeTbodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#noticeTbodyArea>tr>td {
	height: 45px;
}

.ui.input {
	height: 30px;
}

#searchBtn {
	background-color: #00679A;
	border-radius: 5px;
	width: 65px;
	height: 30px;
	color: white;
}

/*페이징 css */
#pagingArea {
	margin-top: 40px;
	/* 드래그 방지용 소스*/
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
	/* 드래그 방지용 소스*/
}

#pagingArea span {
	margin-left: 5px;
	margin-right: 5px;
	font-size: 10pt;
}

#pagingArea span:hover {
	margin-left: 5px;
	margin-right: 5px;
	font-size: 10pt;
	cursor: pointer;
}
/* 페이징 css end */
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
		<section class="container">
			<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">공지사항</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a> <i
								class="right angle icon divider"></i> <a class="section"
								id="depth2" href="notice.panel">고객센터</a> <i
								class="right angle icon divider"></i>
							<div class="active section" id="depth3">공지사항</div>
						</div>
					</td>
				</tr>
			</table>

			<div class="sectionLine">
				<hr>
			</div>

			<div class="noticeContentsArea" style="width: 100%;">
				<div class="noticeSearchArea" align="right">
					<table>
						<tr>
							<td>
								<h4>검색어</h4>
							</td>
							<td></td>
							<td></td>
							<td>
								<div class="ui input">
									<input type="search" name="" />
								</div>
							</td>
							<td>
								<button id="searchBtn">검색</button>
							</td>
						</tr>
					</table>
				</div>
				<!-- noticeSearchArea end -->
				<br />
				<div class="noticeArea ui styled fluid accordion" style="width: inherit;">
					<table id="noticeTableArea" align="center" style="width: inherit;">
						<thead id="noticeTheadArea">
							<tr>
								<th style="width: 10%;">번호</th>
								<th style="width: 60%;">제목</th>
								<th style="width: 10%;">조회수</th>
								<th style="width: 20%;">작성일</th>

							</tr>
						</thead>
						<!-- #noticeTheadArea end -->
							<tbody id="noticeTbodyArea">
								<c:forEach begin="1" end="5" step="1">
									<tr class="title" style="color:black !important; font-weight:normal;">
										<td>10</td>
										<td>12월 추천 이벤트 당첨자 발표</td>
										<td>1</td>
										<td>2020.01.03</td>
									</tr>
									<tr class="content">
										<td colspan="4">
											<span style="text-align: center;">
												얼마나 오아이스도 인간은 대고, 미묘한 뜨고, 설산에서 곳으로 사막이다. 않는 청춘의 안고, 그와 끓는 밥을
												되려니와, 부패뿐이다. 것은 그들은 영원히 굳세게 영락과 속에서 때에, 황금시대다. 같이, 장식하는 밝은
												거선의 부패뿐이다. 새가 인생의 대고, 인간에 인생을 아니더면, 따뜻한 힘있다. 위하여, 사람은 미묘한 품에
												풍부하게 공자는 못하다 사막이다. 두기 쓸쓸한 물방아 때까지 가치를 것은 우리의 원대하고, 있는가? 이 온갖
												피에 위하여 행복스럽고 뜨거운지라, 끓는 없으면, 보라. 천지는 노년에게서 인간의 소리다.이것은 쓸쓸한 피고,
												발휘하기 오직 사막이다. 있음으로써 주며, 군영과 것은 같이, 가치를 할지니, 철환하였는가? 갑 같이 귀는
												긴지라 심장의 인간은 피가 것은 쓸쓸하랴? 있는 타오르고 바이며, 사막이다. 내는 이 하였으며, 위하여 물방아
												위하여 같이, 품었기 뿐이다. 그러므로 지혜는 고행을 길을 생생하며, 청춘의 가지에 크고 봄바람이다. 풍부하게
												주며, 두손을 시들어 소담스러운 청춘에서만 내려온 피가 피어나기 칼이다. 트고, 아름답고 영락과 우리는
												듣는다. 기관과 반짝이는 청춘을 노년에게서 대중을 청춘의 밥을 있다. 그러므로 피어나기 뜨거운지라, 바로 피가
												것이다. 이 꽃이 기관과 사는가 노래하며 것이다. 만천하의 풍부하게 주며, 끝에 있으며, 바이며, 인류의
												위하여서. 원질이 얼마나 스며들어 얼마나 그들은 수 쓸쓸하랴? 기쁘며, 풀이 그러므로 예수는 심장의 그러므로
												할지니, 때문이다. 같은 별과 구하지 있음으로써 것이다. 공자는 튼튼하며, 그들은 청춘의 있는 곧 무엇을
												평화스러운 있을 봄바람이다. 구하지 역사를 얼마나 남는 되려니와, 가장 것은 있으랴? 남는 뛰노는 천고에
												때문이다. 되는 곳으로 아니더면, 피다. 보이는 타오르고 보이는 위하여 황금시대다. 길을 현저하게 이것은 이상
												때문이다. 소금이라 우리 맺어, 것은 이것이다.
											</span>
										</td>
									</tr>
								</c:forEach>
	
							</tbody>
						<!-- #noticeTbodyArea end -->
					</table>
					<!-- #noticeTableArea end -->
				</div>
				<!-- .noticeArea end -->
				<div id="pagingArea" align="center" style="margin-top: 50px;">
					<span>[처음]</span> <span>[이전]</span>
					<c:forEach var="i" begin="1" end="5">
						<span><c:out value="${ i }" /></span>
					</c:forEach>
					<span>[다음]</span> <span>[마지막]</span>
				</div>
				<!-- #pagingArea end -->
			</div>
			<!-- .noticeContentsArea end -->
			<br />






		</section>
		<!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>
	<!-- wrap end -->
	
	<script>
		$('.ui.accordion').accordion();
	</script>
</body>
</html>









































