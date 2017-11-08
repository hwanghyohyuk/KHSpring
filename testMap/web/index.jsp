<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:url var="distanceGoogle" value="/views/distanceMatrix.jsp" ></c:url>
<a href="${distanceGoogle }" >구글 지도로 거리계산하기 이동</a>
<c:url var="distanceDaum" value="/views/distanceMatrixDaum.jsp" ></c:url>
<a href="${distanceDaum }" >다음 지도로 거리계산하기 이동</a>
</body>
</html>