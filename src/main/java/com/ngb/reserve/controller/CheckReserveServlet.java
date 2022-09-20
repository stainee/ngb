package com.ngb.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ngb.reserve.model.vo.Reserve;
import com.ngb.reserve.service.ReserveService;

/**
 * Servlet implementation class CheckReserveServlet
 */
@WebServlet("/checkReserve.do")
public class CheckReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckReserveServlet() {
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
		Reserve checkReserve = service.searchOneReserve(themaCode, timeCode, strDate);
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String result = "";
		//조회된 결과가 없으면
		if(checkReserve == null) {
			//out으로 reserve여부를 보낸후 결제API, 이후 reserve Insert
			result="yes";
		}else {
			result="no";
		}
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
