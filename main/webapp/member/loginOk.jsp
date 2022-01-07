<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//자바파일 또만들기 귀찬아서 쿠키실습을위해 스크립트릿잠깐씀
//쿠키
// 특정 쿠키만 가져올수가없음
Cookie[] ar = request.getCookies();
if(ar !=null){
	for(int i=0;i<ar.length;i++){
		String cookieName = ar[i].getName();
		String cookieValue = ar[i].getValue();
		
		System.out.println("쿠키명 = "+cookieName);
		System.out.println("쿠키값 = "+cookieValue);
		System.out.println();
	}
}

//세션
session.getAttribute("memName");//이런식인데 EL에있음
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <h3>${name}님 로그인 성공</h3> -->
<h3>${sessionScope.memName}님 로그인 성공</h3>

<input type="button" value="회원정보수정" onclick="location.href='modifyForm.do?id=${id}'" id="modifyBtn">
<input type="button" value="로그아웃" onclick="location.href='/mvcMember/member/logout.do'">

</body>
</html>