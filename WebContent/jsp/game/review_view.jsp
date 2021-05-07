<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.io.PrintWriter"%>

<%@ page import="game.ReviewDAO"%>
<%@ page import="game.ReviewDTO"%>
<%@ page import="member.MemDAO"%>
<%@ page import="member.MemDTO"%>
<%@ page import="java.util.Vector"%>

<%
	// 다른 페이지처럼 함수를 호출하여 사용할 수 없는 이유는
	// gm_num를 데이터베이스에서 뽑아오는 것이아니라 review_list 페이지에서 넘겨온 값을 그대로 링크주소로 받아야 하기 때문
	
	// 데이터베이스 접속 정보
	String dbURL = "jdbc:mysql://localhost:3306/project_02?serverTimezone=UTC";
	String dbID = "root";
	String dbPW = "my1234";
	Class.forName("com.mysql.jdbc.Driver");
	
	// 데이터베이스 연결
	Connection conn = DriverManager.getConnection(dbURL,dbID,dbPW );
	Statement stmt = conn.createStatement();
	
	// 게시물을 구분할 유일한 값(기본키 gm_num)을 담을 변수 생성
	int gm_num = Integer.parseInt(request.getParameter("gm_num"));
	String mem_id = (String)session.getAttribute("mem_id");
	
	ReviewDAO reviewDAO = new ReviewDAO();  // 전달할 각 속성값을 담을 ReviewDTO 객체에 생성	
	// 입력받은 값을 ReviewDAO.java reviewList 함수의 각 매개값으로 전달 후 리턴된 값을 result에 저장
	Vector<ReviewDTO> vec = reviewDAO.reviewList();
	
	MemDAO memDAO = new MemDAO();
	MemDTO memDTO = memDAO.info(mem_id);
	

	try {
		// gm_num 값을 전달 받아 데이터베이스에 있는 해당 gm_num을 가진 게임의 속성값을 가져옴
		String SQL = "SELECT gm_name, gm_cont, gm_mark, gm_keyword FROM game WHERE gm_num="+ gm_num;
		ResultSet rs = stmt.executeQuery(SQL);
		
		
		// 가져온 속성값을 변수에 저장
		if(rs.next()) {
			String gm_name = rs.getString("gm_name");
			String gm_cont = rs.getString("gm_cont");
			double gm_mark = rs.getDouble("gm_mark");
			String gm_keyword = rs.getString("gm_keyword");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=gm_name%></title>
<script type="text/javascript">
	function reply_fn() {
		location.href='review_write_action.jsp';
	}
	
	function commentDelete(gr_num) {
		if(confirm("댓글을 삭제하시겠습니까?")) {
			location.href = "review_del_action.jsp?gr_num=" + gr_num;
		}
		return false;
	}
</script>
</head>
<body>
<header><jsp:include page="../header.jsp" flush="false"/></header>
<div class="main_contents">
	<nav><jsp:include page="../nav.jsp" flush="false"/></nav>
	<section>
	<h2 class="title"><%=gm_name %></h2>
	<table class="rank_table">
		<tr>
			<td rowspan="4" width="140" valign="top"><img src="../images/<%=gm_num %>.png"></td>
		</tr>
		<tr>
			<td width="100">평점 <%=gm_mark %></td>
			<td>키워드 : <%=gm_keyword%></td>
		</tr>
		<tr>
			<td class="game_title" colspan="2"><%=gm_name %></td>
		</tr>
		<tr>
			<td class="game_note" colspan="2"><%=gm_cont %><%--=gameDTO.getGm_keyword()--%></td>
		</tr>
<%
	}
%>

<%
		// 로그인 중일 때
		if(session.getAttribute("mem_id") != null) {
			MemDAO memDAO2 = new MemDAO();
			MemDTO memDTO2 = memDAO2.info(mem_id);
			String mem_nick = memDTO2.getMem_nick();
			String gr_nick = mem_nick;
%>
		<tr><td colspan="3">
			<table class="reply_box">
				<tr><td>
				<form action="review_write_action.jsp" method="post">
					<input type="text" name="gr_cont" class="reply_write"><br><br>
					별점 &nbsp;&nbsp;&nbsp; <input type="text" name="gr_score" class="reply_score" placeholder="0.0"><br>
					<input type="hidden" name="gr_gnum" value="<%=gm_num %>">
					<input type="hidden" name="mem_id" value="<%=mem_id %>">
					<input type="hidden" name="gr_nick" value="<%=gr_nick %>">
					<button class="reply_btn" onclick="reply_fn">댓글 남기기</button>
				</form>
				</td></tr>
			</table>
		</td></tr>
		
		<tr><td colspan="3"><h2 class="title_reply">댓 글</h2></td></tr>
<%
		for (int i=0; i<vec.size(); i++) {  // reviewDTO에 담긴 List 항목의 갯수만큼 반복
			ReviewDTO reviewDTO = vec.get(i);
			// gm_num 값과 가져온 gr_gnum를 비교하여 값이 같을 때만 리뷰를 출력(해당 게임 번호의 리뷰만 출력)
			if(gm_num == reviewDTO.getGr_gnum()) {
				mem_id = reviewDTO.getMem_id();
%>
			<tr><td colspan="3">
				<table class="reply_box">
					<tr>
					<%-- <td width="30"><%=reviewDTO.getGr_num()%></td>--%>
					<td width="80"><%=reviewDTO.getMem_id()%></td>
					<td width="400"><%=reviewDTO.getGr_date()%></td>
					<td>별점 : <%=reviewDTO.getGr_score()%></td>
					<%
						if(session.getAttribute("mem_id").equals(reviewDTO.getMem_id())) {
					%>
					<td>
					<input type="button" value="x" onclick="commentDelete('<%=reviewDTO.getGr_num() %>')">
					</td>
					<%
						}
					%>
					</tr>
					<tr>
					<td colspan="4" class="reply_con"><%=reviewDTO.getGr_cont()%></td>
					</tr>
				</table>					
			</td></tr>
<%
			}
		}
		}
		// 로그아웃 중일 때
		else {
			MemDAO memDAO2 = new MemDAO();
			MemDTO memDTO2 = memDAO2.info(mem_id);
			String mem_nick = memDTO2.getMem_nick();
			String gr_nick = mem_nick;
%>
			<tr><td colspan="3"><h2 class="title_reply">댓 글</h2></td></tr>
			
			<%
			for (int i=0; i<vec.size(); i++) {  // reviewDTO에 담긴 List 항목의 갯수만큼 반복
				ReviewDTO reviewDTO = vec.get(i);
				// gm_num 값과 가져온 gr_gnum를 비교하여 값이 같을 때만 리뷰를 출력(해당 게임 번호의 리뷰만 출력)
				if(gm_num == reviewDTO.getGr_gnum()) {
					mem_id = reviewDTO.getMem_id();
			%>
			<tr><td colspan="3">
				<table class="reply_box">
					<tr>
					<%-- <td width="30"><%=reviewDTO.getGr_num()%></td>--%>
					<td width="80"><%=reviewDTO.getMem_id()%></td>
					<td width="400"><%=reviewDTO.getGr_date()%></td>
					<td>별점 : <%=reviewDTO.getGr_score()%></td>	
					</tr>
					<tr>
					<td colspan="4" class="reply_con"><%=reviewDTO.getGr_cont()%></td>
					</tr>
				</table>					
			</td></tr>		
<%
				}
			}
		}
%>
				
<%
	conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			conn.close();
			conn = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
	</table>
	</section>
</div>
<footer><jsp:include page="../footer.jsp" flush="false"/></footer>

</body>
</html>