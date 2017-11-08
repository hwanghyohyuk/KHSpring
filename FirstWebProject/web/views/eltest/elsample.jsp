<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELignored="false" %>
<%-- <%
	String value = request.getParameter("value");
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	String[] types = request.getParameterValues("type");
%>  --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elsample</title>
</head>
<body>
<h2>header.jsp 의 메뉴항목에서 쿼리스트링으로 전송온 값 확인</h2>
<h4>과일명 : <%-- <%= value %> --%> ${param.value }</h4>
<h4>종류 : <%-- <%= name %> --%> ${param.name }</h4>
<h4>가격 : <%-- <%= price %> --%> ${param.price mod 4 }</h4>
<h4>등급 : ${paramValues.type[0] }, ${paramValues.type["1"] }, ${paramValues.type[2] }</h4>
<h4>로그인 상태 확인 : <%= session.getAttribute("member") != null? "로그인함": "로그인 안 함" %></h4>
<h4>el로 로그인 상태 확인 : ${ not empty sessionScope.member ? "로그인함" : "로그인 안 함" }</h4>
</body>
</html>






