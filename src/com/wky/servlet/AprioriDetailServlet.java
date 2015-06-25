package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Apriori;

import com.wky.model.dao.AprioriDao;
import com.wky.model.factory.AprioriDaoFactory;

public class AprioriDetailServlet extends HttpServlet {

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
		String id = request.getParameter("id");
		AprioriDao aprioriDao = AprioriDaoFactory.getAprioriDaoInstance();
		Apriori apriori = new Apriori();
		apriori = aprioriDao.findAprioriById(Integer.parseInt(id));
		String aprioriData = apriori.getAprioriData();
		request.setAttribute("aprioriData", aprioriData);
		out.write(aprioriData);
		ServletContext servletContext = getServletContext();          
	    RequestDispatcher dispather = servletContext.getRequestDispatcher("/Apriori/apriori_details.jsp");
	    dispather.forward(request, response);
		out.flush();
		out.close();
	}

}
