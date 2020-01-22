<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
.ui.selection.dropdown {
	min-width: 80px;
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
            <div class="inquiryArea ui styled fluid accordion" style="width: inherit;">   
                  <table id="inquiryTableArea" align="center" style="width: inherit;">
                     <thead id="inquiryTheadArea">
                        <tr>
                           <th style="width: 10%;">문의번호</th>
                           <th style="width: 20%;">카테고리</th>
                           <th style="width: 40%;">문의제목</th>
                           <th style="width: 20%;">문의일자</th>
                           <th style="width: 10%;">답변일자</th>
                           
                        </tr>
                     </thead>  <!-- #inquiryTheadArea end -->
                     <tbody id="inquiryTbodyArea">
                     <c:forEach begin="1" end="5" step="1">
                        <tr class="title" style="color:black !important; font-weight:normal;">
                           <td>84532</td>
                           <td>리워드</td>
                           <td>리워드 캐시아웃 관련 질문입니다. </td>
                           <td>2020.01.03</td>
                           <td>답변 대기</td>
                        </tr>
                        <tr class="content">
							<td colspan="5">
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
                        
                     </tbody>  <!-- #inquiryTbodyArea end -->
                  </table>  <!-- #inquiryTableArea end -->
               </div>  <!-- .inquiryArea end -->
               <div class="inquiryBtnArea" align="right" style="margin-top: 15px;">
                  <button id="newInquiryBtn">1:1 문의하기</button>
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
		<form action="inquirywrite.panel" method="post" id="inquery">
		<div class="newInquiryArea" style="width: 90%; height: 510px;" align="center">
			<table class="newInquiryTableArea" style="width: inherit; height: inherit;">
				<tbody id="newInquiryTbodyArea">
					<tr>
						<td style="height: 50px;">구분</td>
						<td>:</td>
						<td style="text-align: left;">
							<div class="ui selection dropdown" style="margin-left: 31px;">
								<input type="hidden" name="inquiryCategoryNo">
								<i class="dropdown icon"></i>
								<div class="default text" data-value="0">선택</div>
								<div class="menu">
									<div class="item" data-value="1">가입</div>
									<div class="item" data-value="2">조사</div>
									<div class="item" data-value="3">리워드</div>
									<div class="item" data-value="4">기타</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: center; height: 50px;">성명</td>
						<td>:</td>
						<td style="text-align:left; padding-left: 25px;">
							${loginUser.userName }
							<input type="hidden" name="mno" value="${loginUser.mno}">
						</td>
					</tr>
					<tr>
						<td style="text-align: center; height: 50px;">제목</td>
						<td>:</td>
						<td><input class="ui input" type="text" name="inquiryTitle" style="width: 90%;"/></td>
					</tr>
					<tr>
						<td style="height: 350px; vertical-align: top; padding-top: 20px;">내용</td>
						<td style="vertical-align: top; padding-top: 20px;">:</td>
						<td style="vertical-align: top; padding-top: 20px;"><textarea name="inquiryContext" id="" style="width: 90%; height: 90%; resize: none;"></textarea></td>
					</tr>
				</tbody>  <!-- newInquiryTbodyArea end -->
			</table>  <!-- newInquiryTableArea end -->
		</div>  <!-- newInquiryArea end -->
			</form>	  <!-- form end -->
		<div class="actions">
			<div class="ui positive right button" id="question">문의하기</div>
			<div class="ui black deny button">취소하기</div>
		</div>  <!-- #actions end -->
	</div>  <!-- newInquiryModal end -->
	
	


	<script>
		$('.ui.accordion').accordion();
		$("#newInquiryBtn").click(function() {
			$("#newInquiryModal").modal("show");
		});

		 $("#question").click(function(){
			 $("#inquery").submit();
			
		}); 
		var isActivated = "false";
		$('.ui.dropdown').mouseenter(function(){
			if(isActivated == "false"){
				$(this).dropdown();
			}
			isActivated = "true";
		})
		<c:if test="${success > 0}">
		Swal.fire(
               '완료!',
               '1:1 문의 등록이 완료 되었습니다',
               'success'
             )
        </c:if>
	</script>
</body>
</html>











