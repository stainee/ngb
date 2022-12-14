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
import com.ngb.thema.model.vo.ThemaTime;
import com.ngb.thema.model.vo.ThemaTimeManage;
import com.ngb.thema.service.ThemaService;

/**
 * Servlet implementation class ThemaTimeAddFrmServlet
 */
@WebServlet(name = "ThemaTimeAddFrm", urlPatterns = { "/themaTimeAddFrm.do" })
public class ThemaTimeAddFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaTimeAddFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.
		request.setCharacterEncoding("utf-8");
		//2.
		
		Thema tCodeName = new Thema();
		String themaCode = request.getParameter("themaCode");
		String themaName = request.getParameter("themaName");
		tCodeName.setThemaCode(themaCode);
		tCodeName.setThemaName(themaName);
		//3. 비즈니스 로직
		ThemaService service = new ThemaService();
		ArrayList<Thema> list = service.selectAllThema();
		ArrayList<ThemaTimeManage> oneTimeList = service.getThemaTime(themaCode);
		
		for(ThemaTimeManage t : oneTimeList) {
			System.out.println(t.getTime());
		}
		
		//4.
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/thema/themaTimeAddFrm.jsp");
		request.setAttribute("list", list);
		request.setAttribute("tCodeName", tCodeName);
		request.setAttribute("oneTimeList", oneTimeList);
		
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
