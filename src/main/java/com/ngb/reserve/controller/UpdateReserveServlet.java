package com.ngb.reserve.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.reserve.model.vo.Reserve;
import com.ngb.reserve.service.ReserveService;

/**
 * Servlet implementation class UpdateReserveServlet
 */
@WebServlet(name = "UpdateReserve", urlPatterns = { "/updateReserve.do" })
public class UpdateReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method 
		request.setCharacterEncoding("utf-8");
		Reserve r = new Reserve();
		r.setReserveNo(Integer.parseInt(request.getParameter("reserveNo")));
		r.setReserveName(request.getParameter("reserveName"));
		r.setReservephone(request.getParameter("reservePhone"));
		r.setReserveAmount(Integer.parseInt(request.getParameter("reserveAmount")));
		ReserveService service = new ReserveService();
		int result = service.updateReserve(r);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
