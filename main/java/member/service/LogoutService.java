package member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class LogoutService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		Cookie[] ar = request.getCookies();
		if(ar !=null){
			for(int i=0;i<ar.length;i++){
				if(ar[i].getName().equals("memName")) {
					ar[i].setPath("/mvcMember");
					ar[i].setMaxAge(0);//쿠키삭제
					response.addCookie(ar[i]);//클라이언트한테 얘 시간다됬음을 보내기
				}
				if(ar[i].getName().equals("memId")) {
					ar[i].setPath("/mvcMember");
					ar[i].setMaxAge(0);//쿠키삭제
					response.addCookie(ar[i]);//클라이언트한테 얘 시간다됬음을 보내기
				}
			}
		}
		return "/member/logout.jsp";
	}

}
