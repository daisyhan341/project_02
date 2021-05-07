<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="game.Game_keywordsDAO"%>
<%@ page import="game.GameDTO"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header><jsp:include page="../header.jsp" flush="false"/></header>
이런게임은 어떠세요?
<table>
    <tr>
        <!-- <td>게임 순위</td> -->
        <td>게임 제목</td>
        <td>게임 설명</td>
        <td>게임 평점</td>
        <td>키워드</td>
    </tr>
    
<%
	String gm_keyword = (String) request.getParameter("gm_keyword");
	
	Game_keywordsDAO game_keywordsDAO = new Game_keywordsDAO();
	Vector<GameDTO> vec = game_keywordsDAO.keywordsGamelist(gm_keyword);
%>
	<%
		// 해당 키워드를 가진 게임 리스트 출력
		for (int i=0; i<vec.size(); i++) {  // gameDTO에 담긴 List 항목의 갯수만큼 반복
			GameDTO gameDTO = vec.get(i);			
	%>
	<tr>
	    <!-- <td><%=i+1%></td> -->
	    <!-- gm_num 값을 전달 후 해당 게임의 상세페이지 출력 -->
	    <td><%=gameDTO.getGm_name()%></td>
	    <td><%=gameDTO.getGm_cont()%></td>
	    <td><%=gameDTO.getGm_mark()%></td>
	    <td><%=gameDTO.getGm_keyword()%></td>
	</tr>
<%		
	}
%>
</table>
</body>
</html>