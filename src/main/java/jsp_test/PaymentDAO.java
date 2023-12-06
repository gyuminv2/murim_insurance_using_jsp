package jsp_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PaymentDAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체

	public PaymentDAO() {
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
		String SQL = "SELECT paymentID FROM Payment ORDER BY paymentID DESC";
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
	
	public int write(String customerLoginID, int policyID, int premium){
		String SQL = "INSERT INTO Payment VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, customerLoginID);
			pstmt.setInt(3, policyID);
			pstmt.setString(4, null);
			pstmt.setInt(5, premium);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}

    public int update(String customerLoginID, int claimID) {
        String SQL = "UPDATE Payment SET claimID = ? WHERE customerLoginID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, claimID);
            pstmt.setString(2, customerLoginID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB error
    }
    
    public int getAmountByCustomerLoginID(String customerLoginID) {
        String SQL = "SELECT amount FROM payment WHERE customerLoginID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, customerLoginID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("amount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}