<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.MemDAO"%>
<%@ page import="member.MemDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = (String)session.getAttribute("mem_id");
	if(mem_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다!')");
		script.println("location.href='login.jsp';");
		script.println("</script>");
		script.close();
		//response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemDAO memDAO = new MemDAO();
	MemDTO memDTO = memDAO.info(mem_id);
	
	if(memDTO != null) {
%>
	<!-- 사용자 정보 -->
	아이디 : <%=memDTO.getMem_id() %><br>
	비번 : <%=memDTO.getMem_pw() %><br>
	닉네임 : <%=memDTO.getMem_nick() %><br>
	이메일 : <%=memDTO.getMem_email() %><br>
	휴대폰 : <%=memDTO.getMem_phone() %><br>
	생년월일 : <%=memDTO.getMem_birth() %><br>
	회원그룹 : <%=memDTO.getMem_group() %><br>
	가입날짜 : <%=memDTO.getJoin_date() %>
<%
	}
%>
</body>
</html>