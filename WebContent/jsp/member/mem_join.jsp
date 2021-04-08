<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 사용자 정보 입력 폼 -->
	<form action="mem_join_action.jsp" method="post">
		아이디 : <input type="text" name="mem_id"><br>
		비번 : <input type="password" name="mem_pw"><br>
		닉네임 : <input type="text" name="mem_nick"><br>
		이메일 : <input type="text" name="mem_email"><br>
		휴대폰 : <input type="text" name="mem_phone"><br>
		생년월일 : <input type="text" name="mem_birth"><br>
		<!-- <input type="text" name="mem_group"> -->
		<input type="submit" value="전송">
	</form>
</body>
</html>