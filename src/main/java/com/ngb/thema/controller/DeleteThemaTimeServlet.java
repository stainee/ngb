package com.ngb.thema.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.thema.service.ThemaService;

/**
 * Servlet implementation class DeleteThemaTimeServlet
 */
@WebServlet(name = "DeleteThemaTime", urlPatterns = { "/deleteThemaTime.do" })
public class DeleteThemaTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteThemaTimeServlet() {
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
		String tmCode = request.getParameter("tmCode");
		System.out.println("deleteServlet"+tmCode);
		//3.
		ThemaService service = new ThemaService();
		int result = service.deleteThemaTime(tmCode);
		
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
