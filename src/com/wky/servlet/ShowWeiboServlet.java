package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wky.drawcharts.SentimentPieWeibo;

import bean.Weibo;
import bean.XinwenBean;

import dbImpl.ShowWeibo;
import dbImpl.ShowXinwen;

public class ShowWeiboServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String keyword = request.getParameter("keyword");
		String item = request.getParameter("item");
		if(item.equals("weibo")){
			ShowWeibo showWeibo = new ShowWeibo();
			List<Weibo> weibolist = showWeibo.getWeibo(keyword);
			request.setAttribute("weibolist", weibolist);
			//画图
			SentimentPieWeibo senPieWeibo = new SentimentPieWeibo();
			int good = senPieWeibo.getCount(keyword, 1);
			int bad = senPieWeibo.getCount(keyword, -1);
			int neutral = senPieWeibo.getCount(keyword, 0);
			StringBuffer pie_value = new StringBuffer();
			pie_value.append(good+",");
			pie_value.append(bad+",");
			pie_value.append(neutral);
			request.setAttribute("Piearray", pie_value);
			ServletContext servletContext = getServletContext();
			RequestDispatcher dispatcher = servletContext.
						getRequestDispatcher("/JCloudNew/ShowWeibo.jsp");	//跳转到消息显示页
			dispatcher.forward(request, response);
		}else if(item.equals("xinwen")){
			ShowXinwen showxinwen = new ShowXinwen();
			List<XinwenBean> xinwenlist = showxinwen.getXinwen(keyword);
			request.setAttribute("xinwenlist", xinwenlist);
			ServletContext servletContext = getServletContext();
			RequestDispatcher dispatcher = servletContext.
						getRequestDispatcher("/JCloudNew/ShowWeibo.jsp");	//跳转到消息显示页
			dispatcher.forward(request, response);
		}
		out.flush();
		out.close();
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
