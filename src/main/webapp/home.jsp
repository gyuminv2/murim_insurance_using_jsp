<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
 <body>
 <% 
    String customerID = null;
   	if (session.getAttribute("customerID") != null){
   		customerID = (String) session.getAttribute("customerID");
   	}
   	System.out.println(customerID);
   	if (customerID == "root") System.out.println("good"); 
%>
 <div class="container">
     <div>
		<h1>Murim_Insurance</h1>
			<%
            	if (customerID == null){
            %>
			<h2>비회원 기능</h2>
			<p> <a href="./jsp/login/signUpCustomer.jsp">회원가입</a> </p>
			<p>	<a href="./jsp/login/login.jsp">로그인</a> </p>
			<p>	<a href="./jsp/common/insuranceInfo.jsp">보험설명</a> </p>
			<p>	<a href="./jsp/common/murimInfo.jsp">문파정보조회</a> </p>
            <%
            	}else if (customerID.equals("root")) {
            %>
            <h2>관리자 기능</h2>
            <p>	<a href="./jsp/login/logoutAction.jsp">로그아웃</a> </p>
            <p>	<a href="./jsp/claim/processClaim.jsp">청구내역처리</a> </p>
            <%		
            	}else{
            %>
			<h2>회원 기능</h2>
			<p>	<a href="./jsp/login/logoutAction.jsp">로그아웃</a> </p>
			<p>	<a href="./jsp/policy/signUpPolicy.jsp">보험가입</a> </p>
			<p>	<a href="./jsp/claim/writeClaim.jsp">청구</a> </p>
			<p>	<a href="./jsp/event/writeEvent.jsp">사건작성</a> </p>
			<p>	<a href="./jsp/event/board.jsp">사건조회</a> </p>
			<p>	<a href="./jsp/info/myInfo.jsp">내정보조회</a> </p>
			<p>	<a href="./jsp/common/insuranceInfo.jsp">보험설명</a> </p>
			<p>	<a href="./jsp/common/murimInfo.jsp">문파정보조회</a> </p>
            <% 
            	}
            %>
     </div>
 </div>
 <button id="jsmode">바뀌기 전 text</button>
 <script type="text/javascript" src="./js/hello.js" ></script>
 </body>
 </html>
 