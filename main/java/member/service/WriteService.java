package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class WriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDTO dto = new MemberDTO();
		dto.setName(request.getParameter("name"));
		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("pwd"));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail1(request.getParameter("email1"));
		dto.setEmail2(request.getParameter("email2"));
		dto.setTel1(request.getParameter("tel1"));
		dto.setTel2(request.getParameter("tel2"));
		dto.setTel3(request.getParameter("tel3"));
		dto.setZipcode(request.getParameter("zipcode"));
		dto.setAddr1(request.getParameter("addr1"));
		dto.setAddr2(request.getParameter("addr2"));
		
		MemberDAO dao = new MemberDAO();
		boolean result=dao.write(dto);
		if(result)
			return "/member/writeOk.jsp";
		else
			return "/member/writeFail.jsp";
		
	}

}
