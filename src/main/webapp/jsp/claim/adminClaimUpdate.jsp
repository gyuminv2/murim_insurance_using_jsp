<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="jsp_test.ClaimDAO" %>

<%
    // Retrieve selected claimIDs from the request parameter
    String[] acceptedClaims = request.getParameterValues("acceptedClaims");

    if (acceptedClaims != null && acceptedClaims.length > 0) {
        ClaimDAO claimDAO = new ClaimDAO();

        // Perform the update operation for each selected claimID
        Arrays.asList(acceptedClaims).forEach(claimID -> {
            int claimIdInt = Integer.parseInt(claimID);
            claimDAO.updateClaimResult(claimIdInt);
        });

        System.out.println("Update successful!");
    } else {
        System.out.println("No claims selected for update.");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>Claim Success</title>
</head>
<body>
<h1> 청구 변경에 성공하셨습니다. </h1>
<p>	<a href="../../home.jsp">홈으로 돌아가기</a> </p>
</body>
</html>
