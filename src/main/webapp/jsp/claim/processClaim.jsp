<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="jsp_test.Claim" %>
<%@ page import="jsp_test.ClaimDAO" %>

<!DOCTYPE HTML>
<html>
 <body>
<div>
	<h1>청구 처리</h1>
</div>
<p>	<a href="../../home.jsp">홈으로 돌아가기</a> </p>
<form action="adminClaimUpdate.jsp" method="post">
 	<%
        ClaimDAO claimDAO = new ClaimDAO();
        List<Claim> allClaims = claimDAO.getAllClaims();
    %>
 	    <table border="1">
        <tr>
            <th>청구 ID</th>
            <th>고객 ID</th>
            <th>청구 날짜</th>
            <th>청구 금액</th>
            <th>이유</th>
            <th>처리 결과</th>
            <th>처리 수락</th>            
        </tr>

        <% for (Claim claim : allClaims) { %>
            <tr>
                <td><%= claim.getClaimID() %></td>
                <td><%= claim.getCustomerLoginID() %></td>
                <td><%= claim.getClaimDate() %></td>
                <td><%= claim.getAmount() %></td>
                <td><%= claim.getReason() %></td>
                <td><%= claim.getResult() %></td>
				<td>
				      <label><input type="checkbox" name="acceptedClaims" value="<%= claim.getClaimID() %>"></label>
            	</td>
            </tr>
        <% } %>
    </table>
    <input type="submit" value="수락">
</form>
</body>
</html>