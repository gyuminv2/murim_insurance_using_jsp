<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 등록</title>
</head>
<body>
	<%
		String dbName = "murim_insurance";
		String jdbcDriver = "jdbc:mysql://localhost:3306/" + dbName + "?serverTimezone=Asia/Seoul&useSSL=false";
		String dbUser = "root";
		String dbPass = "qwer1234";
		String query = "select * from instructor";
		String update_query = "";
		
		Connection conn = null;
		Statement stmt = null;
		
		String name = (String) session.getAttribute("name");
		int age = (Integer) (session.getAttribute("age"));
		String gender = (String) session.getAttribute("gender");
		String rank = (String) session.getAttribute("rank");
		String clan = (String) session.getAttribute("clan");
		String customerLoginID = (String) session.getAttribute("customerLoginID");
		String customerPassword = (String) session.getAttribute("customerPassword");		
				
		String insert_customer = "INSERT INTO Customer (Name, Age, Gender, MartialArtLevelID, ClanAffiliationID, customerLoginID, customerPassword) " +
                "VALUES ('" + name + "', " + age + ", '" + gender + "', " +
                "(SELECT LevelID FROM MartialArtLevel WHERE LevelName = '" + rank + "'), " +
                "(SELECT ClanID FROM Clan WHERE Name = '" + clan + "'), '" +
                customerLoginID + "', '" + customerPassword + "')";
		
		try {
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			stmt.executeUpdate(insert_customer);
	%>
	<h1>성공</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName%>에 등록하였습니다.
	<p class="Lead">
		수행한 SQL Statement :
		<%=insert_customer%>
		<div>
			<button type="button" onclick="location.href='../../home.jsp' ">홈으로 가기</button>		
		</div>
		<%
			} catch (SQLException se) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
		        script.println("alert('아이디가 이미 존재합니다.')");
	            script.println("history.back()");    //이전 페이지로 사용자를 보냄
		        script.println("</script>");
			} finally {
				try {
					stmt.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		%>
</body>
</html>