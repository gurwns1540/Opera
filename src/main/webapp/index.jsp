<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<%-- 	<jsp:forward page="WEB-INF/views/admin/common/adminMain.jsp"/> --%>
	<%-- <jsp:forward page="WEB-INF/views/panel/main/panelMain.jsp"/> --%>
	<a href="adminMain.admin">관리자메인으로</a>
	<a href="panelMain.panel">패널메인으로</a>
</body>
</html>