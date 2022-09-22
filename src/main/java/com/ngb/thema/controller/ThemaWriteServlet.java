package com.ngb.thema.controller;

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
		String category = mRequest.getParameter("category");
		String thamaName = mRequest.getParameter("themaName");
		String themaContent = mRequest.getParameter("themaContent");
		int devicePer = Integer.parseInt(mRequest.getParameter("devicePer"));
		int lockPer = Integer.parseInt(mRequest.getParameter("lockPer"));
		int peopleMin = Integer.parseInt(mRequest.getParameter("peopleMin"));
		int peopleMax = Integer.parseInt(mRequest.getParameter("peopleMax"));
		int themaLevel = Integer.parseInt(mRequest.getParameter("themaLevel"));
		int themaPrice = Integer.parseInt(mRequest.getParameter("themaPrice"));
		String filepath = mRequest.getFilesystemName("themaFilepath");
		int themaTime = Integer.parseInt(mRequest.getParameter("themaTime"));
		
		Thema t = new Thema();
		t.setThemaCode(themaCode);
		t.setCategory(category);
		t.setThemaName(thamaName);
		t.setThemaContent(themaContent);;
		t.setThemaFilepath(filepath);
		t.setDevicePer(devicePer);
		t.setLockPer(lockPer);
		t.setPeopleMin(peopleMin);
		t.setPeopleMax(peopleMax);
		t.setThemaLevel(themaLevel);
		t.setThemaPrice(themaPrice);
		t.setThemaTime(themaTime);
		//3.비즈니스 로직
		ThemaService service = new ThemaService();
		int result = service.insertThema(t);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "테마가 성공적으로 등록되었습니다");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "테마 등록 중 문제가 생겼습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/themaManageList.do");
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
