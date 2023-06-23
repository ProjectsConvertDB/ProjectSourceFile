<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>불러왔당께 착한 사람만 보임 ㅋ</h1>

	<table>
		<tr>
			<c:forEach items="${csvread}" var="csv">
				<td><c:out value="${csv}"></c:out></td>
			</c:forEach>
		</tr>
	</table>
</body>
</html>
