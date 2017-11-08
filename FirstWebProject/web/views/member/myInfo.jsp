<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
    <%-- import="member.model.vo.Member" %> --%>
<%-- <%
	//Member member = (Member)session.getAttribute("member");
	Member member = (Member)request.getAttribute("member");
%> --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
<style>
	th { background: lightgray; }
</style>
<script type="text/javascript">
	function mdel(){
		<%-- location.href = "/first/mdelete?userid=<%= member.getMemberId() %>"; --%>
		location.href = "/first/mdelete?userid=${ requestScope.member.getMemberId() }";
		return false;
	}
</script>
</head>
<body>
<h2 align="center"><%-- <%= member.getMemberName() %> --%>
${requestScope.member.memberName } 님 정보보기</h2>
<br><br>
<form action="../../mupdate" method="post">
<table align="center" width="600" height="350">
<tr><th width="150">아이디</th>
	<td width="450"><%-- <input name="userid" value="<%= member.getMemberId() %>" readonly> --%>
	<input name="userid" value="${requestScope.member.memberId }" readonly>
	</td>
</tr>
<tr><th>이 름</th>
	<td><%-- <input type="text" name="username" value="<%= member.getMemberName() %>"> --%>
	<input type="text" name="username" value="${requestScope.member.memberName }">
	</td>
</tr>
<tr><th>암 호</th>
	<td><%-- <input type="password" name="userpwd" value="<%= member.getMemberPwd() %>"> --%>
	<input type="password" name="userpwd" value="${requestScope.member.memberPwd }">
	</td>
</tr>
<tr><th>암호확인</th><td><input type="password" name="userpwd2"></td></tr>
<tr><th>성 별</th>
	<%-- <% if(member.getGender().equals("M")){ %> --%>
	<c:if test="${requestScope.member.gender eq 'M' }">
	<td><input type="radio" name="gender" value="M" checked> 남
		<input type="radio" name="gender" value="F"> 여
	</td>
	</c:if>
	<%-- <% }else{ %> --%>
	<c:if test="${requestScope.member.gender eq 'F' }">
	<td>
		<input type="radio" name="gender" value="M"> 남
		<input type="radio" name="gender" value="F" checked> 여
	</td>
	<%-- <%  } %> --%>
	</c:if>
</tr>
<tr><th>나 이</th>
	<td><%-- <input type="number" name="age" min="1" max="100" value="<%= member.getAge() %>"> --%>
	<input type="number" name="age" min="1" max="100" value="${member.age }">
	</td>
</tr>
<tr><th>전화번호</th>
	<td><%-- <input type="tel" name="phone" value="<%= member.getPhone() %>"> --%>
	<input type="tel" name="phone" value="${requestScope.member.phone }">
	</td>
</tr>
<tr><th>이메일</th>
	<td><%-- <input type="email" name="email" value="<%= member.getEmail() %>"> --%>
	<input type="email" name="email" value="${requestScope.member.email }">
	</td>
</tr>
<tr><th>주 소</th>
	<td><%-- <input type="text" name="address" value="<%= member.getAddress() %>"> --%>
	<input type="text" name="address" value="${requestScope.member.address }">
	</td>
