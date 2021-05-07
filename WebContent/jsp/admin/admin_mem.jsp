<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.MemDTO"%>
<%@page import="java.util.ArrayList"%>

<jsp:useBean id="getmember" class="util.Manager"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script>
	function idDelete(mem_id) {
		if(confirm(mem_id + " 회원을 정말 삭제하시겠습니까?")) {
			location.href = "admin_mem_del_action.jsp?mem_id=" + mem_id;
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
	ArrayList<MemDTO> list = getmember.getMemberAll();
	for(MemDTO memDTO : list) {
%>
	아이디 : <%=memDTO.getMem_id() %><br>
	닉네임 : <%=memDTO.getMem_nick() %><br>
	이메일 : <%=memDTO.getMem_email() %><br>
	휴대폰 : <%=memDTO.getMem_phone() %><br>
	생일 : <%=memDTO.getMem_birth() %><br>
	회원그룹 : <%=memDTO.getMem_group() %><br>
	가입날짜 : <%=memDTO.getJoin_date() %><br>
	회원삭제 : <input type="button" value="삭제" onclick="idDelete('<%=memDTO.getMem_id() %>')">

	<br><br>
<%
	}
%>

<footer><jsp:include page="../footer.jsp" flush="false"/></footer>

</body>
</html>