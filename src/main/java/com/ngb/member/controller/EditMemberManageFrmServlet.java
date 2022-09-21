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
 * Servlet implementation class EditMemberManageFrmServlet
 */
@WebServlet(name = "EditMemberManageFrm", urlPatterns = { "/editMemberManageFrm.do" })
public class EditMemberManageFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMemberManageFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		System.out.println(memberNo);
		//3. 비즈니스 로직
		MemberService service = new MemberService();
		Member member = service.selectOneMember(memberNo);
		
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/editMemberManageFrm.jsp");
		request.setAttribute("member", member);
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