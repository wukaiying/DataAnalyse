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

import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.AxisType;
import com.github.abel533.echarts.code.PointerType;
import com.github.abel533.echarts.code.SeriesType;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Bar;
import com.wky.dairy.factory.DairyDaoFactory;
import com.wky.dairyDao.DairyDao;

public class ShowElemPlaceServlet extends HttpServlet {

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

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String elem = request.getParameter("elem_name");
		String place = request.getParameter("dropdownlist");
		DairyDao dairyDao = DairyDaoFactory.getDairyDaoInstance();
		List<StringBuffer> dairyList = dairyDao.findDairyByElemAndPlace(elem, place);
		try{
			StringBuffer nameSb = dairyList.get(0);
			StringBuffer valueSb = dairyList.get(1);
			StringBuffer valueStSb = dairyList.get(2);
			System.out.println(valueStSb);
			String[] name = nameSb.toString().split(",");
			String[] value = valueSb.toString().split(",");
			String[] valueSt = valueStSb.toString().split(",");
			GsonOption elemPlaceBar = ElemPlaceLine(name,value,valueSt);
			request.setAttribute("elemPlaceBar", elemPlaceBar.toString());
			request.setAttribute("place", place);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
		
		ServletContext servletContext = getServletContext();          
    	RequestDispatcher dispather = servletContext.getRequestDispatcher("/ShowAll/show_elem_place.jsp");
    	dispather.forward(request, response);
		out.flush();
		out.close();
	}
	public GsonOption ElemPlaceLine(String[] name,String[] value,String[] valueSt){
		GsonOption option = new GsonOption();
		option.title().text("检测指标及地理位置联动查询").subtext("检测指标及地理位置联动查询");
		option.tooltip().trigger(Trigger.axis).axisPointer().type(PointerType.shadow);
		option.legend().data().add("权重");
		option.legend().data().add("标准");
		
		option.calculable(true);
		
	    ValueAxis xAxis = new ValueAxis();
	    xAxis.type(AxisType.category);
	    
	    for(int i=0;i<name.length; i++)
	    	xAxis.data().add(name[i]);
	    option.xAxis(xAxis);
	    ValueAxis yAxis = new ValueAxis();
	    yAxis.type(AxisType.value);
	    option.yAxis(yAxis);

	    Bar bar = new Bar();
	    bar.name("权重").type(SeriesType.bar);
	    for(int i=0;i<value.length; i++)
	    	bar.data().add(value[i]);	 
	    option.series(bar);
	    //标准线
	    Bar barSt = new Bar();
	    barSt.name("标准").type(SeriesType.line);
	    //barSt.xAxisIndex(1);
	    barSt.itemStyle().normal().color("rgba(252,206,16,0.5)");
	    barSt.itemStyle().normal().label().show(true);
	    for(int i=0;i<valueSt.length;i++){
	    	 barSt.data().add(valueSt[i]);
	    }
	    option.series(barSt);
	    return option;
	}

}
