package jspbook.freebook;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FreeBean {

	Connection conn = null;

	PreparedStatement pstmt = null;

	// sql 연결정보
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb";

	// 데이터베이스 연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "ksu", "7756");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {

			try {

				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

	// 수정된 도서리스트 내용갱신을 위한 메서드
	public boolean updateDB(FreeBook freebook) {

		connect();
		String sql = "update freebook set fb_bookname=?, fb_writer =?,fb_publisher =?, fb_publicationdate = ?, fb_memo = ? where fb_id= ?";

		try {
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, freebook.getFb_bookname());
			pstmt.setString(2, freebook.getFb_writer());
			pstmt.setString(3, freebook.getFb_publisher());
			pstmt.setString(4, freebook.getFb_publicationdate());
			pstmt.setString(5, freebook.getFb_memo());
			pstmt.setInt(6, freebook.getFb_id());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;

		} finally {
			disconnect();
		}

		return true;
	}

	// 특정 도서 등록 글 삭제 메서드
	public boolean deleteDB(int gb_id) {
		connect();

		String sql = "delete from freebook where fb_id =?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 신규 도서 등록 메서드
	public boolean insertDB(FreeBook freebook) {
		connect();
		// sql 문자열 , gb_id는 자동 등록되므로 입력하지않는다.

		String sql = "insert into freebook(fb_bookname,fb_writer,fb_publisher,fb_publicationdate,fb_memo) values(?,?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, freebook.getFb_bookname());
			pstmt.setString(2, freebook.getFb_writer());
			pstmt.setString(3, freebook.getFb_publisher());
			pstmt.setString(4, freebook.getFb_publicationdate());
			pstmt.setString(5, freebook.getFb_memo());
			pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		} finally {
			disconnect();
		}
		return true;
	}

	// 특정 도서 가져오는 메서드
	public FreeBook getDB(int gb_id) {
		connect();

		String sql = "select * from freebook where fb_id =?";
		FreeBook freebook = new FreeBook();

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs = pstmt.executeQuery();

			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
			rs.next();
			freebook.setFb_id(rs.getInt("fb_id"));
			freebook.setFb_bookname(rs.getString("fb_bookname"));
			freebook.setFb_writer(rs.getString("fb_writer"));
			freebook.setFb_publisher(rs.getString("fb_publisher"));
			freebook.setFb_publicationdate(rs.getString("fb_publicationdate"));
			freebook.setFb_memo(rs.getString("fb_memo"));
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return freebook;
	}

	// 도서 리스트를 가져오는 메서드
	public ArrayList<FreeBook> getDBList() {
		connect();
		ArrayList<FreeBook> datas = new ArrayList<FreeBook>();
		
		String sql = "select * from freebook order by fb_id desc";
		
		
		
		try {
	
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				FreeBook freebook = new FreeBook();

				freebook.setFb_id(rs.getInt("fb_id"));
				freebook.setFb_bookname(rs.getString("fb_bookname"));
				freebook.setFb_writer(rs.getString("fb_writer"));
				freebook.setFb_publisher(rs.getString("fb_publisher"));
				freebook.setFb_publicationdate(rs.getString("fb_publicationdate"));
				freebook.setFb_memo(rs.getString("fb_memo"));
				datas.add(freebook);
		

			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	
	public void listSort() {
		connect();
		String sql = "alter table freebook auto_increment=1; set @cnt =0; update freebook set freebook.fb_id=@cnt:=@cnt+1;";

		try {

			pstmt = conn.prepareStatement(sql);
	
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
	
	}

}
