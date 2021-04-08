<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.MemDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	// 해당 속성값들을 UTF-8 형식으로 가져옴
	request.setCharacterEncoding("UTF-8");

	// 사용할 속성을 변수로 선언
	String mem_id = null;
	String mem_pw = null;
	String mem_nick = null;
	String mem_email = null;
	String mem_phone = null;
	String mem_birth = null;
	String mem_group = null;
	
	// 사용자가 입력한 값 mem_id을 넘겨 받을 때, 빈 값이 아니라면, 넘겨쥴 mem_id 값으로 사용자가 입력한 값을 저장
	if (request.getParameter("mem_id") != null) {
		mem_id = (String) request.getParameter("mem_id");
	}
	
	if (request.getParameter("mem_pw") != null) {
		mem_pw = (String) request.getParameter("mem_pw");
	}
	
	if (request.getParameter("mem_nick") != null) {
		mem_nick = (String) request.getParameter("mem_nick");
	}
	
	if (request.getParameter("mem_email") != null) {
		mem_email = (String) request.getParameter("mem_email");
	}
	
	if (request.getParameter("mem_phone") != null) {
		mem_phone = (String) request.getParameter("mem_phone");
	}
	
	if (request.getParameter("mem_birth") != null) {
		mem_birth = (String) request.getParameter("mem_birth");
	}
	
	if (request.getParameter("mem_group") != null) {
		mem_group = (String) request.getParameter("mem_group");
	}
	
	if (mem_id == "" || mem_pw == "") {  // 아이디 또는 비밀 번호가 빈 값일 때, 메세지 출력
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 또는 비밀번호를 입력해주세요.')");
		script.println("location.href='../index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	if (mem_nick == "" || mem_email == "" || mem_birth == "") {  // 필수 입력값(닉네임,메일,생일)이 빈 값일 때, 메세지 출력
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('필수입력 사항을 확인하세요.')");
		script.println("location.href='../index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	MemDAO memDAO = new MemDAO();  // 전달할 각 속성값을 담을 memDTO 객체에 생성
	// 입력받은 값을 MemDAO.java join 함수의 각 매개값으로 전달 후 리턴된 값을 result에 저장
	int result = memDAO.join(mem_id, mem_pw, mem_nick, mem_email, mem_phone, mem_birth, mem_group);
	
	// result 값이 1인 경우(1명 가입 성공 시) 가입 성공 메세지 출력
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href='../index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>