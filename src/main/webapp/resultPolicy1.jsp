<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보험가입결과</title>
</head>
<body>
	<%
		try {
			String customerLoginID = request.getParameter("customerLoginID");
			String type = request.getParameter("type");
			
			String gender = request.getParameter("gender");
			String levelName = request.getParameter("levelName");
			int reputation = Integer.parseInt(request.getParameter("reputation"));
						
			int premium = 0;
			int type_price = 0;
			int level_price = 0;
			int reput_price = 0;
			int gender_price = 0;
			// type 금액 (생명 1000만원, 상해 500만원)
			if (type.equals("생명보험")) type_price += 10000000;
			else type_price += 5000000;
			// 무술 금액 (등급이 높을수록 +300만원 증가)
			if (levelName.equals("이류")) level_price += 3000000; 
			else if (levelName.equals("일류")) level_price += 6000000; 
			else if (levelName.equals("절정")) level_price += 9000000; 
			else if (levelName.equals("초절정")) level_price += 12000000; 
			else if (levelName.equals("화경")) level_price += 15000000; 
			else if (levelName.equals("현경")) level_price += 18000000; 
			else if (levelName.equals("생사경")) level_price += 21000000;
			else ; 
			// 명성 (등급이 높을수록 1000만원 증가)
			if (reputation == 4) reput_price += 10000000; 
			else if (reputation == 3) reput_price += 20000000; 
			else if (reputation == 2) reput_price += 30000000; 
			else if (reputation == 1) reput_price += 40000000;
			// 성별 (남자가 먼저 죽을 확률이 높으므로 남자 500만원 증가)
			if (gender.equals("남")) gender_price += 5000000;
			
			premium += type_price + level_price + reput_price + gender_price;
			
			String redirect = null;
			
			String insert = request.getParameter("joinPolicy");
			
			if (insert != null && insert.equals("on")) {
				session.setAttribute("type", type);
				session.setAttribute("premium", premium);
				session.setAttribute("customerLoginID", customerLoginID);
				redirect = "joinPolicy.jsp";
			}
			
			if (redirect != null)
				response.sendRedirect(redirect);
			
	%>
	<div>
		<h1>결과</h1>
		<p>전송된 내용은 다음과 같습니다.</p>
		<p>
			customerLoginID :
			<%=customerLoginID%>
		</p>
		<p>
			type :
			<%=type%>
		</p>
		<p>
			gender :
			<%=gender%>
		</p>
		<p>
			levelName :
			<%=levelName%>
		</p>
		<p>
			reputation :
			<%=reputation%>
		</p>
		<p>
			책정 보험료 :
			<%=premium%>
		</p>
		<p>
			보험료 추출 과정 :
			보험종류(<%=type_price%>) + 무술등급(<%=level_price%>) + 문파명성(<%=reput_price%>) + 성별(<%=gender_price%>)
		</p>
	</div>
	<%
		} catch (NumberFormatException e) {
		System.out.println(e);
	%>
	<h1>이런 !</h1>
	<p>
		올바른 정보를 입력해주세요... :(
		<%
		}
	%>
</body>
</html>