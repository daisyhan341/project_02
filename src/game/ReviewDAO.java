package game;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;  // List 인터페이스를 구현한 클래스, 각 요소를 List 형식으로 저장 가능

import util.DatabaseUtil;

// DAO(Data Access Object): 데이터베이스에 직접 접근하여 데이터 처리를 하는 클래스, 한 테이블당 하나의 DAO파일 생성
public class ReviewDAO {
	
	// DB 연결 함수 호출
	Connection conn = DatabaseUtil.getConnection();
	
	// 게임상세페이지 평가 리스트 출력
	public Vector<ReviewDTO> reviewList() {  // 리턴 형식이 Vector<ReviewDTO>인 메소드 선언
		Vector<ReviewDTO> v = new Vector<ReviewDTO>();  // 데이터베이스에서 가져온 ReviewDTO 속성값을 저장할 객체 생성 
		
		try {
			// 데이터베이스에 적용할 SQL문 선언
			String SQL = "SELECT * FROM project_02.gamereview ORDER BY gr_num DESC";  // 평점 기준으로 내림차순 출력
			// SQL문을 실행시키고 실제 데이터베이스에 매개 변수로 들어온 값들을 저장
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// SQL문을 실행
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// 데이터베이스에서 가져온 각 속성값을 ReviewDTO 객체에 저장
				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setGr_num(rs.getInt("gr_num"));
				reviewDTO.setGr_gnum(rs.getInt("gr_gnum"));
				reviewDTO.setGr_cont(rs.getString("gr_cont"));
				reviewDTO.setGr_nick(rs.getString("gr_nick"));
				reviewDTO.setGr_date(rs.getString("gr_date"));
				reviewDTO.setGr_score(rs.getDouble("gr_score"));
				reviewDTO.setMem_id(rs.getString("mem_id"));
				
				v.add(reviewDTO);  // reviewDTO 값을 v에 하나씩 추가
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
	
	// 게임상세페이지 평가 남기기
	public int reviewWrite(  // 사용할 속성을 변수로 선언
	int gr_num,
	int gr_gnum,
	String gr_cont,
	String gr_nick,
	double gr_score,
	String mem_id) {
		try {
			// 데이터베이스에 적용할 SQL문 선언
			String SQL = "INSERT INTO project_02.gamereview(gr_num,gr_gnum,gr_cont,gr_nick,gr_score,mem_id,gr_date) VALUES(?,?,?,?,?,?,sysdate())";
			// SQL문을 실행시키고 실제 데이터베이스에 매개 변수로 들어온 값들을 저장
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			// 각 변수에 저장된 값을 SQL문의 ?에 순서대로 삽입
			pstmt.setInt(1, gr_num);
			pstmt.setInt(2, gr_gnum);
			pstmt.setString(3, gr_cont);
			pstmt.setString(4, gr_nick);
			pstmt.setDouble(5, gr_score);
			pstmt.setString(6, mem_id);
			
			// 명령어를 수행한 결과(insert 된 데이터 갯수, 1명=1) 반환
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();  // 데이터베이스와 연결 종료(커밋 후에는 반드시 연결 종료를 선언 할것)
				conn = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;  // 에러 발생 시 -1 리턴
	}
}
