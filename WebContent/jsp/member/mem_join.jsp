<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function login_fn() {
		location.href='mem_join_action.jsp';
	}
</script>
</head>
<body>
<header><jsp:include page="../header.jsp" flush="false"/></header>
	<!-- 사용자 정보 입력 폼 -->
	<h2 class="title">회 원 가 입</h2>
	<form action="mem_join_action.jsp" method="post">
		<table class="join_table">
		<tr>
			<td>아 이 디</td>
			<td><input type="text" name="mem_id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mem_pw"></td>
		</tr>
		<tr>
			<td>닉 네 임</td>
			<td><input type="text" name="mem_nick"></td>
		</tr>
		<tr>
			<td>이 메 일</td>
			<td><input type="text" name="mem_email"></td>
		</tr>
		<tr>
			<td>휴 대 폰</td>
			<td><input type="text" name="mem_phone" placeholder="010-1234-5678"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="mem_birth" placeholder="19870711"></td>
		</tr>
		<%-- tr>
			<td>유저그룹</td>
			<td><input type="text" name="mem_group"></td>
		</tr --%>
		<tr>
			<td colspan="2"><br><br><button class="btn" onclick="join_fn">가입하기</button></td>
		</tr>	
		</table>
	</form>
<footer><jsp:include page="../footer.jsp" flush="false"/></footer>

</body>
</html>