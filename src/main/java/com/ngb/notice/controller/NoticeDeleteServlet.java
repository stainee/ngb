package com.ngb.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.notice.model.vo.Notice;
import com.ngb.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet(name = "NoticeDelete", urlPatterns = { "/noticeDelete.do" })
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
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
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		//3.비즈니스로직
		NoticeService service = new NoticeService();
		//삭제후 파일을 처리하기 위해 해당 정보를 받음
		Notice n = service.deleteNotice(noticeNo);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(n!=null) {
			
			request.setAttribute("title", "삭제완료");
			request.setAttribute("msg", "삭제가 완료됬습니다");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/noticeList.do?reqPage=1");
			
		}else {
			request.setAttribute("title", "삭제실패");
			request.setAttribute("msg", "삭제 실패");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/noticeView.do?noticeNo="+noticeNo);
		}
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
