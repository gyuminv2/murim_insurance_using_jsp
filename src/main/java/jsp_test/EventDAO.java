package jsp_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EventDAO {
	private Connection conn; //db 접근 객체 
	private ResultSet rs; // db 결과를 담는 객체
	
	public EventDAO() { // dao 생성자에서 db connection 
		try {
			String dbURL = "jdbc:mysql://localhost:3306/murim_insurance" + "?serverTimezone=Asia/Seoul&useSSL=false"; //mySQL 서버의 BBS DB 접근 경로
			String dbID = "root"; //계정
			String dbPassword = "qwer1234"; //비밀번호
			Class.forName("com.mysql.jdbc.Driver"); //mysql에 접속을 도와주는 라이브러리 
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //DB 오류 
	}
	
	public int getNext() {
		String SQL = "SELECT eventID FROM Event ORDER BY eventID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}

	public int write(String title, String customerLoginID, String content, String relatedClan, String injured){
		String SQL = "INSERT INTO Event VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, title);
			pstmt.setString(3, customerLoginID);
			pstmt.setString(4, content);
			pstmt.setString(5, getDate());
			pstmt.setString(6, relatedClan);
			pstmt.setString(7, injured);			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
	
	public ArrayList<Event> getList(int pageNumber){
		String SQL = "SELECT * FROM Event WHERE eventID < ? ORDER BY eventID DESC LIMIT 10";
		ArrayList<Event> list = new ArrayList<Event>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Event event = new Event ();
				event.setEventID(rs.getInt(1));
				event.setTitle(rs.getString(2));
				event.setCustomerLoginID(rs.getString(3));
				event.setContent(rs.getString(4));
				event.setEventDate(rs.getString(5));
				event.setRelatedClan(rs.getString(6));
				event.setInjured(rs.getString(7));
				list.add(event);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	// 해당 페이지로 넘어갈 수 있는지 검사 
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM Event WHERE eventID < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public Event getEvent(int eventID)
    {
		String SQL = "SELECT * FROM Event WHERE eventID = ?"; 
        try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, eventID);
				rs = pstmt.executeQuery();
				if (rs.next())
				{
					Event event = new Event();
					event.setEventID(rs.getInt(1));
					event.setTitle(rs.getString(2));
					event.setCustomerLoginID(rs.getString(3));
					event.setContent(rs.getString(4));
					event.setEventDate(rs.getString(5));
					event.setRelatedClan(rs.getString(6));
					event.setInjured(rs.getString(7));
	                return event;
		        }
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return null; 
    }
	
	public int update(int eventID, String title, String content) {	
		String SQL = "UPDATE Event SET title = ?, content = ? WHERE eventID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, eventID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}

	public int delete(int eventID) {
		String SQL = "DELETE FROM Event WHERE eventID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, eventID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}


}
