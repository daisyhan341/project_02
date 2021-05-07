<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="game.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>

<jsp:useBean id="getcomment" class="util.Manager"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글관리</title>
<script>
	function commentDelete(gr_num) {
		if(confirm(gr_num + " 댓글을 삭제하시겠습니까?")) {
			location.href = "admin_comment_del_action.jsp?gr_num=" + gr_num;
		}
		return false;
	}
</script>
</head>
<body>
<header><jsp:include page="../header.jsp" flush="false"/></header>
<%
	request.setCharacterEncoding("utf-8");
	// getmember를 통해 가져온 회원 정보를 list 객체에 담기
	ArrayList<ReviewDTO> list = getcomment.getCommentAll();
	for(ReviewDTO reviewDTO : list) {
%>
	댓글번호 : <%=reviewDTO.getGr_num() %><br>
	게임번호 : <%=reviewDTO.getGr_gnum() %><br>
	코멘트 : <%=reviewDTO.getGr_cont() %><br>
	작성자닉네임 : <%=reviewDTO.getGr_nick() %><br>
	등록날짜 : <%=reviewDTO.getGr_date() %><br>
	남긴평점 : <%=reviewDTO.getGr_score() %><br>
	<%--작성자아이디 : <%=reviewDTO.getMem_id() %><br> --%>
	댓글삭제 : <input type="button" value="삭제" onclick="commentDelete('<%=reviewDTO.getGr_num() %>')">

	<br><br>
<%
	}
%>

<footer><jsp:include page="../footer.jsp" flush="false"/></footer>

</body>
</html>