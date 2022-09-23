package com.ngb.thema.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.thema.model.vo.Thema;
import com.ngb.thema.service.ThemaService;

/**
 * Servlet implementation class ThemaTimeAddFrmServlet
 */
@WebServlet(name = "ThemaTimeAddFrm", urlPatterns = { "/themaTimeAddFrm.do" })
public class ThemaTimeAddFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaTimeAddFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.
		request.setCharacterEncoding("utf-8");
		
		
		//3. 비즈니스 로직
		ThemaService service = new ThemaService();
		ArrayList<Thema> list = service.selectAllThema();
		//4.
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/thema/themaTimeAddFrm.jsp");
		request.setAttribute("list", list);
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
