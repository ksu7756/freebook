<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="loginbean" scope="page" class="login.LoginBean" />
<jsp:useBean id="membership" scope="page" class="login.Membership" />
<jsp:setProperty property="*" name="membership" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>회원가입 결과</h1>
		<hr>
		[<a href=joinin_form.html>돌아가기</a>]
		<p>
		
		<%if(loginbean.insertDB(membership)){
			
			
		
		%>
		
		<table border="1">
			
			<tr>
				<th>ID</th>
				<td><%=membership.getM_id() %></td>
			</tr>
			<tr>
			<tr>
				<th>비밀번호</th>
				<td><%=membership.getM_pwd() %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=membership.getM_name() %></td>
			</tr>
			<tr>
				<th>E-MAIL</th>
				<td><%=membership.getM_email() %></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=membership.getM_tel() %></td>
			</tr>
			
		</table>
		
		<%}
		else{%>
			
			<p> 회원가입 실패 </p>
			
			<p>아이디 중복 및 공란 오류입니다.</p>
			
		<%
		}
		%>
	</div>

</body>
</html>