<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "jsp_test.ClaimDAO" %>
<%@ page import = "jsp_test.PaymentDAO" %>

<jsp:useBean id="claim" class="jsp_test.Claim" scope="page"></jsp:useBean>
<jsp:setProperty name="claim" property="claimID"/>
<jsp:setProperty name="claim" property="customerLoginID"/>
<jsp:setProperty name="claim" property="claimDate"/>
<jsp:setProperty name="claim" property="amount"/>
<jsp:setProperty name="claim" property="reason"/>

<%	
	// Set the paymentID property with the next available ID
    claim.setClaimID(new jsp_test.ClaimDAO().getNext());
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
	<title>Claim</title>
</head>
<body>
    <%
    	String customerID = null;
    	if (session.getAttribute("customerID") != null){
    		customerID = (String) session.getAttribute("customerID");
    	}
    	int paymentAmount = new jsp_test.PaymentDAO().getAmountByCustomerLoginID(customerID);
    	claim.setAmount(paymentAmount);
    	if (customerID == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인하세요.')");
            script.println("location.href = 'login.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
    	}
    	else {
    		if (claim.getReason() == null) {
        		PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('모든 문항을 입력해주세요.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
    		}
    		else {
    			ClaimDAO claimDAO = new ClaimDAO();
    			PaymentDAO paymentDAO = new PaymentDAO();
    			int result = claimDAO.write(customerID, claim.getClaimDate(), claim.getAmount(), claim.getReason());    			
    			int claimid_result = paymentDAO.update(customerID, claim.getClaimID());
    			int payment_update = claimDAO.updateClaimAmount(claim.getClaimID(), paymentAmount);
    			System.out.println(paymentAmount);
    			System.out.println(claim.getClaimID());
    			if (result == -1 || claimid_result == -1) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.')");
                    script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                    script.println("</script>");
    			}
    			else {
            	PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'succressClaim.jsp'");    // 메인 페이지로 이동
                script.println("</script>");    				
    			}
    		}
    	}
    %>
 
</body>
</html>
