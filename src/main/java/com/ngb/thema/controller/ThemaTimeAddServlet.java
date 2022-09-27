package com.ngb.thema.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.thema.model.vo.ThemaTime;
import com.ngb.thema.service.ThemaService;

/**
 * Servlet implementation class ThemaTimeAddServlet
 */
@WebServlet(name = "ThemaTimeAdd", urlPatterns = { "/themaTimeAdd.do" })
public class ThemaTimeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaTimeAddServlet() {
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
		ThemaTime tt = new ThemaTime();
		tt.setThemaCode(request.getParameter("tmCode"));
		tt.setTime1(request.getParameter("tmTime1"));
		tt.setTime2(request.getParameter("tmTime2"));
		tt.setTime3(request.getParameter("tmTime3"));
		tt.setTime4(request.getParameter("tmTime4"));
		tt.setTime5(request.getParameter("tmTime5"));
		tt.setTime6(request.getParameter("tmTime6"));
		tt.setTime7(request.getParameter("tmTime7"));
		tt.setTime8(request.getParameter("tmTime8"));
		tt.setTime9(request.getParameter("tmTime9"));
		tt.setTime10(request.getParameter("tmTime10"));
		
		//3.
		ThemaService service = new ThemaService();
		int result = service.addThemaTime(tt);
		
		if(result>0) {
			System.out.println("적용완료");
		}else {
			System.out.println("적용실패");
		}
		//4.
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/thema/themaManageTimeFrm.jsp");
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
