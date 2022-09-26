package com.ngb.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.notice.model.vo.NoticePageData;
import com.ngb.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet(name = "NoticeSearch", urlPatterns = { "/noticeSearch.do" })
public class NoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchServlet() {
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
	      int reqPage = Integer.parseInt(request.getParameter("reqPage"));
	      String notice_title = request.getParameter("searchTag");
	      String searchInput = request.getParameter("searchInput");
	      //3.비즈니스로직
	      NoticeService service = new NoticeService();
	      NoticePageData npd = service.selectNoticeList(reqPage,notice_title,searchInput);
	      //4.결과처리
	      RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp");
	      request.setAttribute("list", npd.getList());
	      request.setAttribute("pageNavi", npd.getPageNavi());
	      view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
