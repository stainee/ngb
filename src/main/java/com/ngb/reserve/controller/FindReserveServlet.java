package com.ngb.reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.reserve.model.vo.Reserve;
import com.ngb.reserve.service.ReserveService;

/**
 * Servlet implementation class FindReserveServlet
 */
@WebServlet(name = "findReserve", urlPatterns = { "/findReserve.do" })
public class FindReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
				request.setCharacterEncoding("utf-8");
				//2.값추출
				String reserveName = request.getParameter("reserveName");
				String reserveEmail = request.getParameter("reserveEmail");
				Reserve reserve = new Reserve();
				reserve.setReserveName(reserveName);
				reserve.setReserveMail(reserveEmail);
				//3.비즈니스 로직
				ReserveService service = new ReserveService();
				Reserve reser = service.findReserve(reserve);
													//ㄴ위에서 담은 것 넘겨줌
				//4.결과처리 (service에서 reser받아옴)
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/reserve/reserveView.jsp");
				request.setAttribute("reserve", reser);
				//reserveView.jsp로 값 보내주기 //ㄴreserve 타입의 reser 객체
				if(reser!=null) {
					view.forward(request, response);
				}else {
					//실패 메세지 띄우기 (모달)
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
