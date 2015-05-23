package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AHP;

import com.wky.model.dao.AHPDao;
import com.wky.model.factory.AHPDaoFactory;

public class HistorySearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		doPost(request,response);
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		
		String type = request.getParameter("dropdownlist");
		System.out.println(type);   
   
        String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time"); 
        System.out.println("start:"+start_time);
		if("ahp".equals(type)){
			AHPDao ahpDao = AHPDaoFactory.getAprioriDaoInstance();
			AHP ahp = new AHP();
			List<AHP> listAHP = ahpDao.findAHPByTime(start_time,end_time);
			request.setAttribute("listAHP", listAHP);
		}
  
		
		
		ServletContext servletContext = getServletContext();          
    	RequestDispatcher dispather = servletContext.getRequestDispatcher("/user_page/history_search.jsp");
    	dispather.forward(request, response);
		out.flush();
		out.close();
	}

}
