<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	function login_fn() {
		location.href='login_action.jsp';
	}
</script>
</head>
<body>
<header><jsp:include page="../header.jsp" flush="false"/></header>

	<h2 class="title">로 그 인</h2>
	<form action="login_action.jsp" method="post">
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
			<td colspan="2"><br><br><button class="btn" onclick="login_fn">로그인</button></td>
		</tr>
		</table>
	</form>
	
<footer><jsp:include page="../footer.jsp" flush="false"/></footer>

</body>
</html>