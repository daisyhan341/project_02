<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%	
	request.setCharacterEncoding("UTF-8");
	// 현재 접속한 회원(mem_id)의 세션 정보를 변수에 저장
	String mem_id = (String)session.getAttribute("mem_id");
	
	// 로그아웃 상태
	if(session.getAttribute("mem_id") == null) {
%>

<!-- 로그아웃 상태일 때 출력할 내용 -->
<a href="member/mem_join.jsp">회원가입</a>
<a href="member/login.jsp">로그인</a>
<a href="game/review_list.jsp">게임 순위</a>
<%	
	// 로그인 상태
	} else {  
%>

<!-- 로그인 상태일 때 출력할 내용 -->
<%=mem_id%> 님 반갑습니다.
<a href="member/mem_info.jsp">회원정보</a>
<a href="member/logout.jsp">로그아웃</a>  
<a href="game/review_list.jsp">게임 순위</a>
<% } %>
