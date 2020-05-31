<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="freebook_error.jsp" import="jspbook.freebook.*"%>
<jsp:useBean id="fb" scope = "request" class="jspbook.freebook.FreeBook"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function delcheck(){
		result = confirm("정말로 삭제하시겠습니까?");
		
		if(result){
			document.form1.action.value="delete";
			document.form1.submit();
			
		}else
			return;
		
	}
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<link rel= "stylesheet" href="freebook.css" type="text/css" media="screen"/>

</head>
<body>
	<div align="center">
		<h1>책 등록 정보 변경</h1>
		<hr>
		[<a href=freebook_list.jsp>책 목록으로</a>]
		<form name="form1" method=post action=freebook_control.jsp>
			<input type=hidden name="fb_id" value="<%=fb.getFb_id()  %>">
			<input type=hidden name="action" value="update">

			<table border="1">

				<tr>
					<th>도서명</th>
					<td><input type="text" name="fb_bookname" value = "<%=fb.getFb_bookname() %>"></td>
				</tr>
				<tr>
					<th>저자</th>
					<td><input type="text" name="fb_writer" value = "<%=fb.getFb_writer() %>"></td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><input type="text" name="fb_publisher" value ="<%=fb.getFb_publisher() %>"></td>
				</tr>
				<tr>
					<th>출판일</th>
					<td><input type="date" name="fb_publicationdate" value = "<%=fb.getFb_publicationdate()  %>"></td>
				</tr>
				<tr>
					<th>메모</th>
					<td><input type="text" name="fb_memo" value = "<%=fb.getFb_memo() %>"></td>
				</tr>
				<tr>
				<td colspan = 2 align= center><input type = submit value = "저장" >
				<input type = reset value= "변경 초기화"><input type = "button" value = "삭제" onClick="delcheck()"></td>
				</tr>


			</table>


		</form>


	</div>
</body>
</html>