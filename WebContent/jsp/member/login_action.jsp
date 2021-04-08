<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.MemDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	// 해당 속성값들을 UTF-8 형식으로 가져옴
	request.setCharacterEncoding("UTF-8");

	// 사용할 속성을 변수로 선언
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	
	MemDAO memDAO = new MemDAO();  // 전달할 각 속성값을 담을 MemDTO 객체에 생성	
	// 입력받은 값을 MemDAO.java login 함수의 각 매개값으로 전달 후 리턴된 값을 result에 저장
	int result = memDAO.login(mem_id, mem_pw);
	
	if (result == 1) {  // 아이디와 비밀번호 일치
		PrintWriter script = response.getWriter();
		session.setAttribute("mem_id", mem_id);
		script.println("<script>");
		script.println("alert('로그인 성공!')");
		script.println("location.href='../index.jsp';");
		script.println("</script>");
		script.close();
		
	} else if (result == 0) {  // 비밀번호 틀림
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 또는 비밀번호를 확인해주세요.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		
	} else {  // 아이디 조회 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 또는 비밀번호를 확인해주세요.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>