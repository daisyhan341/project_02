package member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

//DAO(Data Access Object): 데이터베이스에 직접 접근하여 데이터 처리를 하는 클래스
public class MemDAO {
	Connection conn = DatabaseUtil.getConnection();
	
	public int join(
		String mem_id,
		String mem_pw,
		String mem_nick,
		String mem_email,
		String mem_phone,
		String mem_birth,
		String mem_group) {
		String SQL = "INSERT INTO project_02.member(mem_id,mem_pw,mem_nick,mem_email,mem_phone,mem_birth,mem_group) VALUES(?,?,?,?,?,?,?)";
	
			try {
				//각 데이터를 실제로 데이터베이스에 삽입
				PreparedStatement insertSQL = conn.prepareStatement(SQL);
				
				//쿼리문의 ?안에 각각의 데이터를 삽입
				insertSQL.setString(1, mem_id);
				insertSQL.setString(2, mem_pw);
				insertSQL.setString(3, mem_nick);
				insertSQL.setString(4, mem_email);
				insertSQL.setString(5, mem_phone);
				insertSQL.setString(6, mem_birth);
				insertSQL.setString(7, mem_group);
				
				//명령어를 수행한 결과(insert 된 데이터 갯수) 반환
				return insertSQL.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;  //에러 발생 시 -1 리턴
		}
}