</tr>
<tr><th>취 미</th>
	<td>
	
	<%-- <% 
		String[] hobby = member.getHobby().split(",");
		boolean[] checked = new boolean[9];
		for(int i = 0; i < hobby.length; i++){
			if(hobby[i].equals("독서"))	
				checked[0] = true;
			if(hobby[i].equals("운동"))	
				checked[1] = true;
			if(hobby[i].equals("등산"))	
				checked[2] = true;
			if(hobby[i].equals("그림"))	
				checked[3] = true;
			if(hobby[i].equals("요리"))	
				checked[4] = true;
			if(hobby[i].equals("음악"))	
				checked[5] = true;
			if(hobby[i].equals("게임"))	
				checked[6] = true;
			if(hobby[i].equals("댄스"))	
				checked[7] = true;
			if(hobby[i].equals("기타"))	
				checked[8] = true;
		}
	%>  --%>
	<%--
	<table>
	<tr>
	<%	if(checked[0] == true){ %>
		<td><input type="checkbox" name="hobby" value="독서" checked> 독서</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="독서"> 독서</td>	
	<%  } %>
	<%	if(checked[1] == true){ %>
		<td><input type="checkbox" name="hobby" value="운동" checked> 운동</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="운동"> 운동</td>
	<%  } %>
	<%	if(checked[2] == true){ %>
		<td><input type="checkbox" name="hobby" value="등산" checked> 등산</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="등산"> 등산</td>
	<%  } %>
	</tr>
	<tr>
	<%	if(checked[3] == true){ %>
		<td><input type="checkbox" name="hobby" value="그림" checked> 그림</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="그림" > 그림</td>
	<%  } %>
	<%	if(checked[4] == true){ %>
		<td><input type="checkbox" name="hobby" value="요리" checked> 요리</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="요리" > 요리</td>
	<%  } %>
	<%	if(checked[5] == true){ %>
		<td><input type="checkbox" name="hobby" value="음악" checked> 음악</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="음악" > 음악</td>
	<%  } %>
	</tr>
	<tr>
	<%	if(checked[6] == true){ %>
		<td><input type="checkbox" name="hobby" value="게임" checked> 게임</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="게임" > 게임</td>
	<%  } %>
	<%	if(checked[7] == true){ %>	
		<td><input type="checkbox" name="hobby" value="댄스" checked> 댄스</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="댄스" > 댄스</td>
	<%  } %>
	<%	if(checked[8] == true){ %>
		<td><input type="checkbox" name="hobby" value="기타" checked> 기타</td>
	<%  }else{  %>
		<td><input type="checkbox" name="hobby" value="기타" > 기타</td>
	<%  } %>
	</tr>
	
	</table>	
	--%>
	
	<%-- <c:set var="hobby" value="${ fn:split(requestScope.member.hobby, ',') }" />
		<c:forEach var="i" begin="0" end="8" step="1">
		<c:if test="${hobby[i] eq '독서' }"> <c:set var="checked0" value="checked" /></c:if>
		<c:if test="${hobby[i] eq '운동' }"> <c:set var="checked1" value="checked" /></c:if>
		<c:if test="${hobby[i] eq '등산' }"> <c:set var="checked2" value="checked" /></c:if>
		<c:if test="${hobby[i] eq '그림' }"> <c:set var="checked3" value="checked" /></c:if>
		<c:if test="${hobby[i] eq '요리' }"> <c:set var="checked4" value="checked" /></c:if>
		<c:if test="${hobby[i] eq '음악' }"> <c:set var="checked5" value="checked" /></c:if>
		<c:if test="${hobby[i] eq '게임' }"> <c:set var="checked6" value="checked" /></c:if>
		<c:if test="${hobby[i] eq '댄스' }"> <c:set var="checked7" value="checked" /></c:if>
		<c:if test="${hobby[i] eq '기타' }"> <c:set var="checked8" value="checked" /></c:if>
	</c:forEach> --%>	
	<c:forTokens var="hobby" items="${member.hobby }" delims="," >
		<c:if test="${hobby eq '독서' }"> <c:set var="checked0"  value="checked" /></c:if>
		<c:if test="${hobby eq '운동' }"> <c:set var="checked1"  value="checked" /></c:if>
		<c:if test="${hobby eq '등산' }"> <c:set var="checked2"  value="checked" /></c:if>
		<c:if test="${hobby eq '그림' }"> <c:set var="checked3"  value="checked" /></c:if>
		<c:if test="${hobby eq '요리' }"> <c:set var="checked4"  value="checked" /></c:if>
		<c:if test="${hobby eq '음악' }"> <c:set var="checked5"  value="checked" /></c:if>
		<c:if test="${hobby eq '게임' }"> <c:set var="checked6"  value="checked" /></c:if>
		<c:if test="${hobby eq '댄스' }"> <c:set var="checked7"  value="checked" /></c:if>
		<c:if test="${hobby eq '기타' }"> <c:set var="checked8"  value="checked" /></c:if>	
	</c:forTokens>	
	<table>
	<tr>
		<td><input type="checkbox" name="hobby" value="독서" ${ checked0 }> 독서</td>
		<td><input type="checkbox" name="hobby" value="운동" ${ checked1 }> 운동</td>
		<td><input type="checkbox" name="hobby" value="등산" ${ checked2 }> 등산</td>
	</tr>
	<tr>	
		<td><input type="checkbox" name="hobby" value="그림" ${ checked3 }> 그림</td>
		<td><input type="checkbox" name="hobby" value="요리" ${ checked4 }> 요리</td>
		<td><input type="checkbox" name="hobby" value="음악" ${ checked5 }> 음악</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="hobby" value="게임" ${ checked6 }> 게임</td>
		<td><input type="checkbox" name="hobby" value="댄스" ${ checked7 }> 댄스</td>
		<td><input type="checkbox" name="hobby" value="기타" ${ checked8 }> 기타</td>
	</tr>
	
	</table>	
	</td>
</tr>
<tr><th colspan="2">
	<input type="submit" value="수정하기"> &nbsp;
	<input type="reset" value="취소"> &nbsp;
	<button onclick="return mdel();">탈퇴하기</button>
</th></tr>
</table>
</form>
<br><br>
<div align="center">
	<a href="/first/index.jsp">시작페이지로 이동</a>
</div>



</body>
</html>





