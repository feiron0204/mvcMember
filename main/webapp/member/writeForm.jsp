<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
/* #nameDiv {
	color : red;
	font-size: 8pt;
	font-weight: bold;
	근데 이렇게 하나하나설정하게?ㄴㄴ
} */
/* 이래봣자 안먹힘 인라인설정되어있어서 */
#writeForm div{
color : red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<form name="writeForm" id="writeForm" method="post" action="http://localhost:8090/mvcMember/member/write.do">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">이름</td>
			<td>
				<input type="text" name="name" id="name" placeholder="이름 입력">
				<!-- <div id="nameDiv" style="border:1px solid red; font-size:8pt; color:red;"></div> 
				이렇게 말고 밖에써주는게 좋음-->
				<div id="nameDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">아이디</td>
			<td>
				<input type="text" name="id" id="id" placeholder="아이디 입력">
				<input type="hidden" name="checkIdHidden" id="checkIdHidden" value="not">
				<input type="button" name="checkIdBtn" id="checkIdBtn" value="중복체크">
				<!-- 강사님체크확인
				<input type="hidden" name="check" id="check" value="">
				
				 -->
				<div id="idDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">비밀번호</td>
			<td>
				<input type="password" name="pwd" id="pwd" size="30" placeholder="비밀번호 입력">
				<div id="pwdDiv"></div>
			</td>	
		</tr>
		
		<tr>
			<td width="100" align="center">재확인</td>
			<td>
				<input type="password" name="repwd" id="repwd" size="30" placeholder="비밀번호 입력">
				<div id="repwdDiv"></div>
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
				<input type="text" name="tel2" size="6" maxlength="4" >
				-
				<input type="text" name="tel3" size="6" maxlength="4">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">주소</td>
			<td>
				<input type="text" name="zipcode" id="zipcode" readonly>
				<input type="button" value="우편번호 검색" onclick="checkPost()" ><br>
				<input type="text" name="addr1" id="addr1" size="60" placeholder="주소" readonly><br>
				<input type="text" name="addr2" id="addr2" size="60" placeholder="상세주소">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<!-- <input type="button" onclick="자바 스크립트 호출" value="회원가입"> -->
				<!-- <input type="button" onclick="javascript:checkWrite()" value="회원가입"> -->
				<!-- <input type="button" onclick="checkWrite()" value="회원가입"> -->
				<input type="button" id="writeBtn" value="회원가입">
				<input type="reset" id="resetBtn" value="다시작성">
			</td>
		</tr>
	</table>
</form >
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 다음 우편번호 검색을 위한 스크립트 -->
<script type="text/javascript">
$('#id').change(function(){
	$('#checkIdHidden').val("not");
});
$('#resetBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
});
//회원가입
$('#writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if($('#name').val() == "") $('#nameDiv').text("이름을 입력하세요");
	else if($('#id').val() =="") $('#idDiv').text("아이디를 입력하세요");
	else if($('#pwd').val() =="") $('#pwdDiv').text("비밀번호를 입력하세요");
	else if($('#pwd').val() != $('#repwd').val()) $('#repwdDiv').text("비밀번호가 맞지 않습니다.");
	else if($('#checkIdHidden').val()=="not") $('#idDiv').text("아이디 중복확인을 진행해주세요.");
	/* 강사님답
	else if($('#id').val() != $('#check').val()) $('#idDiv').text("중복체크하세요");
	*/
	else document.writeForm.submit();
});
// jquery로 쓰면 맨 아래 자잘한 주석 위 이거한줄로끝

//아이디 중복 체크
//$('#checkIdBtn').click(function(){});
$('input[name="checkIdBtn"]').click(function(){
	$('#idDiv').empty();
	var sId=$('#id').val();
	if(sId=="") {
		$('#idDiv').text('먼저 아이디를 입력해주세요.');
		//$('#idDiv').css('color','magenta');
	}else{
		window.open("/mvcMember/member/checkId.do?id="+sId,"checkId","width=450 height=150 left=700 top=300");
		//이름주면 안열림(중간에넣는값)
	}
							
});

//이거 아래는 다음에서 지원해준거
 function checkPost() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
               // var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                     /* // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    
                    if(extraAddr !== ''){
                      //  extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("sample6_extraAddress").value = extraAddr;
                  */
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
<!-- <script type="text/javascript">
	/* public void checkWrite(){
		//자바
	} */
	function checkWrite(){
		/* //자바스크립트
		if(document.writeForm.name.value == "") alert("이름 입력하세요");
		else if(document.writeForm.id.value =="") alert("아이디 입력하세요");
		else if(document.writeForm.pwd.value =="") alert("비밀번호 입력하세요");
		else if(document.writeForm.pwd.value != document.writeForm.repwd.value) alert("비밀번호가 맞지 않습니다.");
		else document.writeForm.submit();
		//다만족한다면 form태그 action 실행! 
		id 속성 넣어주기 전 부르는 방법
		*/
		
		/* //id속성 넣어준 후 부르는 방법
		if(document.getElementById("name").value == "") alert("이름 입력하세요");
		else if(document.getElementById("id").value =="") alert("아이디 입력하세요");
		else if(document.getElementById("pwd").value =="") alert("비밀번호 입력하세요");
		else if(document.getElementById("pwd").value != document.getElementById("repwd").value) alert("비밀번호가 맞지 않습니다.");
		else document.writeForm.submit();
		//다만족한다면 form태그 action 실행!  
		jquery 쓰기전 alert 시러서 바꿔줄꺼임
		*/
		$('#nameDiv').empty();
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		$('#repwdDiv').empty();
		
		if($('#name').val() == "") $('#nameDiv').text("이름을 입력하세요");
		else if($('#id').val() =="") $('#idDiv').text("아이디를 입력하세요");
		else if($('#pwd').val() =="") $('#pwdDiv').text("비밀번호를 입력하세요");
		else if($('#pwd').val() != $('#repwd').val()) $('#repwdDiv').text("비밀번호가 맞지 않습니다.");
		else document.writeForm.submit();
	}
	
</script> -->
</body>
</html>


<!-- 
<input type="button">

<button ~~~></button> -- return false해버리면 서브밋못함

<div></div> <span></span>

inline
block
inlick-block
 -->






