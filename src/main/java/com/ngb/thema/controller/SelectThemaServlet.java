package com.ngb.thema.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.thema.model.vo.Thema;
import com.ngb.thema.service.ThemaService;

/**
 * Servlet implementation class SelectThemaServlet
 */
@WebServlet(name = "SelectThema", urlPatterns = { "/selectThema.do" })
public class SelectThemaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectThemaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값 추출
		int level = Integer.parseInt(request.getParameter("level"));
		String category = request.getParameter("select-thema");
		ThemaService service = new ThemaService();
		//3. 비즈니스 로직
		if(level==0 && category.equals("전체")) {
			ArrayList<Thema> list = service.selectAllThema();
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/thema/themaUserList.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
			request.setAttribute("loc", "/");
		}else if(level!=0 && category.equals("전체")){
			ArrayList<Thema> list = service.selectThema1(level);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/thema/themaUserList.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
			request.setAttribute("loc", "/");
		}else if(level==0 && !category.equals("전체")){
			ArrayList<Thema> list = service.selectThema2(category);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/thema/themaUserList.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
			request.setAttribute("loc", "/");
		}else{
			ArrayList<Thema> list = service.selectThema(level, category);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/thema/themaUserList.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
			request.setAttribute("loc", "/");
		}

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
