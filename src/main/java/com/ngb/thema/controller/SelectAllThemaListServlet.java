package com.ngb.thema.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ngb.thema.model.vo.ThemaTimeManage;
import com.ngb.thema.service.ThemaService;

/**
 * Servlet implementation class SelectAllThemaListServlet
 */
@WebServlet(name = "SelectAllThemaList", urlPatterns = { "/selectAllThemaList.do" })
public class SelectAllThemaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllThemaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	     ThemaService service = new ThemaService();
	     ArrayList<ThemaTimeManage> themaList = service.selectAllThemaList();
	      
	     for(ThemaTimeManage t : themaList){
	         System.out.println(t.getThemaCode());
	         System.out.println(t.getThemaName());
	         System.out.println(t.getTimeCode());
	         System.out.println(t.getTime());
	     }
         response.setContentType("application/json");
         response.setCharacterEncoding("utf-8");
         PrintWriter out = response.getWriter();
         new Gson().toJson(themaList,out);
	      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
