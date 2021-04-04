<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.MemDTO"%>
<%@ page import="member.MemDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = null;
	String mem_pw = null;
	String mem_nick = null;
	String mem_email = null;
	String mem_phone = null;
	String mem_birth = null;
	String mem_group = null;
	
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
	
	if (mem_id == "" || mem_pw == "") {  //null 입력시 오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 또는 비밀번호를 입력해주세요..')");
		script.println("location.href='./index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	if (mem_nick == "" || mem_email == "" || mem_birth == "") {  //null 입력시 오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('필수입력 사항을 확인하세요.')");
		script.println("location.href='../index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	MemDAO memDAO = new MemDAO();
	int result = memDAO.join(mem_id, mem_pw, mem_nick, mem_email, mem_phone, mem_birth, mem_group);
	
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
