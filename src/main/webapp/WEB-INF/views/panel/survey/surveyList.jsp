<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
	
	#titleTable {
		marin 0 auto;
	}
	
	#menuTitle {
		height:30px;
		width:400px;
		font-size:13pt;
	}
	
	#pagePath {
		width:700px;
	}
	
	
		
	
</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
		<table id="titleTable" border="1px solid black">
			<tr >
				<td id="menuTitle">참여한 설문조사</td>		<td id="pagePath">HOME > 마이페이지 > 참여한 설문조사</td>
			</tr>
		</table>
		
		
		
		
		
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>









































