<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
</head>
<style>
#depth1, #depth2, #depth3, #depth4 {
	color: #494949;
}
#depth1:hover, #depth2:hover, #depth3:hover {
	color: #008499;
	cursor: pointer;
}
/* 여기까지 페이지제목 및 경로 영역 */

.cashOutImgArea {
	width: inherit;
	height: 100px;
	background-color: #98E5FD;
}
.moneyResultArea {
	width: inherit;
	height: 50px;
	background-color: #e5e5e5;
	border-radius: 5px;
}
#resultTableArea {
	width: 100%;
	height: 100%;
}
.result {
	font-size: 16px;
}
#resultName {
	text-align: left;
	padding-left: 5%;
	font-weight: bold;
	width: 40%;
}
#resultMoney {
	text-align: right;
	padding-right: 1%;
	font-size: 20px;
	color: orangered;
	font-weight: bold;
	width: 45%;
}
#resultMoneyKor {
	text-align: left;
	font-weight: bold;
	width: 15%;
}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
		<section class="container">
		<br />
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">캐시아웃 신청</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth3" href="myRewardMain.panel">내 리워드 관리</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth4">캐시아웃 신청</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			<div class="contentsArea" style="width: 100%;">
				<div><b>회원님의 리워드를 캐시아웃 신청하는 공간입니다.</b></div>
				<br />
				<div class="cashOutImgArea">
					나의 보유 리워드 양 : ${Reward.afterChangePoint  }
				</div>  <!-- .cashOutImgArea end -->
				<br />
				<hr />
				<br />
				<div class="cashOutArea">
					<div><b>금액을 선택해주세요</b></div>
					<br />
					<div class="ui buttons moneyArea">
						<c:if test="${Reward.afterChangePoint >=10000 }">
						<button class="ui button active" value="10000">1만원</button>
						</c:if>
						<c:if test="${Reward.afterChangePoint >=20000 }">
						<button class="ui button" value="20000">2만원</button>
						</c:if>
						<c:if test="${Reward.afterChangePoint >=30000 }">
						<button class="ui button" value="30000">3만원</button>
						</c:if>
						<c:if test="${Reward.afterChangePoint >=40000 }">
						<button class="ui button" value="40000">4만원</button>
						<</c:if>
						<c:if test="${Reward.afterChangePoint >=50000 }">
						<button class="ui button" value="50000">5만원</button>
						</c:if>
					</div>
					<br /><br />
					
					<div class="moneyResultArea">
						<table id="resultTableArea">
							<tr>
								<c:if test="${Reward.afterChangePoint >=10000 }">
								<td class="result" id="resultName">신청 금액</td>
								<td class="result" id="resultMoney">10000</td>
								<td class="result" id="resultMoneyKor">원</td>
								</c:if>
								<c:if test="${Reward.afterChangePoint <10000}">
								<td class="result" id="resultMoney">신청할수 있는 금액이 없습니다.</td>
								</c:if>
							</tr>
						</table>
					</div>  <!-- moneyResultArea end -->
					<br /><br />
					<div class="btnArea" align="center">
						<button class="ui blue button" id="apply">신청하기</button>
					</div>
				</div>  <!-- cashOutArea end -->
			</div>  <!-- .contentsArea end -->
			<script>
				$(".moneyArea").children().click(function(){
					$(".moneyArea").children().removeClass("active");
								$(this).addClass("active");
								$("#resultMoney").text($(this).val());
					
				});
				
				/* $("#apply").click(function(){
					var cash = $(".moneyArea").find(".active").val();
					console.log(cash);
					Swal.fire('확인', '정말로 캐시아웃을 신청하시겠습니까?', 'success').then(function(){
						 location.href="applyRewardCashOut.myPage?num="+cash; 	
					});
				}); */
				$("#apply").click(function(){
					var cash = $(".moneyArea").find(".active").val();
					console.log(cash);
					Swal.fire({
						  title: '캐시아웃 신청',
						  text: '한번 사용한 리워드는 반환되지 않습니다.',
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '신청',
						  cancelButtonText: '취소'
						}).then(result =>{
						  if(result.value){
						  console.log("123"); 
							$.ajax({
								url: "applyRewardCashOut.myPage",
								type: "post",
								data: {
									cash:cash
								},
								success: function(data){
									console.log(data.num);
									if(data.num >0){
										 Swal.fire(
											      '신청 완료!',
											      '회원님의 캐시아웃이 성공적으로 신청이 완료되었습니다.',
											      'success'
											    )
									}else{
										Swal.fire(
											      '신청 실패!',
											      '회원님의 캐시아웃 신청이 실패되었습니다.',
											      'error'
											    )
									}
								},
								error: function(){
									console.log("ajax에러");
								}
							});
						  }
						}); 	
						
					/* const swalWithBootstrapButtons = Swal.mixin({
						  customClass: {
						    confirmButton: 'btn btn-success',
						    cancelButton: 'btn btn-danger'
						  },
						  buttonsStyling: false
						})

						swalWithBootstrapButtons.fire({
						  title: '캐시아웃을 신청하겠습니까',
						  text: "한번 사용한 리워드는 반환되지 않습니다.",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonText: '신청',
						  cancelButtonText: '취소',
						  reverseButtons: true
						}).then((result) => {
							
						  if (result.value) {
							  $.ajax({
									url: "applyRewardCashOut.myPage",
									type: "post",
									data: {
										cash:cash
									},
									success: function(data){
										console.log(data.num);
										if(data.num >0){
											swalWithBootstrapButtons.fire(
												      '신청완료!',
												      '회원님의 캐시아웃 신청을 완료하였습니다.',
												      'success'
												    )
										}else{
											swalWithBootstrapButtons.fire(
												      '신청에러!',
												      '회원님의 캐시아웃 신청을 실패하였습니다.',
												      'success'
												    )
										}
									},
									error: function(){
										console.log("ajax에러");
									}
								});
						    
						  } else if (
						    
						    result.dismiss === Swal.DismissReason.cancel
						  ) {
						    swalWithBootstrapButtons.fire(
						      '신청 취소',
						      '회원님의 캐시아웃 신청이 취소되었습니다.',
						      'error'
						    )
						  }
						}) */
				});
				
				
				
			</script>
			
		
		<br />
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>  <!-- wrap end -->
</body>
</html>












