<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.Manager"%>

<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = (String) request.getParameter("mem_id");
	
	Manager manager = new Manager();
	int result = manager.memberDel(mem_id);
	
	if(result > 0) {
		out.println("<script>alert('삭제 성공!')</script>");
		out.println("<script>location.href = 'admin_mem.jsp'</script>");
		
	} else {
		out.println("<script>alert('삭제 실패!')</script>");
		out.println("<script>location.href = 'admin_mem.jsp'</script>");
	}
%>