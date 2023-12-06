<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jsp_test.Customer" %>
<%@ page import="jsp_test.CustomerDAO" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>보험 가입</title>
</head>
 <% 
    String customerID = null;
   	if (session.getAttribute("customerID") != null){
   		customerID = (String) session.getAttribute("customerID");
   		System.out.println("보험가입 " + customerID);
   	}
   	Customer customer = new CustomerDAO().getCustomer(customerID);
   	if(customer == null)
   		System.out.println("실패");
   	CustomerDAO customerDAO = new CustomerDAO();
%>
<body>
	<div>
		<a href="../../home.jsp">메인 돌아가기</a>
	</div>
	<form action="writePolicy.jsp" method="post">
	<div>
		<h1>보험 가입</h1>
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