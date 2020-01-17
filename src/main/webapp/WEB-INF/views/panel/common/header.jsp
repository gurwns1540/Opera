<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<header class="headerArea">
	<table class="headerTableArea" align="center">
		<tr>
			<td class="headerLogoArea">
				<a href="panelMain.panel"><img src="resources/images/headerLogo.png" alt="" id="logoImg" /></a>
			</td>
			<td class="smallLogoArea">
				<img src="resources/images/smallLogo.png" alt="" id="logo2Img" />
			</td>
			<td class="headerLoginArea">
				<c:choose>
					<c:when test="${ not empty loginMember }">
						<a href="#" style="margin-right: 5%;">로그아웃</a>
						<a href="#">내 정보 관리</a>
					</c:when>
					<c:otherwise>
						<a href="panelLogin.panel" style="margin-right: 5%;">로그인</a>
						<a href="panelSignup.panel">회원가입</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>  <!-- headerTableArea end -->
</header>  <!-- headerArea end -->
<nav class="navArea">
	<div class="navContainer">
		<div class="ui four inverted item menu" id="nav">
			<div class="ui simple dropdown item" style="border-left: 1px solid #b4b4b4; height: 35px;">
				안 &nbsp;&nbsp;&nbsp;&nbsp;내
				<div class="menu">
					<a href="#" class="item">혜택 안내</a>
			    	<a href="#" class="item">조사참여 방법 안내</a>
				</div>
			</div>
			<div class="ui simple dropdown item" style="border-left: 1px solid #b4b4b4; height: 35px;">
		   		 서베이
		    	<div class="menu">
			    	<a href="#" class="item">menu1</a>
			    	<a href="#" class="item">menu2</a>
			    	<a href="#" class="item">menu3</a>
		    	</div>
		  	</div>
			<div class="ui simple dropdown item" style="border-left: 1px solid #b4b4b4; height: 35px;">
		   		 마이페이지
		    	<div class="menu">
			    	<a href="#" class="item">menu1</a>
			    	<a href="#" class="item">menu2</a>
			    	<a href="#" class="item">menu3</a>
		    	</div>
		  	</div>
			<div class="ui simple dropdown item" style="border-left: 1px solid #b4b4b4; border-right: 1px solid #b4b4b4; height: 35px;">
		   		 고객센터
		    	<div class="menu">
			    	<a href="#" class="item">공지사항</a>
			    	<a href="#" class="item">자주묻는 질문</a>
			    	<a href="#" class="item">1:1 문의</a>
		    	</div>
		  	</div>
		</div>
	</div>  <!-- navContainer end -->
</nav>  <!-- navArea end -->