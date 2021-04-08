package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	// 데이터베이스 연결
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/project_02?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "my1234";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPW);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
