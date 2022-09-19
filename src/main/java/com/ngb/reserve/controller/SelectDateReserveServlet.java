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
import com.ngb.reserve.model.vo.ReserveMngr;
import com.ngb.reserve.service.ReserveService;

/**
 * Servlet implementation class SelectDateReserveServlet
 */
@WebServlet(name = "SelectDateReserve", urlPatterns = { "/selectDateReserve.do" })
public class SelectDateReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDateReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String selectDate = request.getParameter("select");
		SimpleDateFormat dtFormat = new SimpleDateFormat("yy-mm-dd");
		Date dateForm;
		String strDate= "";
		try {
			
			dateForm = dtFormat.parse(selectDate);
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yy-mm-dd");
			strDate = newDtFormat.format(dateForm);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ReserveService service = new ReserveService();
		ArrayList<ReserveMngr> selectList = service.selectDateReserveInfo(strDate);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		new Gson().toJson(selectList,out);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
