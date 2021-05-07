<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="game.Game_keywordsDAO"%>
<%@ page import="game.GameDTO"%>
<%@ page import="java.util.Vector"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header><jsp:include page="../header.jsp" flush="false"/></header>

오늘 기분을 선택해주세요.
<form name="gm_keyword" action="ketwords_action.jsp" method="post">
	<label><input type="radio" name="gm_keyword" value="아케이드">아케이드.</label>
	<label><input type="radio" name="gm_keyword" value="전략">전략.</label>
	<label><input type="radio" name="gm_keyword" value="전쟁">전쟁.</label>
	<label><input type="radio" name="gm_keyword" value="액션">액션.</label>
	<label><input type="radio" name="gm_keyword" value="RPG">RPG.</label>
	<label><input type="radio" name="gm_keyword" value="서바이벌">서바이벌.</label>
	<input type="submit" value="전송">
</form>

<footer><jsp:include page="../footer.jsp" flush="false"/></footer>

</body>
</html>