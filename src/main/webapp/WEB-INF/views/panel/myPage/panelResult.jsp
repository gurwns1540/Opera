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
	</c:if>
	<c:if test="${ empty param.message }">
		<script>
			Swal.fire('에러', '잘못된 접근입니다!', 'error');
		</script>
	</c:if>
</body>