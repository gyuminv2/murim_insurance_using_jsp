<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp_test.EventDAO" %>
<%@ page import="jsp_test.Event" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>글 삭제</title>
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
            script.println("location.href = '../non_member/login.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
    	}
    	int eventID = 0;
    	if (request.getParameter("eventID") != null){
    		eventID = Integer.parseInt(request.getParameter("eventID"));
    	}
    	if (eventID == 0)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다')");
            script.println("location.href = 'board.jsp'");
            script.println("</script>");
        }
        Event event = new EventDAO().getEvent(eventID);
        if (!customerID.equals(event.getCustomerLoginID())){
        	PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.')");
            script.println("location.href = 'board.jsp'");
            script.println("</script>");
        }else{
    		
        	EventDAO eventDAO = new EventDAO();
            int result = eventDAO.delete(eventID);
            if (result == -1){ // 글삭제 실패시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글삭제에 실패했습니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
            }else{ // 글삭제 성공시
              	PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'board.jsp'");    // 메인 페이지로 이동
                script.println("</script>");    
            }
        }	
    %>
 
</body>
</html>
