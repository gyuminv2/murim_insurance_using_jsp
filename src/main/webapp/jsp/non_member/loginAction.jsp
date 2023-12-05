<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jsp_test.CustomerDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="customer" class="jsp_test.Customer" scope="page"></jsp:useBean>
<jsp:setProperty name="customer" property="customerLoginID"/>
<jsp:setProperty name="customer" property="customerPassword"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>JSP BBS</title>
</head>
<body>
    <% // 자바 코드 삽입 
	    String customerID = null;
	    if (session.getAttribute("customerID") != null){
	    	customerID = (String) session.getAttribute("customerID");
	    }
	    if (customerID != null){
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('이미 로그인되었습니다.')");
	        script.println("location.href = '../../home.jsp'");    // 메인 페이지로 이동
	        script.println("</script>");
	    }
    	CustomerDAO customerDAO = new CustomerDAO();
        int result = customerDAO.login(customer.getCustomerLoginID(), customer.getCustomerPassword());
        if (result ==1){
        	session.setAttribute("customerID", customer.getCustomerLoginID()); // 추가
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = '../../home.jsp'");
            script.println("</script>");
        }
        else if (result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");   //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");    //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DB 오류가 발생했습니다.')");
            script.println("history.back()");    //이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
    %>
 
</body>
</html>