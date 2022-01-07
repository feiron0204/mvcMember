package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class ModifyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id=request.getParameter("id");
		MemberDAO memberDAO=MemberDAO.getInstance();
		MemberDTO memberDTO=memberDAO.selectOne(id);
		request.setAttribute("memberDTO", memberDTO);
		return "/member/modifyForm.jsp";
		/* 강사님해답
		  String id=request.getParameter("id");(서비스에 id실어두는거까지만했을때)
		  MemberDAO memberDAO=MemberDAO.getInstance();
		  MemberDTO membetDTO=memberDAO.modify(id);
		  request.setAttribute("memberDTO",memberDTO);
		  return "/member/modifyForm.jsp"; <-여기에는 객체 못뿌림 무조껀 문자열만 실어다줄수있음
		 */
	}

}
