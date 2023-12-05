package jsp_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; // 단축키 : ctrl + shift + 'o'

public class CustomerDAO {
	private Connection conn; //db 접근 객체 
	private PreparedStatement pstmt;
	private ResultSet rs; // db 결과를 담는 객체
	
	public CustomerDAO() { // dao 생성자에서 db connection 
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
	// 로그인 기능 
	public int login(String customerLoginID, String customerPassword) {
		String SQL = "SELECT customerPassword FROM Customer WHERE customerLoginID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, customerLoginID); //sql Injection 공격 방어 수단 : 1번째 물음표에 userID 입력
			rs = pstmt.executeQuery(); // 쿼리 실행 
			if (rs.next()) {
				if (rs.getString(1).equals(customerPassword)) // rs.getString(1) : select된 첫번째 컬럼
					return 1; //로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //DB 오류 
	}
	
	public String getRank(String customerLoginID) {
		String SQL ="SELECT c.levelName FROM Customer cu JOIN MartialArtLevel c ON cu.MartialArtLevelID = c.levelID WHERE cu.customerLoginID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, customerLoginID); //sql Injection 공격 방어 수단 : 1번째 물음표에 userID 입력
			rs = pstmt.executeQuery(); // 쿼리 실행
			if (rs.next()) {
				String str = rs.getString("levelName");
				return str;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getClan(String customerLoginID)
	{
		String SQL ="SELECT c.name FROM Customer cu JOIN Clan c ON cu.ClanAffiliationID = c.ClanID WHERE cu.customerLoginID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, customerLoginID); //sql Injection 공격 방어 수단 : 1번째 물음표에 userID 입력
			rs = pstmt.executeQuery(); // 쿼리 실행
			if (rs.next()) {
				String str = rs.getString("name");
				return str;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getRep(String customerLoginID)
	{
		String SQL ="SELECT c.reputation FROM Customer cu JOIN Clan c ON cu.ClanAffiliationID = c.ClanID WHERE cu.customerLoginID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, customerLoginID); //sql Injection 공격 방어 수단 : 1번째 물음표에 userID 입력
			rs = pstmt.executeQuery(); // 쿼리 실행
			if (rs.next()) {
				String str = rs.getString("reputation");
				return str;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Customer getCustomer(String customerLoginID) {
	    String SQL = "SELECT name, age, gender, MartialArtLevelID, ClanAffiliationID, customerLoginID, customerPassword FROM Customer WHERE customerLoginID = ?";
	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, customerLoginID);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            Customer customer = new Customer();
	            customer.setName(rs.getString(1));
	            customer.setAge(rs.getInt(2));
	            customer.setGender(rs.getString(3));
	            customer.setMartialArtLevelID(rs.getInt(4));
	            customer.setClanAffiliationID(rs.getInt(5));
	            customer.setCustomerLoginID(rs.getString(6));
	            customer.setCustomerPassword(rs.getString(7));
	            return customer;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
}
