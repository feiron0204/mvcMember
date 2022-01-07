package member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터받기
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		//DB
		//이제 싱글톤으로 받을꺼임
		//MemberDAO memberDAO = new MemberDAO();
		MemberDAO memberDAO = MemberDAO.getInstance();
		String name=memberDAO.login(id,pwd);//호출
		//응답
		request.setAttribute("name", name);
		request.setAttribute("id", id);
		
		
		if(name==null)
			return "/member/loginFail.jsp";
		else {
			//쿠키
			Cookie cookie = new Cookie("memName",name);//쿠키 생성
			cookie.setPath("/mvcMember");
			cookie.setMaxAge(3);
			//클라이언트에게 보내주기
			response.addCookie(cookie);
			
			Cookie cookie2 = new Cookie("memId",id);//쿠키 생성
			cookie2.setPath("/mvcMember");
			cookie2.setMaxAge(3);
			//클라이언트에게 보내주기
			response.addCookie(cookie2);
			//세션
			
			return "/member/loginOk.jsp";
		}
	}

}
