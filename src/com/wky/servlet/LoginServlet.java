package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;

import dbImpl.UserImpl;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=uft-8");
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
		ServletContext servletContext = getServletContext();	//获得ServletContex
		RequestDispatcher dispatcher = null;					
		int id = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		int status = Integer.parseInt(request.getParameter("status"));
		System.out.println(status);
		if(password==""||"".equals(id)||"".equals("password")){
			request.setAttribute("error", "用户名或密码为空！");
			dispatcher = servletContext.
					getRequestDispatcher("/Login.jsp");//设置跳转页面
			dispatcher.forward(request, response);
		}else{
			UserImpl userImpl = new UserImpl();
			User user = userImpl.findUserByID(id);
			//System.out.println(user.getIsAdmin());
			if(user==null){
				request.setAttribute("error", "不存在该用户！");
				dispatcher = servletContext.
						getRequestDispatcher("/Login.jsp");//设置跳转页面
				dispatcher.forward(request, response);
			}else{
				if(password.equals(user.getPassword())&status==user.getIsAdmin()&user.getIsAdmin()==1){
					request.getSession().
					setAttribute("user", user);//将员工信息保存到session范围
					request.getSession().setAttribute("status", "1");
					response.sendRedirect("index.jsp");
					return;
				}else if(password.equals(user.getPassword())&status==user.getIsAdmin()&user.getIsAdmin()==0){
					request.getSession().
					setAttribute("user", user);//将员工信息保存到session范围
					request.getSession().setAttribute("status", "0");
					response.sendRedirect("index.jsp");
					return;
				}else{
					request.setAttribute("error", "系统口令不正确!");
					dispatcher = servletContext.
						getRequestDispatcher("/Login.jsp");
					dispatcher.forward(request, response);
				}
			}
		}
		out.flush();
		out.close();
	}

}
