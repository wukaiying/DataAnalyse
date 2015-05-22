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

import bean.DairyBean;

import dbImpl.PlaceAnalyse;

public class PlaceAnalyseServlet extends HttpServlet {	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		PlaceAnalyse placeAnalyse = new PlaceAnalyse();
		String place = request.getParameter("keyword");
		if(place==null||"".equals(place)){
			place="铜仁市";
		}
		//黄曲霉素
		List<DairyBean> axlist = placeAnalyse.getPlaceAnalyseAx(place);
		request.setAttribute("axlist", axlist);
		//蛋白质
		List<DairyBean> prlist = placeAnalyse.getPlaceAnalyseProtein(place);
		request.setAttribute("prlist", prlist);
		//铬
		List<DairyBean> crlist = placeAnalyse.getPlaceAnalyseCr(place);
		request.setAttribute("crlist", crlist);
		ServletContext servletContext = getServletContext();
		RequestDispatcher dispatcher = servletContext.
					getRequestDispatcher("/ShowAll/show_databyplace.jsp");	//跳转到消息显示页
		dispatcher.forward(request, response);
		out.flush();
		out.close();
	}

}
