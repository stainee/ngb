package com.ngb.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ngb.notice.model.vo.NoticePageData;
import com.ngb.notice.service.NoticeService;

/**
 * Servlet implementation class MainNoticeServlet
 */
@WebServlet(name = "MainNotice", urlPatterns = { "/mainNotice.do" })
public class MainNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainNoticeServlet() {
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
				int reqPage = 1;
				//3.비즈니스로직
				NoticeService service = new NoticeService();
				NoticePageData npd = service.selectNoticeList(reqPage);
				
				//4.결과처리
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				new Gson().toJson(npd,out);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
