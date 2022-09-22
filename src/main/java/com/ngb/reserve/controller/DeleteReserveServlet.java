package com.ngb.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ngb.reserve.service.ReserveService;

/**
 * Servlet implementation class DeleteReserveServlet
 */
@WebServlet(name = "DeleteReserve", urlPatterns = { "/deleteReserve.do" })
public class DeleteReserveServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
      ReserveService service = new ReserveService();
      int result = service.deleteReserveMngr(reserveNo);
      
      response.setContentType("application/json");
      response.setCharacterEncoding("utf-8");
      PrintWriter out = response.getWriter();
      if(result == 1) {
         new Gson().toJson("success",out);
      }else {
         new Gson().toJson("fail",out);
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