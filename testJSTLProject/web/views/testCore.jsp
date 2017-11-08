<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testCore.jsp</title>
</head>
<body>
<h2>JSTL Core 라이브러리 테스트</h2>
<h4>변수 선언 : c:set 태그 사용</h4>
<c:set var="num1" value="100" />
num1 : ${num1 } <br>
<%
	int num = 123;
%>
<c:set var="sum" value="<%= num * 3 %>" scope="session" />
sum : ${sum } <br>
<c:set var="num2" value="${sum div num1 }" />
num2 : ${num2 } <br>
<hr>
<h4>c:set 태그로 배열 만들기</h4>
<c:set var="array1">
	apple,banana,grape,melon,orange
</c:set>
array1 배열값 확인 : ${array1 } <br>
<hr>
sum 변수 삭제 : c:remove 태그 <br>
<c:remove var="sum" scope="session" />
<hr>
<h4>태그가 적용된 문자열값 출력 처리 : c:out 태그</h4>
<c:out value="<font size='7' color='red'>태그가 적용 안 되는 문자열값</font>" /> <br>
<c:out value="<font size='7' color='red'>태그가 적용되는 문자열값</font>" escapeXml="false" /> <br>
<c:out value="${param.name }" default="guest" /> 님 환영합니다.<br>
<hr>
<h4>c:if 태그 : 조건문 if 와 같은 태그임</h4>
num1과 num2 변수값 비교, 둘 중의 큰 값 출력 확인<br>
num1 : ${num1 }<br>
num2 : ${num2 }<br>
큰 값 : 
<c:if test="${num1 ge num2 }">
	${num1 }
</c:if>
<c:if test="${num1 lt num2 }">
	${num2 }
</c:if>
<br>
<hr>
<h4>자바의 switch 문 : c:choose 태그</h4>
<c:set var="no" value="${param.no }" />
<c:choose>
	<c:when test="${no eq 1 }">안녕하세요.</c:when>
	<c:when test="${no eq 2 }">반갑습니다.</c:when>
	<c:when test="${no eq 3 }">환영합니다.</c:when>
	<c:otherwise>어서오세요.</c:otherwise>
</c:choose>
<br>
<hr>
<h4>자바의 for문 : c:forEach 태그</h4>
<c:forEach var="cnt" begin="1" end="10" step="2">
	${cnt } 번째 반복문<br>
</c:forEach>
<hr>
<c:forEach var="size" begin="1" end="7">
	<font size="${size }">반복문적용 문자열 크기</font><br>
</c:forEach>
<hr>
<c:set var="colors">
	red,yellow,green,blue,magenta
</c:set>
<c:forEach var="color" items="${colors }">
	<font color="${color }">색상이 적용된 문자열</font> <br>
</c:forEach>
<hr>
items 속성에 사용할 수 있는 값 : Array, Collection, List, Map, Iterator 객체<br>
<h4>Map 객체값 다루기</h4>
<%@ page import="java.util.*, el.model.vo.User" %>
<%
HashMap<String,User> hMap = new HashMap<String,User>();
hMap.put("홍길동", new User("홍길동",25,"010-1234-1234","hong1234@kh.org"));
hMap.put("홍길서", new User("홍길서",26,"010-1234-1235","hong1235@kh.org"));
hMap.put("홍길남", new User("홍길남",27,"010-1234-1236","hong1236@kh.org"));
%>

<c:forEach items='<%=hMap %>' var='mUser' varStatus='st'>
${st.count}번째 객체 정보, index=${st.index },current=${st.current},first=${st.first },last=${st.last } = [
${mUser.key} : ${mUser.value.name }, ${mUser.value.age }, ${mUser.value.phone }, ${mUser.value.email }]<br>
</c:forEach>
<hr>
<ul>
<h4>c:forTokens 태그 : 자바의 for 문과 StringTokenizer 클래스의 기능을 합친 태그</h4>
<c:forTokens items="apple banana melon grape orange" delims=" " var="fruit">
<li>${fruit }</li>
</c:forTokens>
</ul>
<hr>
<h4>분리할 토큰 문자가 여러 개일 때</h4>
<c:set var="type" value="bus/subway-taxi,truck"/>
<c:forTokens items="${type }" delims="/-," var="k"><!-- 분리할 토큰을 넣으면 됨! -->
	${k }<br>
</c:forTokens>
<hr>
<h4>c:url 태그 : html 태그의링크 설정시 대상명?이름=값을 별도로 지정하는 용도의 태그</h4>
<c:url var="u" value="testUrl.jsp">
<c:param name="name" value="kh mobile"></c:param>
<c:param name="price" value="2350"></c:param>
</c:url>
<a href="${u }">testUrl.jsp 페이지로 이동</a><br>
<hr>
<h4>c:catch 자바 예외처리 와 같음</h4>
<c:catch var="e"> <%-- 자바의 try 블럭을 의미함 --%>
	<c:set var="value" value="null" />
	나눈 결과 : ${ num1 div value } <br>
</c:catch>
<%-- 위의 catch 영역에서 예외가 발생하면 --%>
<c:if test="${ e != null }">
	에러 메세지 : ${ e.message } <br>
</c:if>
<hr>
<h4>c:redirect 태그 : response.sendRedirect() 메소드와 같은 태그</h4>
<c:set var="test2" value="0" />
<c:if test="${test2 eq 1 }">
	<c:redirect url="testFmt.jsp" />
</c:if>
<hr>
<h4>c:import 태그 : jsp include 지시자 또는 jsp 표준액션태그 jsp:include 와 같음</h4>
<%-- <%@ include file="footer.html" %> --%>
<c:import url="footer.html" charEncoding="UTF-8"/>







<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>




