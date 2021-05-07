package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPassword = "my1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//로그인 메소드.
	public int login(String userID, String userPassword) {
		String SQL = "SELECT mem_pw FROM USER WHERE mem_id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치.
				}
			}
			return -1; // 아이디가 없음.
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스가 없음.
	}
	
	//회원가입 메소드
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getMem_id());
			pstmt.setString(2, user.getMem_pw());
			pstmt.setString(3, user.getMem_nick());
			pstmt.setString(4, user.getMem_email());
			pstmt.setString(5, user.getMem_gender());
			pstmt.setString(6, user.getMem_phone());
			pstmt.setString(7, user.getMem_birth());
			pstmt.setString(8, user.getMem_group());
			pstmt.setString(9, user.getJoin_date());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // 데이터베이스 오류
	}

}
