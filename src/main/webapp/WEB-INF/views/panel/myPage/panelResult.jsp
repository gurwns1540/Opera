<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<body>
	<c:if test="${ !empty param.message }">
		<c:if test="${ param.message eq 'pwdSuccess' }">
			<script>
				Swal.fire('수정완료', '비밀번호 수정이 완료되었습니다<br>다시 로그인 해주세요', 'success').then(function(){
					location.href="panelMain.panel";
				});
			</script>
		</c:if>
		<c:if test="${ param.message eq 'dropSuccess' }">
			<script>
				Swal.fire('탈퇴완료', '정상적으로 탈퇴 완료 되었습니다<br>이용해 주셔서 감사합니다', 'success').then(function(){
					location.href="panelMain.panel";
				});
			</script>
		</c:if>
		<c:if test="${ param.message eq 'loginFail' }">
			<script>
				Swal.fire('로그인 실패', '로그인 정보가 일치하지 않습니다', 'warning').then(function(){
					location.href="panelLogin.panel";
				});
			</script>
		</c:if>
		<c:if test="${ param.message eq 'logoutSuccess' }">
			<script>
				Swal.fire('로그아웃성공', '정상적으로 로그아웃 되었습니다.', 'success').then(function(){
					location.href="panelMain.panel";
				});
			</script>
		</c:if>
	</c:if>
	<c:if test="${ empty param.message }">
		<script>
			Swal.fire('에러', '잘못된 접근입니다!', 'error');
		</script>
	</c:if>
</body>