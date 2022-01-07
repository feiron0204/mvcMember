<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그아웃 되셨습니다~</h3>
<script type="text/javascript">
window.onload=function(){
	alert("회원정보수정 완료!");
	location.href='/mvcMember/member/loginForm.do';
}
</script>
</body>

</html>