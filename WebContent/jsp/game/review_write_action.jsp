<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="game.ReviewDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	// 해당 속성값들을 UTF-8 형식으로 가져옴
	request.setCharacterEncoding("UTF-8");

	// 사용할 속성을 변수로 선언
	int gr_num = 0;
	int gr_gnum = 0;
	String gr_cont = null;
	String gr_nick = null;
	double gr_score = 0;
	String mem_id = null;
	
	// 사용자가 입력한 값 코멘트와 평점이 빈 값이 아니라면, 넘겨쥴 mem_id 값으로 사용자가 입력한 값을 저장
	if (request.getParameter("gr_num") != null) {
		gr_num = Integer.parseInt(request.getParameter("gr_num"));
	}
	
	if (request.getParameter("gr_gnum") != null) {
		gr_gnum = Integer.parseInt(request.getParameter("gr_gnum"));
	}
	
	if (request.getParameter("gr_cont") != null) {
		gr_cont = (String) request.getParameter("gr_cont");
	}
	
	if (request.getParameter("gr_nick") != null) {
		gr_nick = (String) request.getParameter("gr_nick");
	}
	
	if (request.getParameter("gr_score") != "") {
		gr_score = Double.parseDouble(request.getParameter("gr_score"));
	}
	
	if (request.getParameter("mem_id") != null) {
		mem_id = (String) request.getParameter("mem_id");
	}
	
	if (gr_cont == "") {  // gr_cont 값이 비어 있을 때 메세지 출력
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 입력하세요.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	ReviewDAO reviewDAO = new ReviewDAO();  // 전달할 각 속성값을 담을 reviewDTO 객체 생성
	// 입력받은 값을 ReviewDAO.java reviewWrite 함수의 각 매개값으로 전달 후 리턴된 값을 result에 저장
	int result = reviewDAO.reviewWrite(gr_num, gr_gnum, gr_cont, gr_nick, gr_score, mem_id);
	
	// result 값이 1인 경우(1개 댓글 입력 성공 시) 작성 성공 메세지 출력
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글을 달았습니다.')");
		script.println("location.href='/project_02/jsp/game/review_view.jsp?gm_num=" + gr_gnum + "';");
		script.println("</script>");
		script.close();
		return;
	}
%>