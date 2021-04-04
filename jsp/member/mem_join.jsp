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
		<input type="text" name="mem_id">
		<input type="password" name="mem_pw">
		<input type="text" name="mem_nick">
		<input type="text" name="mem_email">
		<input type="text" name="mem_phone">
		<input type="text" name="mem_birth">
		<!-- <input type="text" name="mem_group"> -->
		<input type="submit" value="전송">
	</form>
</body>
</html>
