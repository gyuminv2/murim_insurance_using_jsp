<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jsp_test.EventDAO" %>
<%@ page import="jsp_test.Event" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>사건 작성</title>
</head>
<body>
 <% 
    String customerID = null;
   	if (session.getAttribute("customerID") != null){
   		customerID = (String) session.getAttribute("customerID");
   		System.out.println("사건조회 " + customerID);
   	}
    int pageNumber = 1;
    if (request.getParameter("pageNumber") != null){
    	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }

%>
	<a class ="navbar-brand" href="../../home.jsp">메인 돌아가기</a>
    	    <table border="1" style= "text-align: center; boarder: 1px solid #dddddd">
    	    	<thead>
    	    	<tr>
    	    		<th style= "background-color: #eeeeee; text-align: center;">번호</th>
    	    		<th style= "background-color: #eeeeee; text-align: center;">제목</th>
    	    		<th style= "background-color: #eeeeee; text-align: center;">작성자</th>
    	    		<th style= "background-color: #eeeeee; text-align: center;">작성일</th>
    	    		<th style= "background-color: #eeeeee; text-align: center;">상대 문파</th>
    	    		<th style= "background-color: #eeeeee; text-align: center;">부상 정도</th>
    	    	</tr>
    	    	</thead>
    	    	<tbody>
    	    		<tr>
    	    			<%
    	    				EventDAO eventDAO = new EventDAO();
    	    				ArrayList<Event> list = eventDAO.getList(pageNumber);
    	    				for (int i =0; i<list.size(); i++){
    	    			%>
    	    			<tr>
    	    				<td><%= list.get(i).getEventID() %></td>
							<td><a href ="viewEvent.jsp?eventID=<%=list.get(i).getEventID()%>"><%=list.get(i).getTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></a></td>
    	    				<td><%= list.get(i).getCustomerLoginID() %></td>
							<td><%= list.get(i).getEventDate()%></td>
							<td><%= list.get(i).getRelatedClan() %></td>
							<td><%= list.get(i).getInjured() %></td>
    	    			</tr>	
    	    			<%
    	    				}
    	    			%>
    	    	</tbody>
    	    </table>
    	    <%
    	    	if(pageNumber != 1){
    	    %>		
    	    		<a href= "board.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-success btn-arraw-left">이전</a>
    	    <% 
    	    	}if(eventDAO.nextPage(pageNumber + 1)){
    	    %>		
    	    	<a href= "board.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arraw-left">다음</a>
    	    <% 
    	    	}
    	    %>
    	    <a href= "./writeEvent.jsp" class= "btn btn-primary pull-right">글쓰기</a>
</body>
</html>