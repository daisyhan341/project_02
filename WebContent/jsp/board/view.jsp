<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="member.MemDTO" %>
<%@ page import="member.MemDAO" %>

<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<meta charset="UTF-8" http-equiv="Content-Type">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>게시판</title>
</head>
<body>
<header><jsp:include page="../header.jsp" flush="false"/></header>
<br>

<%
	/*
	조회수 관련 -> 보류
	try{
		
	int no = Integer.parseInt(request.getParameter("bbsID"));

	BbsDAO dao = new BbsDAO();
	
	//조회수 1증가
	dao.rndCount(no);
	} catch(NumberFormatException e){
		e.printStackTrace();
	} */
	
	
	String userID=null;
	if(session.getAttribute("bbsNick") != null){
		userID = (String) session.getAttribute("bbsNick");
	}
	
	int bbsID=0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	
	BbsDAO bbsDAO = new BbsDAO();
	int count = bbs.getRnd();
	int result = bbsDAO.rndCount(bbsID,count);
	
	if(bbsID==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
	
%>
<%-- <%= count%> --%>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center;
			border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="4" style="background-color:#eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%">글제목</td>
						<td colspan="3"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="3"><%= bbs.getBbsNick() %></td>
					</tr>
					<tr>
						<td>작성 일자</td>
						<td><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분" %></td>
						<td>조회수</td>
						<td><%= bbs.getRnd() %></td>
					</tr>
					<tr>
						<td style="height: 350px">내용</td>
						<td colspan="3" style="min-height:200px; text-align:left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			
			<%
			//ADMIN 이라면 삭제버튼
				String mem_id = (String)session.getAttribute("mem_id");
			
				MemDAO memDAO = new MemDAO();
				MemDTO memDTO = memDAO.info(mem_id);
				String mem_group = memDTO.getMem_group();
				 if(mem_group.equals("ADMIN")){
			%>
				<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
				<a onClick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			
			<%
				 }
			%>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기"/>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>  