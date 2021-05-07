<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="game.GameDAO"%>
<%@ page import="game.GameDTO"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.PrintWriter"%>

<%
	GameDAO gameDAO = new GameDAO();  // 전달할 각 속성값을 담을 GameDTO 객체에 생성	
	// 입력받은 값을 GameDAO.java gamelist 함수의 각 매개값으로 전달 후 리턴된 값을 result에 저장
	Vector<GameDTO> vec = gameDAO.gamelist();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임순위</title>
</head>
<body>
<header><jsp:include page="../header.jsp" flush="false"/></header>
<div class="main_contents">
	<nav><jsp:include page="../nav.jsp" flush="false"/></nav>
	<section>
	<h2 class="title">게 임 순 위</h2>
	<%
		// 리스트 출력
		for (int i=0; i<vec.size(); i++) {  // gameDTO에 담긴 List 항목의 갯수만큼 반복
			GameDTO gameDTO = vec.get(i);
	%>
	<table class="rank_table">
		<tr>
			<td rowspan="4" width="140" valign="top"><a href="review_view.jsp?gm_num=<%=gameDTO.getGm_num()%>"><img src="../images/<%=gameDTO.getGm_num()%>.png"></a></td>
		</tr>
		<tr>
			<td width="80">현재 <%=i+1%> 위</td>
			<td>평점 <%=gameDTO.getGm_mark()%></td>
		</tr>
		<tr>
			<!-- gm_num 값을 전달 후 해당 게임의 상세페이지 출력 -->
			<td class="game_title" colspan="2"><a href="review_view.jsp?gm_num=<%=gameDTO.getGm_num()%>"><%=gameDTO.getGm_name()%></a></td>
		</tr>
		<tr>
			<td class="game_note" colspan="2"><%=gameDTO.getGm_cont()%><%--=gameDTO.getGm_keyword()--%></td>
		</tr>
	</table>
	<%
		}
	%>
	</section>
</div>
<footer><jsp:include page="../footer.jsp" flush="false"/></footer>

</body>
</html>