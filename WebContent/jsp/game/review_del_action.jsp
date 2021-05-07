<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.Manager"%>

<%
	request.setCharacterEncoding("UTF-8");
	int gr_num = Integer.parseInt(request.getParameter("gr_num"));
	
	Manager manager = new Manager();
	int result = manager.commentDel(gr_num);
	
	if(result > 0) {
		out.println("<script>alert('삭제 성공!')</script>");
		out.println("<script>location.href = 'review_list.jsp'</script>");
		
	} else {
		out.println("<script>alert('삭제 실패!')</script>");
		out.println("<script>location.href = 'review_list.jsp'</script>");
	}
%>