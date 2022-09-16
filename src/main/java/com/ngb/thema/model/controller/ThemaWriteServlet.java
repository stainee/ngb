package com.ngb.thema.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ngb.thema.model.vo.Thema;
import com.ngb.thema.service.ThemaService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ThemaWriteServlet
 */
@WebServlet(name = "ThemaWrite", urlPatterns = { "/themaWrite.do" })
public class ThemaWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaWriteServlet() {
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
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/thema";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest  = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		String themaCode = mRequest.getParameter("themaCode");
		String thema  = mRequest.getParameter("thema");
		String filepath = mRequest.getParameter("themaFilepath");
		int devicePer = Integer.parseInt(request.getParameter("devicePer"));
		int lockPer = Integer.parseInt(request.getParameter("lockPer"));
		int peopleMin = Integer.parseInt(request.getParameter("peopleMin"));
		int peopleMax = Integer.parseInt(request.getParameter("peopleMax"));
		int themaLevel = Integer.parseInt(request.getParameter("themaLevel"));
		int themaPrice = Integer.parseInt(request.getParameter("themaPrice"));
		
		Thema t = new Thema();
		t.setThemaCode(themaCode);
		t.setThemaCode(thema);
		t.setThemaFilepath(filepath);
		t.setDevicePer(devicePer);
		t.setLockPer(lockPer);
		t.setPeopleMin(peopleMin);
		t.setPeopleMax(peopleMax);
		t.setThemaLevel(themaLevel);
		t.setThemaPrice(themaPrice);
		//3.비즈니스 로직
		ThemaService service = new ThemaService();
		int result = service.insertThema(t);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		request.setAttribute("loc", "/");
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
