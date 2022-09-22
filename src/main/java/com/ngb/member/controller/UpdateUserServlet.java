package com.ngb.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ngb.member.model.vo.Member;
import com.ngb.member.service.MemberService;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet(name = "UpdateUser", urlPatterns = { "/updateUser.do" })
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.
		request.setCharacterEncoding("utf-8");
		//2.  
		Member m = new Member();
		m.setMemberNo(Integer.parseInt(request.getParameter("userNo")));
		m.setMemberPw(request.getParameter("userPw"));
		m.setMemberPhone(request.getParameter("userPhone"));
		MemberService service = new MemberService();
		int result = service.updateUser(m);
		
		//변경 완료시 세션값도 변경
		if(result > 0) {
			HttpSession session = request.getSession(false);
			Member member = (Member)session.getAttribute("m");
			member.setMemberPw(request.getParameter("userPw"));
			member.setMemberPhone(request.getParameter("userPhone"));
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
