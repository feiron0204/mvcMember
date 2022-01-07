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

<%-- 이젠 세션에 실려있음 id정보가
<input type="button" value="회원정보수정" id="modifyBtn" onclick="location.href='modifyForm.do?id=${id}'"> --%>
<input type="button" value="회원정보수정" id="modifyBtn" onclick="location.href='modifyForm.do'">
<input type="button" value="로그아웃" onclick="location.href='/mvcMember/member/logout.do'">
<!-- 강사님답 (세션처리후라서 id 가져갈필요없음)
<input type="button" value="회원정보수정" id="modifyBtn">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#modifyBtn').click(function(){
	location.href='/mvcMember/member/modifyForm.do?id=${id}';
});
</script>
 -->

</body>
</html>