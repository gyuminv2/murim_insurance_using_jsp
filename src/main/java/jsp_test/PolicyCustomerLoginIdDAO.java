package jsp_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class PolicyCustomerLoginIdDAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;

	public PolicyCustomerLoginIdDAO() {
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
	
	public int write(int policyId, String customerLoginId){
		String SQL = "INSERT INTO PolicyCustomerLoginId VALUES (?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, policyId);
			pstmt.setString(2, customerLoginId);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
}