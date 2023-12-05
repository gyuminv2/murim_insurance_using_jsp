<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "jsp_test.PolicyDAO" %>
<%@ page import = "jsp_test.Customer" %>
<%@ page import = "jsp_test.CustomerDAO" %>

<jsp:useBean id="policy" class="jsp_test.Policy" scope="page"></jsp:useBean>
<jsp:setProperty name="policy" property="type"/>
<jsp:setProperty name="policy" property="premium"/>
<jsp:setProperty name="policy" property="customerLoginId"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>Policy</title>
</head>
<body>
    <%
    	String customerID = null;
    	if (session.getAttribute("customerID") != null){
    		customerID = (String) session.getAttribute("customerID");
    	}
    	if (customerID == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인하세요.')");
            script.println("location.href = 'login.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
    	}
    	else{
    		if (policy.getType() == null){
        		PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('모든 문항을 입력해주세요.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
        	}else{
        		PolicyDAO policyDAO = new PolicyDAO();
        		Customer customer = new CustomerDAO().getCustomer(customerID);
            	CustomerDAO customerDAO = new CustomerDAO();
				String type = request.getParameter("type");
				String gender = customer.getGender();
				String levelName = customerDAO.getClan(customerID);
				int reputation = Integer.parseInt(customerDAO.getRep(customerID));
				
				int premium = 0;
				int type_price = 0;
				int level_price = 0;
				int reput_price = 0;
				int gender_price = 0;
				// type 금액 (생명 1000만원, 상해 500만원)
				if (type.equals("생명보험")) type_price += 10000000;
				else type_price += 5000000;
				// 무술 금액 (등급이 높을수록 +300만원 증가)
				if (levelName.equals("이류")) level_price += 3000000; 
				else if (levelName.equals("일류")) level_price += 6000000; 
				else if (levelName.equals("절정")) level_price += 9000000; 
				else if (levelName.equals("초절정")) level_price += 12000000; 
				else if (levelName.equals("화경")) level_price += 15000000; 
				else if (levelName.equals("현경")) level_price += 18000000; 
				else if (levelName.equals("생사경")) level_price += 21000000;
				else ; 
				// 명성 (등급이 높을수록 1000만원 증가)
				if (reputation == 4) reput_price += 10000000; 
				else if (reputation == 3) reput_price += 20000000; 
				else if (reputation == 2) reput_price += 30000000; 
				else if (reputation == 1) reput_price += 40000000;
				// 성별 (남자가 먼저 죽을 확률이 높으므로 남자 500만원 증가)
				if (gender.equals("남")) gender_price += 5000000;
				
				premium += type_price + level_price + reput_price + gender_price;
				
                int result = policyDAO.write(policy.getType(), premium, customerID);
                if (result == -1){ // 글쓰기 실패시
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.')");
                    script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                    script.println("</script>");
                }else{ // 글쓰기 성공시
                	PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'resultPolicy.jsp'");    // 메인 페이지로 이동
                    script.println("</script>");    
                }
        	}	
    	}
    %>
 
</body>
</html>
