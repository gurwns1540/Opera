<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
#inquiryTableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}

.newInquiryTableArea, .inquiryDetailTableArea {
	border-collapse: collapse;
	border: 1px solid #b4b4b4;
	margin-left: auto !important;
}

.newInquiryTableArea>tbody>tr>td, .inquiryDetailTableArea>tbody>tr>td {
	border-top: 1px solid #b4b4b4;
	border-bottom: 1px solid #b4b4b4;
	text-align: center;
}

#inquiryTheadArea {
	background-color: #DBDBDB;
}

#inquiryTheadArea>tr>th {
	height: 25px;
}

#inquiryTbodyArea {
	text-align: center;
}

#inquiryTbodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#inquiryTbodyArea>tr>td {
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
	border: none;
	cursor: pointer;
}

#newInquiryBtn {
	background-color: #00679A;
	border-radius: 5px;
	width: 120px;
	height: 35px;
	color: white;
	border: none;
	cursor: pointer;
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
      <jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
      <section class="container">
      <br />
      <table id="titleTable" height="10px;" width="99%;">
         <tr>
            <td id="menuTitle">내 1:1 문의</td>
            <td id="pagePath">
               <div class="ui breadcrumb">
                  <a class="section" id="depth1" href="panelMain.panel">Home</a>
                  <i class="right angle icon divider"></i>
                  <a class="section" id="depth2" href="notice.panel">고객센터</a>
                  <i class="right angle icon divider"></i>
                  <div class="active section" id="depth3">내 1:1 문의</div>
               </div>  <!-- .ui .breadcrumb end -->
            </td>
         </tr>
      </table>  <!-- #titleTable end -->
      
      <div class="sectionLine">
         <hr>
      </div>  <!-- .sectionLine end -->
         
         <div class="inquiryContentsArea" style="width: 100%;">
            <div class="inquirySearchArea" align="right">
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
            </div>  <!-- inquirySearchArea end -->
            <br />
            <div class="inquiryArea" style="width: inherit;">   
                  <table id="inquiryTableArea" align="center" style="width: inherit;">
                     <thead id="inquiryTheadArea">
                        <tr>
                           <th style="width: 10%;">문의번호</th>
                           <th style="width: 50%;">문의제목</th>
                           <th style="width: 20%;">문의일자</th>
                           <th style="width: 20%;">답변일자</th>
                           
                        </tr>
                     </thead>  <!-- #inquiryTheadArea end -->
                     <tbody id="inquiryTbodyArea">
                     <c:forEach begin="1" end="5" step="1">
                        <tr>
                           <td>84532</td>
                           <td>스낵 선호도 조사</td>
                           <td>2020.01.03</td>
                           <td>답변 대기</td>
                        </tr>
                     </c:forEach>
                        
                     </tbody>  <!-- #inquiryTbodyArea end -->
                  </table>  <!-- #inquiryTableArea end -->
               </div>  <!-- .inquiryArea end -->
               <div class="inquiryBtnArea" align="right" style="margin-top: 15px;">
                  <button id="newInquiryBtn" onclick="location.href='#'">1:1 문의하기</button>
               </div>  <!-- inquiryBtnArea end -->
            <div id="pagingArea" align="center" style="margin-top: 30px;">
                 <span>[처음]</span>
                 <span>[이전]</span>
                 <c:forEach var="i" begin="1" end="5">
                    <span><c:out value="${ i }"/></span>
                 </c:forEach>
                 <span>[다음]</span>
                 <span>[마지막]</span>
              </div>  <!-- #pagingArea end -->
         </div>  <!-- .inquiryContentsArea end -->
      <br />
      </section>  <!-- container end -->
      <%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
   </div>  <!-- wrap end -->

	<div class="ui modal" id="newInquiryModal">
		<i class="close icon"></i>
		<div class="header">문의하기</div>
		<div class="newInquiryArea" style="width: 90%; height: 510px;" align="center">
			<table class="newInquiryTableArea" style="width: inherit; height: inherit;">
				<tbody id="newInquiryTbodyArea">
					<tr>
						<td style="height: 50px;">구분</td>
						<td>:</td>
						<td>
							<input type="radio" name="division" id="signupRadioBtn" value="signup" checked="checked"/> <label for="signupRadioBtn">가입관련</label>
							<input type="radio" name="division" id="researchRadioBtn" value="research" style="margin-left: 10%;"/> <label for="researchRadioBtn">조사관련</label>
							<input type="radio" name="division" id="pointRadioBtn" value="point" style="margin-left: 10%;"/> <label for="pointRadioBtn">포인트관련</label>
							<input type="radio" name="division" id="etcRadioBtn" value="etc" style="margin-left: 10%;"/> <label for="etcRadioBtn">기타</label>
						</td>
					</tr>
					<tr>
						<td style="text-align: center; height: 50px;">성명</td>
						<td>:</td>
						<td><input class="ui input" type="text" name="" style="width: 90%;"/></td>
					</tr>
					<tr>
						<td style="text-align: center; height: 50px;">제목</td>
						<td>:</td>
						<td><input class="ui input" type="text" name="" style="width: 90%;"/></td>
					</tr>
					<tr>
						<td style="height: 350px; vertical-align: top; padding-top: 20px;">내용</td>
						<td style="vertical-align: top; padding-top: 20px;">:</td>
						<td style="vertical-align: top; padding-top: 20px;"><textarea name="" id="" style="width: 90%; height: 90%; resize: none;"></textarea></td>
					</tr>
				</tbody>  <!-- newInquiryTbodyArea end -->
			</table>  <!-- newInquiryTableArea end -->
		</div>  <!-- newInquiryArea end -->
		<div class="actions">
			<div class="ui positive right button">문의하기</div>
			<div class="ui black deny button">취소하기</div>
		</div>  <!-- #actions end -->
	</div>  <!-- newInquiryModal end -->
	
	
	<div class="ui modal" id="inquiryDetailModal">
		<i class="close icon"></i>
		<div class="header">문의내역</div>
		<div class="inquiryDetailArea" style="width: 90%; height: 700px;" align="center">
			<table class="inquiryDetailTableArea" style="width: inherit; height: inherit;">
				<tbody id="inquiryDetailTbodyArea">
					<tr>
						<td style="height: 30px;">구분</td>
						<td>:</td>
						<td><p id="detailDivision" style="text-align: left; margin-left: 5%;">테스트용입니다</p></td>
					</tr>
					<tr>
						<td style="text-align: center; height: 30px;">문의번호</td>
						<td>:</td>
						<td><p id="detailDivision" style="text-align: left; margin-left: 5%;">테스트용입니다</p></td>
					</tr>
					<tr>
						<td style="text-align: center; height: 30px;">성명</td>
						<td>:</td>
						<td><p id="detailDivision" style="text-align: left; margin-left: 5%;">테스트용입니다</p></td>
					</tr>
					<tr>
						<td style="text-align: center; height: 30px;">제목</td>
						<td>:</td>
						<td><p id="detailDivision" style="text-align: left; margin-left: 5%;">테스트입니다</p></td>
					</tr>
					<tr>
						<td style="height: 175px; vertical-align: top; padding-top: 20px;">내용</td>
						<td style="vertical-align: top; padding-top: 20px;">:</td>
						<td style="vertical-align: top; padding-top: 20px;">
							<div name="" id="" style="width: 90%; height: 80%; margin-left: 5%; border: 1px solid #b4b4b4;" >테스트용입니다</div>
							<div align="right" style="width: 90%;">
								<b style="color: gray;">작성일자</b><br />
							</div>
						</td>
					</tr>
					<tr>
						<td style="height: 175px; vertical-align: top; padding-top: 20px;">답변</td>
						<td style="vertical-align: top; padding-top: 20px;">:</td>
						<td style="vertical-align: top; padding-top: 20px;"><div name="" id="" style="width: 90%; height: 80%; margin-left: 5%; border: 1px solid #b4b4b4;" >테스트용입니다</div></td>
					</tr>
				</tbody>  <!-- inquiryDetailTbodyArea end -->
			</table>  <!-- inquiryDetailTableArea end -->
		</div>  <!-- inquiryDetailArea end -->
		<div class="actions">
			<div class="ui positive right button">문의하기</div>
			<div class="ui black deny button">취소하기</div>
		</div>  <!-- #actions end -->
	</div>  <!-- #inquiryDetailModal end -->




	<script>
		$("#inquiryTableArea>#inquiryTbodyArea>tr").hover(function() {
			var tr = $(this);
			var td = $(this).children();
			$(td).css({
				"cursor" : "pointer"
			});
		}).click(function() {
			var tr = $(this);
			var td = tr.children().eq(0).text();
			
			console.log(td);
			$("#inquiryDetailModal").modal("show");
		});
		$("#newInquiryBtn").click(function() {
			$("#newInquiryModal").modal("show");
		});
	</script>
</body>
</html>











