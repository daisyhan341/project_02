package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DatabaseUtil;

// DAO(Data Access Object): 데이터베이스에 직접 접근하여 데이터 처리를 하는 클래스, 한 테이블당 하나의 DAO파일 생성
public class MemDAO {
	
	// DB 연결 함수 호출
	Connection conn = DatabaseUtil.getConnection();
	
	// 회원 가입
	public int join(  // 사용할 속성을 변수로 선언
		String mem_id,
		String mem_pw,
		String mem_nick,
		String mem_email,
		String mem_phone,
		String mem_birth,
		String mem_group) {
			try {
				// 데이터베이스에 적용할 SQL문 선언
				String SQL = "INSERT INTO project_02.member(mem_id,mem_pw,mem_nick,mem_email,mem_phone,mem_birth,mem_group,join_date) VALUES(?,?,?,?,?,?,?,sysdate())";
				// SQL문을 실행시키고 실제 데이터베이스에 매개 변수로 들어온 값들을 저장
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				
				// 각 변수에 저장된 값을 SQL문의 ?에 순서대로 삽입
				pstmt.setString(1, mem_id);
				pstmt.setString(2, mem_pw);
				pstmt.setString(3, mem_nick);
				pstmt.setString(4, mem_email);
				pstmt.setString(5, mem_phone);
				pstmt.setString(6, mem_birth);
				pstmt.setString(7, mem_group);
				
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
	
	// 로그인
	public int login(String mem_id, String mem_pw) {  // 비교에 필요한 속성(mem_id, mem_pw)을 변수로 선언
		int check = -1;  // 입력한 id가 데이터베이스에 존재하지 않는 경우
		try {
			// 데이터베이스에 적용할 SQL문 선언
			String SQL = "SELECT * FROM project_02.member WHERE mem_id=?";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			// SQL문의 ?(mem_id) 자리에 mem_id로 저장된 값 삽입
			pstmt.setString(1, mem_id);
			// SQL문을 실행
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("mem_pw").equals(mem_pw)) {
					check = 1; // 입력한 id와 pw가 일치하면 check 값에 1 저장
				} else {
					check = 0; // 입력한 pw가 일치하지 않으면 check 값에 0 저장
				}
			}
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
		return check;  // 최종 check 값(정수)을 login_action.jsp login의 result값으로 전달
	}
	
	//회원정보 출력
	public MemDTO info(String mem_id) {  // 현재 로그인된 회원을 식별할 수 있는 기본키를 변수로 선언
		MemDTO memDTO = new MemDTO();  // 데이터베이스에서 mem_id값과 일치하는 회원 정보를 담을 객체 생성
		try {
			String SQL = "SELECT * FROM project_02.member WHERE mem_id=?";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, mem_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 데이터베이스에서 가져온 각 속성값을 memDTO 객체에 저장
				memDTO = new MemDTO();
				memDTO.setMem_id(rs.getString("mem_id"));
				memDTO.setMem_pw(rs.getString("mem_pw"));
				memDTO.setMem_nick(rs.getString("mem_nick"));
				memDTO.setMem_email(rs.getString("mem_email"));
				memDTO.setMem_phone(rs.getString("mem_phone"));
				memDTO.setMem_birth(rs.getString("mem_birth"));
				memDTO.setMem_group(rs.getString("mem_group"));
				memDTO.setJoin_date(rs.getString("join_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				conn = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memDTO;
	}
}
