<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#approvalBtnArea {
		position: relative;
		right: 10px;
		height: 30px;
		float: right;
		margin-bottom: 10px;
	}
	#approvalBtnArea button {
		width: 130px;
		height: 30px;
		background: #EDEBEB;
		font-size: 10pt;
	}
	#searchInput {
		margin-top: 10px;
	}
	#searchInput, .ui.action.input {
		width: 200px;
		height: 37px;
		font-size: 11pt;
		position: relative;
		right: 10px;
		float: right;
	}
	#adminBoxTable {
		width: 100%;
	}
	#listTable {
		width: 100%;
		border-spacing: 0;
		border-collapse: collapse;
		margin-top: 10px;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
	}
	#listTable th {
		font-size: 11pt;
		height: 40px;
	}
	#listTable td {
		font-size: 11pt;
		height: 50px;
	}
	#tableTitle {
		background: #DBDBDB;
		border-top: 1px solid #454545;
	}
	.tableContext {
		border-top: 1px solid #AEAEAE;
		border-bottom: 1px solid #AEAEAE;
		text-align: center;
	}
	#pagingArea {
		margin-top: 40px;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
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
	.detail {
		font-size: 9pt;
		background: #EDEBEB;
		width: 80px;
		height: 30px;
	}
  	#sortable { 
  		list-style-type: none; 
  		margin: 0; 
  		padding: 0; 
  		width: 60%;
  		margin: 0 auto; 
  		margin-bottom: 30px;
  	}
  	#sortable li { 
  		margin: 0 5px 12px 5px;
  		padding: 10px; 
  		font-size: 1.2em; 
  		height: fit-content;
  		border-radius: 7px;
  	}
 	html>body #sortable li { 
	  	height: fit-content;
	  	line-height: 1.2em; 
	}
  	.ui-state-highlight { 
  		height: 3.5em; 
  		line-height: 1.2em; 
  	}
  	.ui-sortable-placeholder {
  		background: white !important;
  		border-color: white !important;
  	}
  	#outbreak {
  		margin: 20px auto;
  		width: 70%;
  		height: 10%;
  		border-radius: 7px;
  		border: 1px solid #C5C5C5;
  		background: #F6F6F6;
  		padding: 15px;
  		margin-top: 30px;
  	}
  	#choice, .choice {
  		margin: 0 auto;
  		margin-top: 20px;
  		width: fit-content;
  	}
  	#corpTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#corpTable th {
  		width: 30%;
  		height: 50px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#corpTable td {
  		width: 40%;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#panelTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#panelTable th {
  		width: 30%;
  		height: 50px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#panelTable td {
  		width: 40%;
  		border-bottom: 1px solid #C5C5C5;
  	}
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<table id="adminBoxTable">
			<tr>
				<td>
					<div id="approvalBtnArea">
					
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						회원 정보 관리
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="searchInput">
						<div class="ui action input">
			  				<input type="text" placeholder="Search...">
							<button class="ui icon button">
								<i class="search icon"></i>
							</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<table id="listTable">
			<tr id="tableTitle">
				<th style="width: 10%;">회원 번호</th>
				<th style="width: 15%;">회원 분류</th>
				<th style="width: 30%;">패널명 / 기업명</th>
				<th style="width: 25%;">패널 등급</th><!-- 기업회원 시 기업 회원이라고 명시 -->
				<th style="width: 10%;">가입일</th>
				<th style="width: 10%;">상세보기</th>
			</tr>
			<tr class="tableContext">
				<td>3723</td>
				<td>기업</td>
				<td>(주) 오렌지레드 컴퍼니</td>
				<td>기업 회원</td>
				<td>2019-06-22</td>
				<td><button class="detail">상세 보기</button></td>
			</tr>
			<c:forEach var="i" begin="0" end="8">
				<tr class="tableContext">
					<td>회원 번호</td>
					<td>회원 분류</td>
					<td>패널명 / 기업명</td>
					<td>패널 등급</td>
					<td>가입일</td>
					<td><button class="detail">상세 보기</button></td>
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
	
	<div class="ui modal" id="panel">
		<div class="header">패널 회원</div>
		<div class="scrolling content">
			<div>
				<table id="panelTable">
					<tr>
						<th>패널 번호</th>
						<td colspan="3">77092</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td colspan="3">윤재영</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td colspan="3">yychani</td>
					</tr>
					<tr>
						<th>패널 등급</th>
						<td colspan="3">활성 회원</td>
					</tr>
					<tr>
						<th style="width: 10%">생년월일</th>
						<td style="width: 40%">1994-11-12</td>
						<th style="width: 10%">성별</th>
						<td style="width: 40%">남성</td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td colspan="3">010-5534-8519</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3">yychani94@gmail.com</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">06269/서울 강남구 남부순환로363길 12-37/B102호</td>
					</tr>
					<tr>
						<th>최근 리서치 참여일</th>
						<td colspan="3">2020-01-16</td>
					</tr>
					<tr>
						<th>회원정보 수정일</th>
						<td colspan="3">2020-01-13</td>
					</tr>
					<tr>
						<th>보유 리워드 량</th>
						<td colspan="3">375 p</td>
					</tr>
					<tr>
						<th>캐시아웃 량</th>
						<td colspan="3">20000원</td>
					</tr>
					<tr>
						<th>3진 아웃 경고 횟수</th>
						<td colspan="3">0 회</td>
					</tr>
					<tr>
						<th>캐시아웃 계좌 번호</th>
						<td colspan="3">043-110409-01-026(기업)</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	
	<div class="ui modal" id="corp">
		<div class="header">기업 회원</div>
		<div class="scrolling content">
			<div>
				<table id="corpTable">
					<tr>
						<th>기업 번호</th>
						<td colspan="2">3723</td>
					</tr>
					<tr>
						<th>기업명</th>
						<td colspan="2">(주) 오렌지레드 컴퍼니</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td colspan="2">orangeRed</td>
					</tr>
					<tr>
						<th>사업자 등록 번호</th>
						<td>214-88-49333</td>
						<td><button id="companyPictureBtn" style="height: 28px; font-size: 9pt; background: #EDEBEB;">사업자 등록증 보기</button></td>
					</tr>
					<tr>
						<th>소재지</th>
						<td colspan="2">06234/서울 강남구 테헤란로14길 6/2층 C클래스</td>
					</tr>
					<tr>
						<th>마케팅부 담당자 명</th>
						<td colspan="2">김진호</td>
					</tr>
					<tr>
						<th>담당자 휴대폰 번호</th>
						<td colspan="2">010-7660-7771</td>
					</tr>
					<tr>
						<th>담당자 이메일</th>
						<td colspan="2">programmer7771@gmail.com</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	
	<div class="ui tiny modal" id="companyPicture">
		<div class="header">기업 회원</div>
		<div class="scrolling content">
			<div>
				사진 영역
			</div>
		</div>
		<div class="actions">
			<div class="ui button">Download</div>
		    <div class="ui cancel button" id="companyPictureClose">Cancel</div>
  		</div>
	</div>
	
	<script>
		$("#companyPictureBtn").on("click", function(){
			$("#companyPicture").modal("show");
		})
		$("#companyPictureClose").on("click",function(){
			$('#corp').modal('show');
		})
		$("#nextBtn").on("click", function(){
			$('#research').modal('show');
		});
		$(".detail").on("click", function(){
			var num = $(this).parent().siblings().eq(0).text();
			var type = $(this).parent().siblings().eq(1).text();
			if(type == '기업'){
				$('#corp').modal('show');
			}else{
				$('#panel').modal('show');
			}
			
			//console.log(num);
		});
		$("#approvalBtn").on("click", function(){
			Swal.fire({
			  title: '정말 승인하시겠습니까?',
			  text: "이 결정은 되돌릴 수 없습니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
			    Swal.fire(
			      '승인!',
			      '이 리서치는 승인되었습니다.',
			      'success'
			    )
			  }else {
				  $('#research').modal('show');
			  }
			})
		});
		$("#referBtn").on("click", function(){
			const start = async function() {
				const { value: text } = await Swal.fire({
					  input: 'textarea',
					  inputPlaceholder: '반려 사유를 적어주세요..',
					  inputAttributes: {
					    'aria-label': 'Type your message here'
					  },
					  showCancelButton: true,
					  inputValidator: (value) => {
					    if (!value) {
					      return '반려 사유를 꼭 적어주세요!'
					    }
					  }
				});
	
				if (text) {
					Swal.fire({
					  title: '정말 반려하시겠습니까?',
					  text: "이 결정은 되돌릴 수 없습니다!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes'
					}).then((result) => {
					  if (result.value) {
						  Swal.fire(
				      		'반려!',
				      		'이 리서치는 반려되었습니다.',
				      		'success'
				    		)
					  }else {
						  $('#research').modal('show');
					  }
					})
				}
			}
			start();
		});
		
		$(".topMenu:nth-child(1)").addClass("active");
		$(".topMenu:nth-child(1)").find(".innerMenu:nth-child(1)").addClass("on");
	</script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  		/* $(function() {
		 	$( "#sortable" ).sortable({
		 		placeholder: "ui-state-highlight"
		 	});
		 	$( "#sortable" ).disableSelection();
		 }); */
  	</script>
</body>
</html>