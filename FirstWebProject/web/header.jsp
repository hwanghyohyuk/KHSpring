<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
 <%-- import="member.model.vo.Member"  --%>
<%-- 위의 태그는 지시자(directive) 태그라고 함. @뒤에 지시자를 써 줌
  지시자는 3가지가 제공되며, page, include, taglib 가 있음 --%>
<%-- 아래의 태그는 스크립트릿(scriptlet) 태그라고 함
  일반적인 자바소스 코드가 작성될 때 사용함. 
  메소드 안에서 코드 작성하는 것으로 이해하면 됨 --%>
<%-- <%
	Member member = (Member)session.getAttribute("member");
%> --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
<style type="text/css">
	ul { list-style: none; }
	nav ul li {
		float: left;
	}
	
	nav ul li a {
		display: block;
		width: 150px;
		height: 35px;
		background: orange;
		color: navy;
		padding-top: 7px;
		text-decoration: none;
		text-align: center;
		font-weight: bold;
		text-shadow: 1px 1px 4px black;
		margin-right: 3px;
	}
	
	nav ul li a:hover{ background: olive; }
	
	div#loginBox {
		background : lightgray;
		float: right;
		width: 200px;
		height: 100px;
		border: 1px dotted gray;
		margin-right: 200px;
		font-size: 9pt;
	}
	
</style>
</head>
<body>
<header>
<h1>Welcome firstWebProject</h1>
<nav>
<ul>
	<c:url var="index" value="/index.jsp" ><!-- parameter --></c:url>
	<li><a href="${index }">home</a></li>
	<c:url var="nlist" value="/blist" ><!-- parameter --></c:url>
	<li><a href="${nlist }">공지사항</a></li>
	<c:url var="blist" value="/blist" ><!-- parameter --></c:url>
	<li><a href="${blist }">댓글게시판</a></li>
	<c:url var="eltest" value="/views/eltest/elsample.jsp?value=apple&name=fruit&price=1500&type=A&type=B&type=C">el test" ><!-- parameter --></c:url>
	<li><a href="${eltest }">el test</a></li>
	<li><a href="#">메뉴5</a></li>
</ul>
</nav>
</header>
<hr style="clear:left;">
<div id="loginBox">
<%-- 로그인되지 않았다면 --%>
<%-- <%  if(member == null){ %> --%>
<c:if test="${empty sessionScope.member }">
<form action="login" method="post">
<input type="text" name="userid" placeholder="아이디 입력"> <br>
<input type="password" name="userpwd" placeholder="암호 입력"> <br>
<input type="submit" value="로그인">
</form>
<a href="views/member/enrollForm.html">회원가입</a> &nbsp;
<a>아이디/비밀번호 조회</a>
</c:if>
<%-- <%  }else{ %> --%>
<c:if test="${!empty sessionScope.member}">
<%-- <%= member.getMemberName() %>  --%> 
${ member.memberName }님 &nbsp; 
<a href="logout">로그아웃</a> <br>
<!-- <a href="views/member/myInfo.jsp">내정보보기</a> -->
<!-- 쿼리스트링 : ?이름=값&이름=값 -->
<%-- <a href="minfo?userid=<%= member.getMemberId() %>">내정보보기</a> --%>
<a href="minfo?userid=${member.memberId }">내정보보기</a>
<%-- <%  } %> --%>
</c:if>
</div>

</body>
</html>