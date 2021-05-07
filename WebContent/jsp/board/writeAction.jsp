<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="bbs" property="bbsNick" />

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	
		String mem_id = null;
	 /*
	 if(session.getAttribute("mem_id") != null){
		mem_id = (String) session.getAttribute("mem_id");
	}
	 
	if(mem_id == null){ // id가 비어있음 => 로그인이 안 된 상태.
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} else{ // 로그인 한 상태. */
		
		
		if(bbs.getBbsTitle() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if(bbs.getBbsContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else if(bbs.getBbsNick() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('작성자를 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{ // 입력이 다 된 상태.
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), bbs.getBbsNick(), bbs.getBbsContent());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='bbs.jsp'");
				script.println("</script>");
			}
		}
	
	%>
</body>
</html>