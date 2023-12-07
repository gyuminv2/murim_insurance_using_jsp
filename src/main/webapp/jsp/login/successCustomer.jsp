<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입력 결과</title>
	<link rel="stylesheet" href="../../css/styles.css">
</head>
<body>
	<a href="../../home.jsp">메인 돌아가기</a>   
	<%
		try {
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String rank = request.getParameter("level");
			String clan = request.getParameter("clan");
			String customerLoginID = request.getParameter("customerLoginID");
			String customerPassword = request.getParameter("customerPassword");
			
			String redirect = null;
			String trigger_name = "james";
			
			// name이 james일때
			if (name.equals(trigger_name)) {
				session.setAttribute("user_name", name);
				redirect = "welcome.jsp";
			}
			
			String insert = request.getParameter("joinCustomer");
			
			// name이 james가 아닐 때
			if (insert != null && insert.equals("on")) {
				session.setAttribute("age", age);
				session.setAttribute("name", name);
				session.setAttribute("gender", gender);
				session.setAttribute("rank", rank);
				session.setAttribute("clan", clan);
				session.setAttribute("customerLoginID", customerLoginID);
				session.setAttribute("customerPassword", customerPassword);
				redirect = "joinCustomer.jsp";
			}
	
			if (redirect != null)
				response.sendRedirect(redirect);
	%>
	<div>
		<h1>결과</h1>
		<p>전송된 내용은 다음과 같습니다.</p>
		<p>
			이름 :
			<%=name%>
		</p>
		<p>
			나이 :
			<%=age%>
		</p>
		<p>
			성별 :
			<%=gender%>
		</p>
		<p>
			무술 등급 :
			<%=rank%>
		</p>
		<p>
			소속 문파 :
			<%=clan%>
		</p>
	</div>
	<%
		} catch (NumberFormatException e) {
	%>
	
	<h1>이런 !</h1>
	<p>
	<font color="white">올바른 정보를 입력해주세요... :(</font><br>
		<%
		}
	%>
</body>
</html>