<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="freebook_error.jsp "
	import="java.util.*, jspbook.freebook.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
if(session.getAttribute("id")!=null){
}else{
	out.println("<script>location.href='../login/login_form.html'</script>");

}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<script type="text/javascript">
	function outcheck(){
	
		result = confirm("정말로 로그아웃 하시겠습니까?");
		
		if(result){
			
			return;
		}else
			<% session.invalidate(); %>
			return;
		
	}
</script>


<script language="JavaScript">
	function check(fb_id) {
		pwd = prompt('수정 / 삭제 하려면 관리자 비밀번호를 넣으세요');
		document.location.href = "freebook_control.jsp?action=edit&fb_id=" + fb_id + "&upasswd=" + pwd;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Free Book Share List</title>
<link rel="stylesheet" href="freebook.css" type="text/css"
	media="screen" />


</head>
<body>


	<h1>
	
		나눔 책 목록 <input type="button" value="로그아웃" onclick="outcheck()">

	</h1>
	<hr>
	<form>
		<a href="freebook_form.jsp">책 등록</a>
		<p>
		<table border="1">
			<tr>
				<th>번 호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>출판일</th>
				<th>메모</th>
			</tr>

			<%
					FreeBean ff = new FreeBean();
					datas = ff.getDBList();
					for (FreeBook fb : (ArrayList<FreeBook>)datas) {
				%>
			<tr>
				<td><a href="javascript:check( <%=fb.getFb_id()%> )"> <%=fb.getFb_id()%>
				</a></td>
				<td><%=fb.getFb_bookname()%></td>
				<td><%=fb.getFb_writer()%></td>
				<td><%=fb.getFb_publisher()%></td>
				<td><%=fb.getFb_publicationdate()%></td>
				<td><%=fb.getFb_memo()%></td>
			</tr>
			<%
					};
				%>
		</table>

	</form>

</body>
</html>