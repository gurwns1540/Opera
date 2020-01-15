<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<jsp:forward page="WEB-INF/views/admin/common/adminMain.jsp"/>
	<%-- <div class="wrap">
		<%@ include file="WEB-INF/views/common/header.jsp" %>
		<section class="container">
		<br />
		메인컨테이너 입니다.
		<br />
		</section>  <!-- container end -->
		<%@ include file="WEB-INF/views/common/footer.jsp" %>
	</div>  <!-- wrap end --> --%>
</body>
</html>