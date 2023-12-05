<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보험가입</title>
</head>
<body>
	<a href="../../home.jsp">메인 돌아가기</a>    
 <% 
    String customerID = null;
   	if (session.getAttribute("customerID") != null){
   		customerID = (String) session.getAttribute("customerID");
   		System.out.println("보험가입 " + customerID);
   	}
	Connection conn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	Statement stmt4 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	String dbName = "murim_insurance";
	String jdbcDriver = "jdbc:mysql://localhost:3306/" + dbName + "?serverTimezone=Asia/Seoul&useSSL=false";
	String dbUser = "root";
	String dbPass = "qwer1234";
	String sql = "SELECT * FROM Customer WHERE customerLoginID = '" + customerID + "'";
	String sql2 = "SELECT Customer.customerLoginID, MartialArtLevel.LevelName " +
            "FROM Customer " +
            "JOIN MartialArtLevel ON Customer.MartialArtLevelID = MartialArtLevel.LevelID " +
            "WHERE Customer.customerLoginID = '" + customerID + "'";
	String sql3 = "SELECT customer.customerLoginID, clan.name " +
            "FROM customer " +
            "JOIN clan ON customer.ClanAffiliationID = clan.clanID " +
            "WHERE customer.customerLoginID = '" + customerID + "'";
	String sql4 = "SELECT customer.customerLoginID, clan.reputation " +
            "FROM customer " +
            "JOIN clan ON customer.ClanAffiliationID = clan.clanID " +
            "WHERE customer.customerLoginID = '" + customerID + "'";
	try {
	// 데이터베이스를 접속하기 위한 드라이버 SW 로드
	Class.forName("com.mysql.jdbc.Driver");
	// 데이터베이스에 연결하는 작업 수행
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	// 쿼리를 생성gkf 객체 생성
	stmt = conn.createStatement();
	// 쿼리 생성
	rs = stmt.executeQuery(sql);
	%>
 	<div>
		<h1>보험가입</h1>
	</div>
	<!-- 보험종류 + 등급 + 소속명성 -->
	<form action="resultPolicy.jsp" method="post">
		<div>
			<label>내 정보(보험료 측정 시 사용)</label>
		</div>
		<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>성별</td>
			<td>나이</td>
			<td>무술등급</td>
			<td>문파</td>
			<td>명성</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("customerLoginID")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("gender") %></td>
			<td><%=rs.getInt("age") %></td>
			
			<input type="hidden" name="customerLoginID" value="<%=rs.getString("customerLoginID")%>">
		    <input type="hidden" name="gender" value="<%=rs.getString("gender")%>">
		<%
		    }
		
		    // ResultSet을 모두 처리한 후에 두 번째 쿼리 실행
		    // 두 번째 쿼리를 위한 Statement 객체 생성
		    stmt2 = conn.createStatement();
		   	rs2 = stmt2.executeQuery(sql2);
			while (rs2.next()) {
		%>
			<td><%=rs2.getString("levelName")%></td>
			<input type="hidden" name="levelName" value="<%=rs2.getString("levelName")%>">
			
		<%
		    }
		
		    // ResultSet을 모두 처리한 후에 두 번째 쿼리 실행
		    // 두 번째 쿼리를 위한 Statement 객체 생성
		    stmt3 = conn.createStatement();
		   	rs3 = stmt3.executeQuery(sql3);
			while (rs3.next()) {
		%>
			<td><%=rs3.getString("name")%></td>
		<%
		    }
		
		    // ResultSet을 모두 처리한 후에 두 번째 쿼리 실행
		    // 두 번째 쿼리를 위한 Statement 객체 생성
		    stmt4 = conn.createStatement();
		   	rs4 = stmt4.executeQuery(sql4);
			while (rs4.next()) {
		%>
			<td><%=rs4.getString("reputation")%></td>
			<input type="hidden" name="reputation" value="<%=rs4.getString("reputation")%>">
		</tr>
		<%
			}
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (rs2 != null)
				rs2.close();
			if (stmt2 != null)
				stmt2.close();
			if (rs3 != null)
				rs3.close();
			if (stmt3 != null)
				stmt3.close();
			if (rs4 != null)
				rs4.close();
			if (stmt4 != null)
				stmt4.close();
			if (conn != null)
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		%>
	</table>
		<div>
			<label>보험 종류: </label>
				<select name="type">
			        <option value="생명보험">생명보험</option>
			        <option value="상해보험">상해보험</option>
		     	</select>
		</div>
 		 <div>
			<label>가입하시겠습니까? </label>
			<input type="checkbox" name="joinPolicy">
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>