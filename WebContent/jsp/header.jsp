<link rel="stylesheet" href="/project_02/jsp/style.css">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.MemDTO"%>
<%@ page import="member.MemDAO"%>
<%	
	request.setCharacterEncoding("UTF-8");
	// 현재 접속한 회원(mem_id)의 세션 정보를 변수에 저장
	String mem_id = (String)session.getAttribute("mem_id");
	
	// 로그아웃 상태
	if(session.getAttribute("mem_id") == null) {
%>
<div class="menu_bar">
	<!-- 로그아웃 상태일 때 출력할 내용 -->
	<a href="/project_02/jsp/index.jsp">홈으로</a>
	<a href="/project_02/jsp/member/mem_join.jsp">회원가입</a>
	<a href="/project_02/jsp/member/login.jsp">로그인</a>
	<a href="/project_02/jsp/game/review_list.jsp">게임 순위</a>
	<a href="/project_02/jsp/game_keywords/keywords.jsp">게임추천</a>
	<a href="/project_02/jsp/board/bbs.jsp">게시판</a>
</div>
<%	
	}
	
	MemDAO memDAO2 = new MemDAO();
	MemDTO memDTO2 = memDAO2.info(mem_id);
	String mem_group = memDTO2.getMem_group();
	
	// 로그인 상태
	if(session.getAttribute("mem_id") != null) {		
%>
<!-- 로그인 상태일 때 출력할 내용 -->
	<div class="menu_bar">
	<%=mem_id%> 회원님 반갑습니다. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/project_02/jsp/index.jsp">홈으로</a>
	<a href="/project_02/jsp/member/mem_info.jsp">회원정보</a>
	<a href="/project_02/jsp/member/logout.jsp">로그아웃</a>  
	<a href="/project_02/jsp/game/review_list.jsp">게임 순위</a>
	<a href="/project_02/jsp/game_keywords/keywords.jsp">게임추천</a>
	<a href="/project_02/jsp/board/bbs.jsp">게시판</a>
<%
		// 로그인 상태이면서 회원 그룹이 ADMIN일 때 출력할 내용
		if(mem_group.equals("ADMIN")) {
%>
		<a href="/project_02/jsp/admin/admin_mem.jsp">회원관리</a>
		<a href="/project_02/jsp/admin/admin_comment.jsp">댓글관리</a>
<%		
		}
	}
%>
</div>


