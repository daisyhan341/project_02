package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class BbsDAO {
	Connection conn = DatabaseUtil.getConnection();
	private ResultSet rs;

//	public BbsDAO() {
//		try {
//			String dbURL = "jdbc:mysql://218.156.8.245:3306/project_02?serverTimezone=UTC";
////			String dbURL = "jdbc:mysql://localhost:3306/bbs";
//			String dbID = "root";
//			String dbPassword = "my1234";
//			Class.forName("com.mysql.jdbc.Driver");
//
//			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	// ���� ��¥�� �޾ƿ��� �޼ҵ�.
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // ������ ���̽� ����
	}

	public int getNext() {
		String SQL = "SELECT bbsID FROM project_02.BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 1��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

	public int write(String bbsTitle, String bbsNick, String bbsContent) {
		String SQL = "INSERT INTO project_02.BBS VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsNick);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 0);

			return pstmt.executeUpdate(); // 1��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

	// �Խ��� ��� ��� �޼ҵ�.
	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM project_02.BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsNick(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setRnd(rs.getInt("rnd"));

				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// �Խñ��� 10������ ���� ��� nextPage�� �����ǰ� ����ϴ� �޼ҵ�.
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM project_02.BBS WHERE bbsID < ? AND bbsAvailable = 1";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// ���̵� �ش��ϴ� �� ������ �ҷ����� �޼ҵ�.
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM project_02.BBS WHERE bbsID = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsNick(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setRnd(rs.getInt("rnd"));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// ����
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE project_02.bbs SET bbsTitle =?, bbsContent = ? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);

			return pstmt.executeUpdate(); // 1��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

	// ���� ( �����ϴ��� db�� ���� �ֵ��� bbsAvailable �Ӽ��� 0���� ó��) = ������ �� ó��.
	public int delete(int bbsID) {
		String SQL = "UPDATE project_02.bbs SET bbsAvailable=0 WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);

			return pstmt.executeUpdate(); // 1��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

	
	 
	  
	  //��ȸ�� ���� 
	public int rndCount(int bbsID,int count) {

//		int result = 0;

		try { 	  
			String sql = "UPDATE project_02.bbs SET rnd = ? WHERE bbsID = ?";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count+1);
			pstmt.setInt(2, bbsID);

//			result = pstmt.executeUpdate();
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
