package com.ngb.thema.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.thema.model.vo.Thema;
import com.ngb.thema.service.ThemaService;

/**
 * Servlet implementation class DeleteThemaServlet
 */
@WebServlet(name = "DeleteThema", urlPatterns = { "/deleteThema.do" })
public class DeleteThemaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteThemaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		String themaCode = request.getParameter("themaCode");
		//3. 비즈니스 로직
		ThemaService service = new ThemaService();
		Thema t = service.deleteThema(themaCode);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(t!=null) {
			if(t.getThemaFilepath()!=null) {
				String root = getServletContext().getRealPath("/");
				String deleteFile = root+"upload/thema/"+t.getThemaFilepath();
				File delFile = new File(deleteFile);
				delFile.delete();
			}
			request.setAttribute("title", "테마 삭제 완료");
			request.setAttribute("msg", "테마 삭제가 완료되었습니다");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/themaManageList.do");
		}else {
			request.setAttribute("title", "테마 삭제 실패");
			request.setAttribute("msg", "테마 삭제를 실패하였습니다.");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/themaManageList.do?themaCode="+themaCode);
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
