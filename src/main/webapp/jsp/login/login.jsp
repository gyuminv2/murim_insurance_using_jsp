<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../../css/styles.css">
<title>Login</title>
</head>
<body>
	<a href="../../home.jsp">메인 돌아가기</a>    
        <form style="text-align: center; " method = "post" action="loginAction.jsp">
            <h2 style="text-align:center;">로그인 화면</h2>
            <div class ="form-group">
                <input type ="text" placeholder="아이디" name ="customerLoginID" maxlength='20'>
            </div>
            <div class ="form-group">
                <input type ="password" placeholder="비밀번호" name ="customerPassword" maxlength='20'>
            </div>
            <input type="submit" value="로그인">
        </form>
</body>
</html>
