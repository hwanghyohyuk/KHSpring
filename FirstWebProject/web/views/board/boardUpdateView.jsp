<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board" %>
<%
	Board board = (Board)request.getAttribute("board");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdateView</title>
</head>
<body>
<%@ include file="../../header.jsp" %>
<hr style="clear:both;">
<br>
<h2 align="center"><%= board.getBoardNum() %> 번글 수정페이지</h2>
<% 	//원글일 때 
	if(board.getBoardLevel() == 0){ %>
<form action="/first/bupdate0" method="post" enctype="multipart/form-data">
<input type="hidden" name="bnum" value="<%= board.getBoardNum() %>">
<input type="hidden" name="ofile" value="<%= board.getBoardOriginalFileName() %>">
<input type="hidden" name="rfile" value="<%= board.getBoardRenameFileName() %>">
<input type="hidden" name="page" value="<%= currentPage %>">

<table align="center" border="1" cellspacing="0" width="700">
<tr><th>제목</th><td><input type="text" name="btitle" value="<%= board.getBoardTitle() %>"></td></tr>
<tr><th>작성자</th>
<td><input type="text" readonly name="bwriter" value="<%= board.getBoardWriter() %>"></td></tr>
<tr><th>첨부파일</th>
<td>
<% if(board.getBoardOriginalFileName() != null){ %>
	<%= board.getBoardOriginalFileName() %>
<% } %> <br>
<input type="file" name="upfile"></td></tr>
<tr><th>내용</th><td><textarea cols="50" rows="7" name="bcontent"><%= board.getBoardContent() %></textarea></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="수정하기">	
	</td>
</tr>
</table>
</form>
<% }else{ //댓글일 때 %>
<form action="/first/bupdate1" method="post">
<input type="hidden" name="bnum" value="<%= board.getBoardNum() %>">
<input type="hidden" name="page" value="<%= currentPage %>">

<table align="center" cellspacing="0" border="1" width="500">
<tr><th>제목</th><td><input type="text" name="btitle" value="<%= board.getBoardTitle() %>"></td></tr>
<tr><th>작성자</th>
<td>
<input type="text" name="bwriter" value="<%= board.getBoardWriter() %>" readonly></td></tr>
<tr><th>내용</th><td><textarea name="bcontent" rows="7" cols="50"><%= board.getBoardContent() %></textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="댓글수정">	
</th></tr>
</table>
</form>
<% } %>
<br>
<div align="center">
<a href="/first/blist?page=<%= currentPage %>">목록</a>
</div>
<%@ include file="../../footer.html" %>
</body>
</html>













