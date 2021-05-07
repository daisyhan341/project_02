<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.MemDAO"%>
<%@ page import="member.MemDTO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	
</head>
<body>
<!-- 공통으로 사용하는 헤더 영역 가져오기 -->
<%-- flush="false"는 버퍼에 저장된 내용을 지우지 않고 남겨둠(header파일을 include 할때 중요한 옵션) --%>
<header><jsp:include page="header.jsp" flush="false"/></header>

<div class="main_contents">
	<nav><jsp:include page="nav.jsp" flush="false"/></nav>
	
	<section><jsp:include page="section.jsp" flush="false"/></section>
	
	<aside></aside>
</div>

<!-- 공통으로 사용하는 푸터 영역 가져오기 -->
<footer><jsp:include page="footer.jsp" flush="false"/></footer>

</body>
</html>