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
	<link rel="stylesheet" href="style.css">
</head>
<body>
<!-- 공통으로 사용하는 헤더 영역 가져오기 -->
<header><jsp:include page="header.jsp" flush="true"/></header>

<div class="main_contents">
	<nav></nav>
	
	<section><jsp:include page="section.jsp"/></section>
	
	<aside></aside>
</div>

<!-- 공통으로 사용하는 푸터 영역 가져오기 -->
<footer><jsp:include page="footer.jsp"/></footer>

</body>
</html>