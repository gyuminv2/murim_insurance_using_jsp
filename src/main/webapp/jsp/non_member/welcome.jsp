<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<%
		String user_mail = (String) session.getAttribute("user_name");
		String url = request.getHeader("referer");
	%>
	<h1>환영합니다 ! <%=user_mail %>님 :) </h1>
	<input type="button" value="돌아가기" onclick="Location.href='<%=url%>'">
	<%
		System.out.println(url);
	%>
	
</body>
</html>