<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "jsp_test.EventDAO" %>

<jsp:useBean id="event" class="jsp_test.Event" scope="page"></jsp:useBean>
<jsp:setProperty name="event" property="title"/>
<jsp:setProperty name="event" property="customerLoginID"/>
<jsp:setProperty name="event" property="content"/>
<jsp:setProperty name="event" property="eventDate"/>
<jsp:setProperty name="event" property="relatedClan"/>
<jsp:setProperty name="event" property="injured"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>JSP BBS</title>
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
    	}else{
    		if (event.getTitle() == null || event.getContent() == null){
        		PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('모든 문항을 입력해주세요.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
        	}else{
        		EventDAO eventDAO = new EventDAO();
                int result = eventDAO.write(event.getTitle(), customerID, event.getContent(), event.getRelatedClan(), event.getInjured());
                if (result == -1){ // 글쓰기 실패시
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.')");
                    script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                    script.println("</script>");
                }else{ // 글쓰기 성공시
                	PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'board.jsp'");    // 메인 페이지로 이동
                    script.println("</script>");    
                }
        	}	
    	}
    %>
 
</body>
</html>
