package game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;  // List 인터페이스를 구현한 클래스, 각 요소를 List 형식으로 저장 가능

import util.DatabaseUtil;

// DAO(Data Access Object): 데이터베이스에 직접 접근하여 데이터 처리를 하는 클래스, 한 테이블당 하나의 DAO파일 생성
public class GameDAO {
	
	// DB 연결 함수 호출
	Connection conn = DatabaseUtil.getConnection();
	
	// 게임리스트 출력
	public Vector<GameDTO> gamelist() {  // 리턴 형식이 Vector<GameDTO>인 메소드 선언
		Vector<GameDTO> v = new Vector<GameDTO>();  // 데이터베이스에서 가져온 GameDTO 속성값을 저장할 객체 생성 
		
		try {
			// 데이터베이스에 적용할 SQL문 선언
			String SQL = "SELECT *FROM project_02.game ORDER BY gm_mark DESC";  // 평점 기준으로 내림차순 출력
			// SQL문을 실행시키고 실제 데이터베이스에 매개 변수로 들어온 값들을 저장
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// SQL문을 실행
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				// 데이터베이스에서 가져온 각 속성값을 GameDTO 객체에 저장
				GameDTO gameDTO = new GameDTO();
				gameDTO.setGm_num(rs.getInt("gm_num"));
				gameDTO.setGm_name(rs.getString("gm_name"));
				gameDTO.setGm_cont(rs.getString("gm_cont"));
				gameDTO.setGm_thn(rs.getString("gm_thn"));
				gameDTO.setGm_mark(rs.getDouble("gm_mark"));
				gameDTO.setGm_rmd(rs.getInt("gm_rmd"));
				gameDTO.setGm_keyword(rs.getString("gm_keyword"));
				
				v.add(gameDTO);  // gameDTO 값을 v에 하나씩 추가
			}
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				conn = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return v;
	}
}
