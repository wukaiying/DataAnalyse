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

import com.wky.dbUtils.Page;
import com.wky.dbUtils.PageUtil;

import bean.DairyBean;

import dbImpl.ShowAll;

public class ShowAllServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取前台参数
		String name = request.getParameter("dairyname");
		String city = request.getParameter("selectcity");
		System.out.print("name:"+name+" "+"city"+city);
		int currentPage=0;
		String currentPageStr = request.getParameter("currentPage");
		if(currentPageStr == null || "".equals(currentPageStr)){
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(currentPageStr);
		}
		
		//new 数据库操作类
		ShowAll showAll = new ShowAll();
		int size = showAll.getAllCount(name, city);
		System.out.println("size:"+size);
		Page page = PageUtil.createPage(5, showAll.getAllCount(name, city), currentPage);
		//接受操作后的数据
		List<DairyBean> listDairyBean = showAll.getInfoFenye(name, city, page);
		request.setAttribute("listDairyBean", listDairyBean);
		request.setAttribute("page", page);
		ServletContext servletContext = getServletContext();
		RequestDispatcher dispatcher = servletContext.
					getRequestDispatcher("/ShowAll/ShowAll.jsp");	//跳转到消息显示页
		dispatcher.forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
