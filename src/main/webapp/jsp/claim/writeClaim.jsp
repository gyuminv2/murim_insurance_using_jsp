<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>청구서 작성</title>
	<link rel="stylesheet" href="../../css/styles.css">
</head>
 <%
    String customerID = null;
   	if (session.getAttribute("customerID") != null){
   		customerID = (String) session.getAttribute("customerID");
   		System.out.println("청구서작성 " + customerID);
   	}
%>
<body>
	<a href="../../home.jsp">메인 돌아가기</a>
    		<form method="post" action="claimAction.jsp">
    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
	    	    	<thead>
		    	    	<tr>
		    	    		<th colspan= "2" style= "background-color: black; text-align: center;">청구서 작성</th>
		    	    	</tr>
	    	    	</thead>
			    	<tbody>
 				    		<tr>
			    			<td><textarea placeholder="청구 내용"  name="reason" maxlength="2048" style= "height:350px" ></textarea></td>
			    		</tr>
			    	</tbody>
    	    	</table>
    	    	<input type="submit" value="청구하기">
    		</form>
</body>
</html>