package com.ngb.reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.reserve.model.vo.Reserve;
import com.ngb.reserve.service.ReserveService;

/**
 * Servlet implementation class EditReserveFrmServlet
 */
@WebServlet(name = "EditReserveFrm", urlPatterns = { "/editReserveFrm.do" })
public class EditReserveFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReserveFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		
		ReserveService service = new ReserveService();
		Reserve result = service.selectReserveEdit(reserveNo);
		
		request.setAttribute("result", result);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/reserve/editReserveFrm.jsp");
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
