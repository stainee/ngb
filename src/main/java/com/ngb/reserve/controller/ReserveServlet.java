package com.ngb.reserve.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.reserve.service.ReserveService;
import com.ngb.thema.model.vo.Thema;
import com.ngb.thema.service.ThemaService;

/**
 * Servlet implementation class ReserveServlet
 */
@WebServlet("/reserve.do")
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String themaCode = request.getParameter("thema_code");
		int timeCode = Integer.parseInt(request.getParameter("time_code"));
		int reservePay = Integer.parseInt(request.getParameter("reserve_pay"));
		String reserveName = request.getParameter("reserve_name");
		String reserveMail = request.getParameter("reserve_mail");
		String reservePhone =request.getParameter("reserve_phone");
		int reserveAmount = Integer.parseInt(request.getParameter("reserve_amount"));
		String playDate = request.getParameter("play_date");
		
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yy-mm-dd");
		Date dateForm;
		String strDate="";
		try {
			dateForm = dtFormat.parse(playDate);
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yy-mm-dd");
			strDate = newDtFormat.format(dateForm);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ReserveService service = new ReserveService();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
