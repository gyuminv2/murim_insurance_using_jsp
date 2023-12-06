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
<div>
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
			<td>아이디</td>
			<td>이름</td>
			<td>성별</td>
			<td>나이</td>
			<td>무술등급</td>
			<td>문파</td>
			<td>명성</td>
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
            <td>보험종류</td>
            <td>보험가격</td>
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
            <td>청구날짜</td>
            <td>반환 보험료</td>
            <td>청구내용</td>
            <td>청구 결과</td>
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