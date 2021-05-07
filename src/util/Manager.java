package util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.MemDTO;
import game.ReviewDTO;


public class Manager {
	
	Connection conn = DatabaseUtil.getConnection();
	
	// 회원리스트 출력
	public ArrayList<MemDTO> getMemberAll() {
		ArrayList<MemDTO> list = new ArrayList<MemDTO>();  // 회원 정보가 담길 list 객체 생성
		try {
			String SQL = "SELECT * FROM project_02.member";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery(SQL);
			
			while(rs.next()) {
				MemDTO memDTO = new MemDTO();
				memDTO.setMem_id(rs.getString("mem_id"));
				memDTO.setMem_nick(rs.getString("mem_nick"));
				memDTO.setMem_email(rs.getString("mem_email"));
				memDTO.setMem_phone(rs.getString("mem_phone"));
				memDTO.setMem_birth(rs.getString("mem_birth"));
				memDTO.setMem_group(rs.getString("mem_group"));
				memDTO.setJoin_date(rs.getString("join_date"));
				list.add(memDTO);
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
		return list;
	}
	
	// 회원 삭제
	public int memberDel(String mem_id) {
		String SQL = "DELETE FROM project_02.member WHERE mem_id = ?";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, mem_id);
			result = pstmt.executeUpdate();
			
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
		return result;
	}
	
	// 댓글리스트 출력
		public ArrayList<ReviewDTO> getCommentAll() {
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();  // 댓글 정보가 담길 list 객체 생성
			try {
				String SQL = "SELECT * FROM project_02.gamereview";
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery(SQL);
				
				while(rs.next()) {
					ReviewDTO reviewDTO = new ReviewDTO();
					reviewDTO.setGr_num(rs.getInt("gr_num"));
					reviewDTO.setGr_gnum(rs.getInt("gr_gnum"));
					reviewDTO.setGr_cont(rs.getString("gr_cont"));
					reviewDTO.setGr_nick(rs.getString("gr_nick"));
					reviewDTO.setGr_date(rs.getString("gr_date"));
					reviewDTO.setGr_score(rs.getDouble("gr_score"));
					reviewDTO.setMem_id(rs.getString("mem_id"));
					list.add(reviewDTO);
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
			return list;
		}
	
	// 댓글 삭제
	public int commentDel(int gr_num) {
		String SQL = "DELETE FROM project_02.gamereview WHERE gr_num = ?";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, gr_num);
			result = pstmt.executeUpdate();
			
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
		return result;
	}
}

