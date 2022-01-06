<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${name}님 로그인 성공</h3>

<input type="button" value="회원정보수정" onclick="location.href='modifyForm.do?id=${id}'" id="modifyBtn">
</body>
</html>