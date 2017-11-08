<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testFmt.jsp</title>
</head>
<body>
<h4>testCore.jsp 파일에서 만든 변수 sum 값 확인 : ${sessionScope.sum }</h4>

<!-- 한글 인코딩 , 날짜 시간 처리 -->
<h2>jstl fomatting library</h2>
<h4>지역대 설정 : fmt:setLocale 태그</h4>

 <%@page import="java.util.*" %>
 <c:set var="date" value="<%=new Date() %>"/>

[오늘의 날짜] <fmt:formatDate value="${date}" type="date"/><br/>  <%-- 정해진폼의 날짜 formatDate --%>
[오늘의 날짜] <fmt:formatDate value="${date}" type="both"/><br/>
[현재의 시간] <fmt:formatDate value="${date}" type="time"/><br/> 
[오늘의 날짜: S ] <fmt:formatDate value="${date}" type="both" dateStyle="short" timeStyle="short"/><br/>
[오늘의 날짜: M ] <fmt:formatDate value="${date}" type="both" dateStyle="medium" timeStyle="medium"/><br/>
[오늘의 날짜: L ] <fmt:formatDate value="${date}" type="both" dateStyle="long" timeStyle="long"/><br/>
[오늘의 날짜: F ] <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/><br/>
[오늘의 날짜] <fmt:formatDate value="${date}" type="date" pattern="yyyy-MM-dd"/><br/>
[오늘의 날짜] <fmt:formatDate value="${date}" type="time" pattern="(a)hh:mm:ss"/><br/>

첫번째 수:<fmt:formatNumber value="1234500" groupingUsed="true"/><br/><%-- groupingUsed는 천단위마다 콤마를찍음(디폴트로 정해짐) --%>
두번째 수:<fmt:formatNumber value="3.14158" pattern="##.##"/><br/><%-- #은 자리표기 숫자가 없으면 공백으로--%>
세번째 수:<fmt:formatNumber value="10.5" pattern="#.00"/><br/><%-- 0은 자리표기 숫자가 없으면 0으로--%>
금액:<fmt:formatNumber value="${vo.goods_price}" pattern="\#,###.##"/><br/>
금액:<fmt:formatNumber value="1000000" type="currency" currencySymbol="￦"/><br/>
금액:<fmt:formatNumber value="1000000" pattern="$#,###.00"/><br/>
퍼센트:<fmt:formatNumber value="0.99" type="percent"/><br/>
퍼센트:<fmt:formatNumber value="0.99" pattern="#,###.00%"/><br/>

</body>
</html>