package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Ann;

import com.wky.model.dao.AnnDao;
import com.wky.model.factory.AnnDaoFactory;

public class AnnHistorySearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		doPost(request,response);
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time"); 
        System.out.println("start:"+start_time);
        AnnDao annDao = AnnDaoFactory.getAnnDaoInstance();
        List<Ann> annList = annDao.findAnnByTime(start_time, end_time);
        request.setAttribute("annList", annList);
        ServletContext servletContext = getServletContext();          
    	RequestDispatcher dispather = servletContext.getRequestDispatcher("/ann/ann_history_search.jsp");
    	dispather.forward(request, response);
		out.flush();
		out.close();
	}

}
