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

<table>
    <tr>
        <td>게임 순위</td>
        <td>게임 제목</td>
        <td>게임 설명</td>
        <td>게임 평점</td>
        <td>키워드</td>
    </tr>
<%
	// 리스트 출력
	for (int i=0; i<vec.size(); i++) {  // gameDTO에 담긴 List 항목의 갯수만큼 반복
		GameDTO gameDTO = vec.get(i);
%>
	<tr>
	    <td> <%=i+1%> </td>
	    <!-- gm_num 값을 전달 후 해당 게임의 상세페이지 출력 -->
	    <td><a href="review_view.jsp?gm_num=<%=gameDTO.getGm_num()%>"> &nbsp; <%=gameDTO.getGm_name()%></a></td>
	    <td><%=gameDTO.getGm_cont()%></td>
	    <td><%=gameDTO.getGm_mark()%></td>
	    <td><%=gameDTO.getGm_keyword()%></td>
	</tr>
<%
	}
%>
</table>