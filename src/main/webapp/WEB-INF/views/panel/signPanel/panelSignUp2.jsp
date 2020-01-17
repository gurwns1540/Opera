<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="/WEB-INF/views/panel/common/head.jsp"%>
<style>
#joinform{
   margin-top: 50px;
   margin-bottom: 50px;
}
#title {
   font-weight: bold;
}

#stitle {
   color: lightgray;
}
h4{
   font-weight: bold;
}
</style>
</head>
<body>
   <div class="wrap">
      <%@ include file="/WEB-INF/views/panel/common/header.jsp"%>
      <form action="" method="post">
      <table align="center" border="solid 1px" id="joinform">
         <tr>
            <td><h1>회원가입</h1></td>
            <td style="width:100px;"></td>
            <td style="width:200px;"></td>
            <td id="stitle"><h3>이용약관</h3></td>
            <td id="title"><h3>정보입력</h3></td>
            <td id="stitle"><h3>가입완료</h3></td>
         </tr>
         <tr>
            <td colspan="6"><hr></td>
         </tr>
         <tr><td><br><br></td></tr>
         <tr>
            <td colspan="2" align="center"><h4>아이디</h4></td>
            <td><input type="text" name="userId"></td>
            <td colspan="3"><button>중복확인</button></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><h4>비밀번호</h4></td>
            <td><input type="password" name="userPwd1"></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><h4>비밀번호 확인</h4></td>
            <td><input type="password" name="userPwd2"></td>
         </tr>
         <tr>
         	<td colspan="2" align="center"><h4>이름</h4></td>
         	<td><input type="text" name="userName"></td>
         </tr>
         <tr>
         	<td colspan="2" align="center"><h4>생년월일</h4></td>
         	<td>
         		<input type="text" name="year" size="5px;">-
         		<input type="text" name="month" size="5px;">-
         		<input type="text" name="day" size="5px;">
         	</td>
         </tr>
         <tr>
         	<td colspan="2" align="center"><h4>성별</h4></td>
         	<td>
         		<select name="gender">
         			<option value="M">남</option>
         			<option value="F">여</option>
         		</select>
         	</td>
         </tr>
         <tr>
         	<td colspan="2" align="center"><h4>휴대전화</h4></td>
         	<td><button>인증하기</button></td>
         </tr>
         <tr>
         	<td colspan="2" align="center"><h4>주소</h4></td>
         	<td colspan="2">
         		<input type="text" name="post" size="7px;">
         		<input type="text" name="address" size="23px;">
         	</td>
         	<td><button>찾기</button></td>
         </tr>
         <tr>
         	<td colspan="2"></td>
         	<td colspan="2">
         		<input type="text" name="" size="35px;">
         	</td>
         </tr>
         <tr>
         	<td colspan="2" align="center"><h4>이메일</h4></td>
         	<td><input type="email" name="email"></td>
         	<td><button>중복확인</button></td>
         </tr>
         <tr>
         	<td colspan="2" align="center"></td>
         </tr>
      </table>
      </form>
   </div>
</body>
</html>










