package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Apriori;

import com.wky.model.dao.AprioriDao;
import com.wky.model.factory.AprioriDaoFactory;

public class AprioriHistorySearchServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
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
		AprioriDao aprioriDao = AprioriDaoFactory.getAprioriDaoInstance();
		Apriori apriori = new Apriori();
		List<Apriori> aprioriList = new ArrayList<Apriori>();
		aprioriList = aprioriDao.findAprioriByTime(start_time, end_time);
		request.setAttribute("aprioriList", aprioriList);
		ServletContext servletContext = getServletContext();          
	    RequestDispatcher dispather = servletContext.getRequestDispatcher("/Apriori/apriori_history_search.jsp");
	    dispather.forward(request, response);
		out.flush();
		out.close();
	}

}
