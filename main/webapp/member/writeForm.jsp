<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form name="" method="post" action="">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">이름</td>
			<td>
				<input type="text" name="name" placeholder="이름 입력">
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">아이디</td>
			<td>
				<input type="text" name="id" placeholder="아이디 입력">
				<input type="button" value="중복체크">
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">비밀번호</td>
			<td>
				<input type="password" name="pwd" size="30" placeholder="비밀번호 입력">
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">재확인</td>
			<td>
				<input type="password" name="repwd" size="30" placeholder="비밀번호 입력">
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">성별</td>
			<td>
				<input type="radio" name="gender" value="0" checked>남
				<input type="radio" name="gender" value="1">여
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">이메일</td>
			<td>
				<input type="text" name="email1">
				@
				<input type="text" name="email2" list="email2" placeholder="직접입력">
				<datalist id="email2">
					<option value="naver.com">naver.com
					<option value="daum.net">daum.net
					<option value="gmail.com">gmail.com
				</datalist>
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">핸드폰</td>
			<td>
				<select name="tel1">
					<option value="010" selected>010</option>
					<option value="011" >011</option>
					<option value="019" >019</option>
				</select>
				-
				<input type="text" name="tel2" size="6" maxlength="4">
				-
				<input type="text" name="tel3" size="6" maxlength="4">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">주소</td>
			<td>
				<input type="text" name="zipcode">
				<input type="button" value="우편번호 검색"><br>
				<input type="text" name="addr1" size="60" placeholder="주소"><br>
				<input type="text" name="addr2" size="60" placeholder="상세주소">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="회원가입">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
</body>
</html>











