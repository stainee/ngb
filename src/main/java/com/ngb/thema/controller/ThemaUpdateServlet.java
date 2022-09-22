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
 * Servlet implementation class ThemaUpdateServlet
 */
@WebServlet(name = "ThemaUpdate", urlPatterns = { "/themaUpdate.do" })
public class ThemaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemaUpdateServlet() {
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
		
		String root=getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/thema";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		String themaCode=mRequest.getParameter("thamaCode");
		String category = mRequest.getParameter("category");
		String themaName = mRequest.getParameter("themaName");
		int themaTime = Integer.parseInt(mRequest.getParameter("themaTime"));
		int devicePer = Integer.parseInt(mRequest.getParameter("devicePer"));
		int lockPer = Integer.parseInt(mRequest.getParameter("lockPer"));
		int peopleMin = Integer.parseInt(mRequest.getParameter("peopleMin"));
		int peopleMax = Integer.parseInt(mRequest.getParameter("peopleMax"));
		int themaLevel = Integer.parseInt(mRequest.getParameter("themaLevel"));
		int themaPrice = Integer.parseInt(mRequest.getParameter("themaPrice"));
		String themaContent = mRequest.getParameter("themaContent");
		
		//새 첨부파일있으면 새 첨부파일 값, 없으면 null
		String filepath = mRequest.getFilesystemName("upfile");
		//기존 첨부파일이 있었으면 기존첨부파일값, 없없으면 null
		String oldFilepath = mRequest.getParameter("oldFilepath");
		String status = mRequest.getParameter("status");
		if(oldFilepath != null && status.equals("stay")) {
			filepath = oldFilepath;
		}
		Thema t = new Thema();
		t.setThemaCode(themaCode);
		t.setCategory(category);
		t.setThemaName(themaName);
		t.setThemaTime(themaTime);
		t.setDevicePer(devicePer);
		t.setLockPer(lockPer);
		t.setPeopleMin(peopleMin);
		t.setPeopleMax(peopleMax);
		t.setThemaLevel(themaLevel);
		t.setThemaPrice(themaPrice);
		t.setThemaContent(themaContent);
		t.setThemaFilepath(filepath);
		
		//3. 비즈니스 로직
		ThemaService service = new ThemaService();
		int result = service.updateThema(t);
		
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "변경완료");
			request.setAttribute("msg", "테마가 수정되었습니다");
			request.setAttribute("icon","success");
			request.setAttribute("loc", "/themaManageView.do?themaCode="+themaCode);
		}else {

			request.setAttribute("title", "변경실패");
			request.setAttribute("msg", "관리자에게 문의하세요");
			request.setAttribute("icon","error");
			request.setAttribute("loc", "/themaManageList.do");
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
