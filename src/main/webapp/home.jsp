<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	ㅎㅇ!
</body>
</html> -->

<!DOCTYPE HTML>
<html>
 <body>
 <% 
    String customerID = null;
   	if (session.getAttribute("customerID") != null){
   		customerID = (String) session.getAttribute("customerID");
   	}
%>
 <div class="container">
     <div>
		<h1>Murim_Insurance</h1>
			<%
            	if (customerID == null){
            %>
			<h2>비회원 기능</h2>
			<p> <a href="./jsp/non_member/sign_up_customer.jsp">회원가입</a> </p>
			<p>	<a href="./jsp/non_member/login.jsp">로그인</a> </p>
            <%
            	}else{
            %>
			<h2>회원 기능</h2>
			<p>	<a href="./jsp/member/logoutAction.jsp">로그아웃</a> </p>			
			<p>	<a href="./jsp/member/sign_up_policy.jsp">보험가입</a> </p>
			<p>	<a href="/청구.jsp">청구</a> </p>
			<p>	<a href="./jsp/member/write_event.jsp">사건작성</a> </p>
			<p>	<a href="./jsp/member/board.jsp">사건조회</a> </p>
			<p>	<a href="/내정보조회.jsp">내정보조회</a> </p>
            <% 
            	}
            %>
			<p>	<a href="./jsp/common/insurance_info.jsp">보험조회</a> </p>
			<p>	<a href="./jsp/common/murim_info.jsp">문파정보조회</a> </p>
     </div>
 </div>
 <button id="jsmode">바뀌기 전 text</button>
 <script type="text/javascript" src="./js/hello.js" ></script>
 </body>
 </html>
 