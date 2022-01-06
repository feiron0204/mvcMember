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
		MemberDTO membetDTO=memberDAO.selectOne(id);
		request.setAttribute("memberDTO", membetDTO);
		return "/member/modifyForm.jsp";
	}

}
