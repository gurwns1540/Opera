<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
<style>
	#listArea {
		width: 90%;
		margin: 0 auto;
		margin-top: 50px;
	}
	#listArea div {
		margin: 20px auto;
		width: fit-content;
	}
	#mainTitle {
		font-size: 30px;
	}
	#subTitle {
		font-size: 20px;
	}
	#searchArea {
		width: 80%;
		margin: 50px auto;
		margin-bottom: 100px;
	}
	#statusSelect {
		width: fit-content;
		float: left;
	}
	#selectBoxArea {
		width: fit-content;
		float: right;
	}
	#listMainArea {
		width: 100%;
		height: 800px;
	}
	.menu.transition.visible {
		height: 150px;
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
	#researchTable {
		margin: 40px auto;
		margin-top: 150px;
		width: 80%;
		border-spacing: 0;
		border-collapse: collapse;
		text-align: center;
	}
	#researchTable th {
		background: #F0F0F0;
  		height: 50px;
  		border-top: 1px solid #C5C5C5;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#researchTable td {
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar2.jsp"/>
	<div id="listMainArea">
		<div id="listArea">
			<div id="mainTitle">리서치 의뢰 이력</div>
			<div id="subTitle">리서치 이력 확인 및 작성한 설문들을 활용할 수 있습니다.</div>
		</div>
		
		<div id="searchArea">
			<div id="statusSelect">
	
				<div class="ui clearable multiple selection dropdown">
				  	<input type="hidden" name="language">
				  	<i class="dropdown icon"></i>
				  	<div class="default text">Select Status</div>
				  	<div class="menu">
				    	<div class="item">전체</div>
				    	<div class="item">승인 대기중</div>
				    	<div class="item">납부 대기중</div>
				    	<div class="item">재구성 대기중</div>
				    	<div class="item">검토 대기중</div>
				    	<div class="item">메일링 대기중</div>
				    	<div class="item">리서치 진행중</div>
				    	<div class="item">리서치 완료</div>
				  	</div>
				</div>
			</div>
			<div id="selectBoxArea">
				<div class="ui action input">
	  				<input type="text" placeholder="Search...">
					<button class="ui icon button">
						<i class="search icon"></i>
					</button>
				</div>
			</div>
		</div>
		<table id="researchTable">
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 40%;">프로젝트명</th>
				<th style="width: 10%;">진행상태</th>
				<th style="width: 10%;">결제금액</th>
				<th style="width: 10%;">결제상태</th>
				<th style="width: 10%;">조사기간</th>
				<th style="width: 10%;">설문내용</th>
			</tr>
			<c:forEach begin="0" end="3">
				<tr>
					<td>번호</td>
					<td>프로젝트명</td>
					<td>진행상태</td>
					<td>결제금액</td>
					<td>결제상태</td>
					<td>조사기간</td>
					<td>설문내용</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<span>[처음]</span>
			<span>[이전]</span>
			<c:forEach var="i" begin="1" end="10">
				<span><c:out value="${ i }"/></span>
			</c:forEach>
			<span>[다음]</span>
			<span>[마지막]</span>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	<script>
		$('.clearable.example .ui.selection.dropdown').dropdown({
			clearable: true
		});
		$('.multiple.selection.dropdown').dropdown({
		    allowAdditions: true,
		    maxSelections: 3
		  });
		
		$("#researchMenu td div").eq(2).addClass("on");
	</script>

</body>
</html>