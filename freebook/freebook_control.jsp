<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="freebook_error.jsp" import = "jspbook.freebook.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "fb" scope="page" class="jspbook.freebook.FreeBean"/>
<jsp:useBean id = "freebook" class="jspbook.freebook.FreeBook"/>
<jsp:setProperty property="*" name="freebook"/>

<%
	String action = request.getParameter("action");
	if(action.equals("list")){

		response.sendRedirect("freebook_list.jsp");
		
	}else if(action.equals("insert")){
		if(fb.insertDB(freebook)){
			response.sendRedirect("freebook_control.jsp?action=list");
		}else{
			throw new Exception("DB 입력 오류");
		}
		
	}else if(action.equals("edit")){
		FreeBook fbook = fb.getDB(freebook.getFb_id());
		if(request.getParameter("upasswd").equals("7756") == false){
			out.println("<script>alert('비밀번호가 틀렸습니다!!'); history.go(-1); </script>");
		}else{
			request.setAttribute("fb", fbook);
			pageContext.forward("freebook_edit_form.jsp");
		}
		
	}else if(action.equals("update")){
		if(fb.updateDB(freebook)){
			response.sendRedirect("freebook_control.jsp?action=list");
		}else{
			throw new Exception("DB 입력 오류");
		}
	
		
	}else if(action.equals("delete")){
		if(fb.deleteDB(freebook.getFb_id())){
			response.sendRedirect("freebook_control.jsp?action=list");
			
		}else
			throw new Exception("DB 삭제 오류");
		
	
	}else{
		
	}
	

%>