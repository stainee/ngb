package com.ngb.time.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ngb.time.model.vo.Time;
import com.ngb.time.service.TimeService;

/**
 * Servlet implementation class GetThemaTimeServlet
 */
@WebServlet("/getThemaTime.do")
public class GetThemaTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetThemaTimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//테마 코드별 테마 시간표 조회
		request.setCharacterEncoding("utf-8");
		String themaCode = request.getParameter("themaCode");
		TimeService service = new TimeService();	
		ArrayList<Time> list = service.getThemaTimeList(themaCode);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		g.toJson(list, out);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
