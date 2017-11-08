<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, java.sql.Date, java.util.*" %>
<%
	Board board = (Board)request.getAttribute("board");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetailView</title>
</head>
<body>
<%@ include file="../../header.jsp" %>
<hr style="clear:both;">
<h2 align="center"><%= board.getBoardNum() %>번 게시글 상세보기</h2>
<br>
<table align="center" cellspacing="0" cellpadding="10" border="1" width="500">
<tr><th>제목</th><td><%= board.getBoardTitle() %></td></tr>
<tr><th>작성자</th><td><%= board.getBoardWriter() %></td></tr>
<tr><th>첨부파일</th>
	<td>
	<% if(board.getBoardOriginalFileName() == null){ %>
		첨부파일 없음
	<% }else{ %>
	<a href="/first/bfdown?ofile=<%= board.getBoardOriginalFileName() %>&rfile=<%= board.getBoardRenameFileName() %>">
		<%= board.getBoardOriginalFileName() %>
	</a>
	<% } %>
	</td>
</tr>
<tr><th>내용</th><td><%= board.getBoardContent() %></td></tr>
<tr><td colspan="2" align="center">
<%  if(member != null){ %>
	<a href="/first/views/board/boardReployForm.jsp?bnum=<%= board.getBoardNum() %>&page=<%= currentPage %>">[댓글달기]</a>
<% if(member.getMemberId().equals(board.getBoardWriter())){ %>
	<a href="/first/bupview?bnum=<%= board.getBoardNum() %>&page=<%= currentPage %>">[수정페이지로 이동]</a>
	&nbsp;
	<a href="/first/bdelete?bnum=<%= board.getBoardNum() %>">[삭제]</a>
<%  }} %>
&nbsp; 
<a href="/first/blist?page=<%= currentPage %>">[목록]</a>
</td></tr>
</table>
<br>
<hr>
<%@ include file="../../footer.html" %>
</body>
</html>











