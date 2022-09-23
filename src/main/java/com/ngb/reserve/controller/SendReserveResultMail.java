package com.ngb.reserve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.reserve.service.ReserveService;

/**
 * Servlet implementation class SendReserveResultMail
 */
@WebServlet("/sendReserveResultMail.do")
public class SendReserveResultMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendReserveResultMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//메일에 예약번호 전송
		String reserveMail = request.getParameter("reserveMail");
		ReserveService service = new ReserveService();
		
		int reserveNo = service.selectCurrReserve();
		ReserveMailSender sender = new ReserveMailSender(); //메일 보내기
		sender.reserveResultSendMail(reserveMail, reserveNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
