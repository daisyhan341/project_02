<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.io.PrintWriter"%>

<%
	// 다른 페이지처럼 함수를 호출하여 사용할 수 없는 이유는 gm_num를 데이터베이스에서 뽑아오는 것이아니라 review_list 페이지에서 넘겨온 값을 그대로 전달해야하기 때문
	
	// 데이터베이스 접속 정보
	String dbURL = "jdbc:mysql://localhost:3306/project_02?serverTimezone=UTC";
	String dbID = "root";
	String dbPW = "my1234";
	Class.forName("com.mysql.jdbc.Driver");
	
	// 게시물을 구분할 유일한 값(기본키 gm_num)을 담을 변수 생성
	int gm_num = Integer.parseInt(request.getParameter("gm_num"));

	try {
		// 데이터베이스 연결
		Connection conn = DriverManager.getConnection(dbURL,dbID,dbPW );
		Statement stmt = conn.createStatement();
		
		// gm_num 값을 전달 받아 데이터베이스에 있는 해당 gm_num을 가진 게임의 속성값을 가져옴
		String SQL = "SELECT gm_name, gm_cont, gm_mark, gm_keyword FROM game WHERE gm_num="+ gm_num;
		ResultSet result = stmt.executeQuery(SQL);
		
		// 가져온 속성값을 변수에 저장
		if(result.next()) {
			String gm_name = result.getString("gm_name");
			String gm_cont = result.getString("gm_cont");
			double gm_mark = result.getDouble("gm_mark");
			String gm_keyword = result.getString("gm_keyword"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	제목: <%=gm_name%><br>
	내용: <%=gm_cont%><br>
	평점: <%=gm_mark%><br>
	키워드: <%=gm_keyword%>
</body>
</html>

<%
		}
	conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>