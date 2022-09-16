package com.ngb.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ngb.member.model.vo.Member;
import com.ngb.member.service.MemberService;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login.do" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		
		//얼럿 뜨위기위한 작업
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//2.값추출
		String memberId = request.getParameter("loginId");
		String memberPw = request.getParameter("loginPw");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		//3.비지니스로직
		MemberService service = new MemberService();
		Member m = service.selectOneMember(member);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/");
		if(m != null) {
		HttpSession session = request.getSession();
		session.setAttribute("m", m);
		out.println("<script>");
		out.println("alert('로그인성공'); location.href='/';");
		out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인해 주세요.'); location.href='/loginFrm.do';");
			out.println("</script>");
		}

		//view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
