package com.ngb.member.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ngb.member.model.vo.Member;
import com.ngb.member.service.MemberService;
/**
 * Servlet implementation class EditMemberManageServlet
 */
@WebServlet(name = "EditMemberManage", urlPatterns = { "/editMemberManage.do" })
public class EditMemberManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMemberManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//2. 값추출
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String memberName = request.getParameter("memberName");
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberPhone = request.getParameter("memberPhone");
		String memberMail = request.getParameter("memberMail");
		int memberLevel = Integer.parseInt(request.getParameter("memberLevel"));
		
		Member member = new Member();
		member.setMemberNo(memberNo);
		member.setMemberName(memberName);
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		member.setMemberPhone(memberPhone);
		member.setMemberMail(memberMail);
		member.setMemberLevel(memberLevel);
		//3. 비즈니스로직
		MemberService service = new MemberService();
		int result = service.updateMember(member);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/memberManage.do");
		if(result>0) {
			out.println("<script>");
			out.println("alert('수정완료');");
			out.println("</script>");
			view.forward(request, response);
		}else{
			out.println("<script>");
			out.println("alert('수정실패 관리자에게 문의');");
			out.println("</script>");
		}
		view.forward(request, response);
	}
	private int Integer(Object parseint) {
		// TODO Auto-generated method stub
		return 0;
	}
	private Object parseint(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}