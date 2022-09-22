package com.ngb.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.payment.service.PaymentService;

/**
 * Servlet implementation class KaKaoPaySaveServlet
 */
@WebServlet("/kakaoPaySave.do")
public class KaKaoPaySaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KaKaoPaySaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//결제 정보를 가져온다
		int price = Integer.parseInt(request.getParameter("price"));
		String tid = request.getParameter("tid");
		
		PaymentService service = new PaymentService();
		//reserveNo 찾아서 payment에 insert
		int result = service.insertPayment(price, tid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
