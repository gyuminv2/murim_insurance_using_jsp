<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div>
	<a href="../../home.jsp">메인 돌아가기</a>    
		<h1>회원가입</h1>
	</div>
	<form action="successCustomer.jsp" method="post">
		<div>
			<label>아이디</label> <input name="customerLoginID" type="text" maxlength='20'/>
		</div>
		<div>
			<label>비밀번호</label> <input name="customerPassword" type="text" maxlength='20'/>
		</div>
		<div>
			<label>이름</label> <input name="name" type="text" />
		</div>
		<div>
			<label>나이</label> <input name="age" type="number" min="1" max="100" />
		</div>
		<div>
			<label>성별</label>
			<div>
				<input type="radio" name="gender" value="남" checked> 남성<br>
				<input type="radio" name="gender" value="여"> 여성<br>
			</div>
 		</div>
		<div>
			<label>무술 등급: </label>
		      <select name="level">
		        <option value="삼류">삼류</option>
		        <option value="이류">이류</option>
		        <option value="일류">일류</option>
		        <option value="절정">절정</option>
		        <option value="초절정">초절정</option>
		        <option value="화경">화경</option>
		        <option value="현경">현경</option>
		        <option value="생사경">생사경</option>
		      </select>
		</div>
		<div>
			<label>소속 문파: </label>
		      <select name="clan">
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
		</div>
 		 <div>
			<label>데이터베이스에 등록</label>
			<input type="checkbox" name="joinCustomer">
		</div>
		<button type="submit">전송</button>
	</form>
</body>
</html>