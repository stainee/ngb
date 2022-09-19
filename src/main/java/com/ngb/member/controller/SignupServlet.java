package com.ngb.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.member.model.vo.Member;
import com.ngb.member.service.MemberService;


/**
 * Servlet implementation class SignupServlet
 */
@WebServlet(name = "Signup", urlPatterns = { "/signup.do" })
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
				request.setCharacterEncoding("utf-8");
				//2.값추출
				String memberId = request.getParameter("memberId");
				String memberPw = request.getParameter("memberPw");
				String memberName = request.getParameter("memberName");
				String memberPhone = request.getParameter("memberPhone");
				String memberMail = request.getParameter("memberMail");
				
				Member m = new Member();
				m.setMemberId(memberId);
				m.setMemberPw(memberPw);
				m.setMemberName(memberName);
				m.setMemberPhone(memberPhone);
				m.setMemberMail(memberMail);
				
				//3.비즈니스로직
				MemberService service = new MemberService();
				int result = service.insertMember(m);
				//4.결과처리
				 RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/signupFin.jsp");
			     view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
