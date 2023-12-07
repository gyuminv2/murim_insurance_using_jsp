<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>사건 작성</title>
	<link rel="stylesheet" href="../../css/styles.css">
</head>
 <% 
    String customerID = null;
   	if (session.getAttribute("customerID") != null){
   		customerID = (String) session.getAttribute("customerID");
   		System.out.println("사건작성 " + customerID);
   	}
%>
<body>
	<div>
		<a href="../../home.jsp">메인 돌아가기</a>
	</div>
	<div>
		<a href="board.jsp">사건 목록</a>
	</div>
    		<form method="post" action="writeAction.jsp">
    			<table style= "text-align: center; boarder: 1px solid #dddddd">
	    	    	<thead>
		    	    	<tr>
		    	    		<th colspan= "2" style= "background-color: black; text-align: center;">사건 작성</th>
		    	    	</tr>
	    	    	</thead>
			    	<tbody>
			    		<tr>
			    			<td>
							<label>상대 문파: </label>
						      <select name="relatedClan">
						        <option value="소림사">소림사</option>
						        <option value="무당파">무당파</option>
						        <option value="개방">개방</option>
						        <option value="화산파">화산파</option>
						        <option value="아미파">아미파</option>
						        <option value="곤륜파">곤륜파</option>
						        <option value="종남파">종남파</option>
						        <option value="공동파">공동파</option>
						        <option value="정참파">정참파</option>
						        <option value="청성파">청성파</option>
						        <option value="형산파">형산파</option>
						        <option value="해남파">해남파</option>
						      </select>
					     	 </td>
			    		</tr>
			    		<tr>
			    			<td><input type="text" placeholder="부상 정도" name="injured"></td>
			    		</tr>
			    		<tr>
			    			<td><input type="text" placeholder="사건 이름" name="title" maxlength="50" ></td>
			    		</tr>
			    		<tr>
			    			<td><textarea placeholder="사건 내용" name="content" maxlength="2048" style= "height:350px" ></textarea></td>
			    		</tr>
			    	</tbody>
    	    	</table>
    	    	<input type="submit" value="글쓰기">
    		</form>
</body>
</html>