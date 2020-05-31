<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="freebook_error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<link rel= "stylesheet" href="freebook.css" type="text/css" media="screen"/>

</head>
<body>
	<div align="center">
		<h1>나눔 책 등록</h1>
		<hr>
		[<a href=freebook_list.jsp>책 목록으로</a>]
		<p>
		<form name=form1 method=post action=freebook_control.jsp>
		<input type = hidden name = "action" value="insert">
			<table border="1">
				<tr>
					<th>도서명</th>
					<td><input type="text" name="fb_bookname" maxlength="30"></td>
				</tr>
				<tr>
				<tr>
					<th>저자</th>
					<td><input type="text" name="fb_writer" maxlength="20"></td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><input type="text" name="fb_publisher" maxlength="20"></td>
				</tr>
				<tr>
					<th>출판일</th>
					<td><input type="date" name="fb_publicationdate"></td>
				</tr>
				<tr>
					<th>메모</th>
					<td><input type="text" name="fb_memo"></td>
				</tr>
				<tr>
				<td colspan = 2 align= center>
				<input type = submit value = "저장">
				<input type = reset value= "취소"></td>
				




			</table>


		</form>




	</div>
</body>
</html>