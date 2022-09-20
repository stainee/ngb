package com.ngb.member.controller;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ngb.member.model.vo.Member;
import com.ngb.member.service.MemberService;
/**
 * Servlet implementation class MemberManageServlet
 */
@WebServlet(name = "ManageMember", urlPatterns = { "/manageMember.do" })
public class ManageMemberServlet extends HttpServlet {
	private static final long serialVersionSUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberService service= new MemberService();
		ArrayList<Member> mList = service.selectAllMember();
		request.setAttribute("member", mList);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/manageMember.jsp");
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