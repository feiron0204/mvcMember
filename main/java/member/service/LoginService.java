package member.service;

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
		MemberDAO memberDAO = new MemberDAO();
		String name=memberDAO.login(id,pwd);//호출
		//응답
		if(name==null)
			return "/member/loginFail.jsp";
		else
			return "/member/loginOk.jsp";
	}

}
