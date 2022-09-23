package com.ngb.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ngb.payment.model.vo.Payment;
import com.ngb.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentInfo
 */
@WebServlet("/getPaymentInfo.do")
public class PaymentInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		PaymentService service = new PaymentService();
		Payment p = service.searchPayment(reserveNo);
		
		//paymentInfo 값을 response해준다
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		g.toJson(p, out);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
