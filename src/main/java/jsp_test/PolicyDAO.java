package jsp_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PolicyDAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	public PolicyDAO() {
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
	
	public int getNext() {
		String SQL = "SELECT policyID FROM Policy ORDER BY policyID DESC";
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
	
	public int write(String type, int premium, String customerLoginID){
		String SQL = "INSERT INTO Policy VALUES (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, type);
			pstmt.setInt(3, premium);
			pstmt.setString(4, customerLoginID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}

}