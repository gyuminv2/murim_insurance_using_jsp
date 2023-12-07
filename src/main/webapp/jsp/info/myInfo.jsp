<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jsp_test.Customer" %>
<%@ page import="jsp_test.CustomerDAO" %>
<%@ page import="jsp_test.Policy" %>
<%@ page import="jsp_test.PolicyDAO" %>
<%@ page import="jsp_test.Claim" %>
<%@ page import="jsp_test.ClaimDAO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE HTML>
<html>
	<link rel="stylesheet" href="../../css/styles.css">
<div>
 	<a href="../../home.jsp">메인 돌아가기</a>
	<h1>내 정보</h1>
</div>
 <body>
	 <% 
	    String customerID = null;
	   	if (session.getAttribute("customerID") != null){
	   		customerID = (String) session.getAttribute("customerID");
	   	}
	   	Customer customer = new CustomerDAO().getCustomer(customerID);
	   	CustomerDAO customerDAO = new CustomerDAO();
	   	
	   	PolicyDAO policyDAO = new PolicyDAO();	   	
	    List<Policy> policies = policyDAO.getPoliciesByCustomer(customerID);
	    
	    ClaimDAO claimDAO = new ClaimDAO();
	    List<Claim> claims = claimDAO.getClaimsByCustomer(customerID);
 	%>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>무술등급</th>
			<th>문파</th>
			<th>명성</th>
		</tr>
		<tr>
			<td><%=customer.getCustomerLoginID()%></td>
			<td><%=customer.getName()%></td>
			<td><%=customer.getGender() %></td>
			<td><%=customer.getAge() %></td>
			<td><%=customerDAO.getRank(customer.getCustomerLoginID()) %></td>
			<td><%=customerDAO.getClan(customer.getCustomerLoginID()) %></td>
			<td><%=customerDAO.getRep(customer.getCustomerLoginID()) %></td>
		</tr>
		</table>
		<h2>보험 이력</h2>
	<table>
        <tr>
            <th>보험종류</th>
            <th>보험가격</th>
        </tr>
        <% for (Policy policy : policies) { %>
            <tr>
                <td><%= policy.getType() %></td>
                <td><%= policy.getPremium() %></td>
            </tr>
        <% } %>
	</table>
		<h2>청구 이력</h2>
		<table>
        <tr>
            <th>청구날짜</th>
            <th>반환 보험료</th>
            <th>청구내용</th>
            <th>청구 결과</th>
	    <% for (Claim claim : claims) { %>
	    <tr>
	        <td><%= claim.getClaimDate() %></td>
	        <td><%= claim.getAmount() %></td>
	        <td><%= claim.getReason() %></td>
	        <td><%= claim.getResult() %></td>
	    </tr>
	    <% } %>
	</table>
	</body>
</html> 