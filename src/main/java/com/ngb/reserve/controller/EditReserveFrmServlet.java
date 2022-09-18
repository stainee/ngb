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
		Reserve r = new Reserve();
		r.setReserveNo(Integer.parseInt(request.getParameter("reserveNo")+""));
		
		
		System.out.println("reserveNo :::: "+r.getReserveNo());
		
		ReserveService service = new ReserveService();
		ArrayList<Reserve> list = service.selectAllReserve(r.getReserveNo()+"");
		//select
		
		System.out.println("dfdfd"+list);
		Reserve result = null;
		
		if(list != null && !list.isEmpty()) {
			result = list.get(0);
		}
		
		
		System.out.println("=======================");
		System.out.println(result);
		System.out.println("=======================");
		
//		r.setTime(request.getParameter("time"));
//		r.setThemaCode(request.getParameter("thema"));
//		r.setReserveName(request.getParameter("name"));
//		r.setReservephone(request.getParameter("phone"));
//		r.setReserveAmount(Integer.parseInt(request.getParameter("amount")));
//		r.setReservePay(Integer.parseInt(request.getParameter("pay")));
//		r.setReserveDate(request.getParameter("playTime"));
//		r.setReserveState(Integer.parseInt(request.getParameter("reserveState")));
		
		request.setAttribute("r", result);
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
