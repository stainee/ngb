package com.ngb.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ngb.reserve.model.vo.Reserve;
import com.ngb.reserve.model.vo.ReserveMngr;
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
		request.setCharacterEncoding("utf-8");
		Reserve r = new Reserve();
		r.setReserveNo(Integer.parseInt(request.getParameter("reserveNo")));
		r.setReserveName(request.getParameter("reserveName"));
		r.setReservePhone(request.getParameter("reservePhone"));
		r.setReserveAmount(Integer.parseInt(request.getParameter("reserveAmount")));
		ReserveService service = new ReserveService();
		int result = service.updateReserve(r);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			new Gson().toJson("success",out);
		}else {
			new Gson().toJson("fail",out);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
