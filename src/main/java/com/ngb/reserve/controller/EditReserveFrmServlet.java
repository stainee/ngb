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
import com.ngb.reserve.model.vo.ReserveMngr;
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
		ReserveService service = new ReserveService();
		
		request.setCharacterEncoding("utf-8");
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		String themaCode = request.getParameter("themaCode");
		String timeCode = request.getParameter("timeCode");
		String themaName = request.getParameter("themaName");
		String time = request.getParameter("time");
		String peopleMax = request.getParameter("peopleMax");
		if(reserveNo == 0) {
			ReserveMngr rm = new ReserveMngr();
			rm.setPeopleMax(peopleMax);
			rm.setThemaCode(themaCode);
			rm.setTimeCode(timeCode);
			rm.setThemaName(themaName);
			rm.setTime(time);
			System.out.println(rm.getPeopleMax());
			System.out.println(rm.getThemaCode());
			System.out.println(rm.getTimeCode());
			System.out.println(rm.getThemaName());
			System.out.println(rm.getTime());
			request.setAttribute("result", rm);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/reserve/insertReserveFrm.jsp");
			view.forward(request, response);
		}else {
			ReserveMngr result = service.selectReserveEdit(reserveNo);
			request.setAttribute("result", result);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/reserve/editReserveFrm.jsp");
			view.forward(request, response);
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
