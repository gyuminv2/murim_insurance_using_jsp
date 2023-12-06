package jsp_test;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ClaimDAO {
	private Connection conn;
	private ResultSet rs;
	
	public ClaimDAO() { // dao 생성자에서 db connection 
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
		String SQL = "SELECT claimID FROM Claim ORDER BY claimID DESC";
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

	public int write(String customerLoginID, String claimDate, int amount, String reason) {
		String SQL = "INSERT INTO Claim VALUES (?, ?, ?, ?, ?, 0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, customerLoginID);
			pstmt.setString(3, getDate());
			pstmt.setInt(4, amount);
			pstmt.setString(5, reason);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();		
		}
		return -1;
	}
	
    public List<Claim> getClaimsByCustomer(String customerLoginID) {
        List<Claim> claims = new ArrayList<>();
        String SQL = "SELECT * FROM Claim WHERE customerLoginID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, customerLoginID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Claim claim = new Claim();
                claim.setClaimID(rs.getInt("claimID"));
                claim.setCustomerLoginID(rs.getString("customerLoginID"));
                claim.setClaimDate(rs.getString("claimDate"));
                claim.setAmount(rs.getInt("amount"));
                claim.setReason(rs.getString("reason"));
                claim.setResult(rs.getBoolean("result"));
                claims.add(claim);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return claims;
    }
    
    public int updateClaimAmount(int claimID, int paymentAmount) {
        String SQL = "UPDATE Claim SET amount = ? WHERE claimID = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setLong(1, paymentAmount);
            pstmt.setInt(2, claimID);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1; // DB error
    }
    
    public List<Claim> getAllClaims() {
        List<Claim> claims = new ArrayList<>();
        String SQL = "SELECT * FROM Claim";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Claim claim = new Claim();
                claim.setClaimID(rs.getInt("claimID"));
                claim.setCustomerLoginID(rs.getString("customerLoginID"));
                claim.setClaimDate(rs.getString("claimDate"));
                claim.setAmount(rs.getInt("amount"));
                claim.setReason(rs.getString("reason"));                
                claim.setResult(rs.getBoolean("result"));                
                claims.add(claim);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return claims;
    }
    
    public boolean updateClaimResult(int claimID) {
        String SQL = "UPDATE Claim SET result = true WHERE claimID = ?";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, claimID);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public void acceptClaim(int claimID) {
        String SQL = "UPDATE Claim SET result = true WHERE claimID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, claimID);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}