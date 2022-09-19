package com.ngb.time.controller;

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
import com.ngb.time.model.vo.Time;
import com.ngb.time.service.TimeService;

/**
 * Servlet implementation class GetReserveTimeServlet
 */
@WebServlet("/getReserveTime.do")
public class GetReserveTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReserveTimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//테마 코드별 테마 예약된 시간 리스트 조회
		request.setCharacterEncoding("utf-8");
		String themaCode = request.getParameter("themaCode");
		String date = request.getParameter("date");
		SimpleDateFormat dtFormat = new SimpleDateFormat("yy-mm-dd");
		Date dateForm;
		String strDate="";
		try {
			dateForm = dtFormat.parse(date);
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yy-mm-dd");
			strDate = newDtFormat.format(dateForm);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		TimeService service = new TimeService();	
		ArrayList<Time> reserveList = service.getReserveList(themaCode, strDate);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		g.toJson(reserveList, out);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
