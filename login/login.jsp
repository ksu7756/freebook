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
	
		<%if(loginbean.login(membership)){
			
			session.isNew();
			session.setMaxInactiveInterval(1800);
			session.setAttribute("id", membership.getM_id());
			
			
			response.sendRedirect("../freebook/freebook_list.jsp");
			
		%>
			
		
	
		<%}
		else{%>
		
			[<a href=login_form.html>돌아가기</a>]
			<p> 로그인 실패 </p>
			
			<p>아이디와 비밀번호를 확인하세요.</p>
			
		<%
		}
		%>
	</div>

</body>
</html>