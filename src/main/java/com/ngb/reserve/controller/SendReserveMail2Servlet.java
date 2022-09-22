package com.ngb.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.ngb.reserve.controller.ReserveMailSender;

/**
 * Servlet implementation class SendReserveMail2Servlet
 */
@WebServlet(name = "sendReserveMail2", urlPatterns = { "/sendReserveMail2.do" })
public class SendReserveMail2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendReserveMail2Servlet() {
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
				String reserveMail = request.getParameter("reserveMail");
													//ㄴreserveMail.jsp에서 읽어옴
				
				//3.비즈니스 로직
				ReserveMailSender sender = new ReserveMailSender(); //메일 보내기
				String randomCode = sender.reserveSendMail2(reserveMail);
				//System.out.println(randomCode);
				
				
				//4.결과처리
				
				PrintWriter out = response.getWriter();
				out.print(reserveMail);
						//ㄴreserveMail.jsp로 보내줌
				System.out.println(reserveMail);
				
//				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
//				if(reserveMail != null) {
//					request.setAttribute("title", "메일전송성공");
//					request.setAttribute("msg", "메일전송성공");
//					request.setAttribute("icon", "success");
//				}else {
//					request.setAttribute("title", "메일전송실패");
//					request.setAttribute("msg", "메일전송실패");
//					request.setAttribute("icon", "error");
//				}
//				request.setAttribute("loc", "/");
//				view.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
