<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jsp_test.Event" %>
<%@ page import="jsp_test.EventDAO" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../../css/styles.css">
<title>글 자세히 보기</title>
</head>
<body>
<%
    String customerID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("customerID") != null)
    {
    	customerID = (String)session.getAttribute("customerID");
    }
    int eventID = 0;
    if (request.getParameter("eventID") != null)
    {
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
%>
	<a href="../../home.jsp">메인 돌아가기</a>    
            <table style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="3" style="background-color: black; text-align:center;">사건 글 보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width:20%;">글 제목</td>
                        <td colspan="2"><%= event.getTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>                  
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= event.getCustomerLoginID().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
                    <tr>
                        <td>작성일자</td>
							<td colspan="2"><%= event.getEventDate()%></td>
                    <tr>
                    <tr>
                        <td>상대 문파</td>
							<td colspan="2"><%= event.getRelatedClan()%></td>
                    <tr>
                    <tr>
                        <td>부상 정도</td>
							<td colspan="2"><%= event.getInjured()%></td>
                    <tr>
                        <td>내용</td>
                        <td colspan="2" style="min-height:200px; text-align:center;">
                        <%= event.getContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>    
                    </tr>
                </tbody>
            </table>
            <a href="board.jsp" class="btn btn-primary">목록</a>
            <%
                if(customerID != null && customerID.equals(event.getCustomerLoginID()))
                {
            %>
                <a href="deleteAction.jsp?eventID=<%=eventID %>" class="btn btn-primary">삭제</a>
            <%     
                }
            %>
</body>
</html>
