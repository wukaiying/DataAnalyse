package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AHP;

import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.AxisType;
import com.github.abel533.echarts.code.PointerType;
import com.github.abel533.echarts.code.SeriesType;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;
import com.wky.model.dao.AHPDao;
import com.wky.model.factory.AHPDaoFactory;

public class AHPHistorySearchServlet extends HttpServlet {

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
		String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time"); 
        System.out.println("start:"+start_time);
		AHPDao ahpDao = AHPDaoFactory.getAprioriDaoInstance();
		AHP ahp = new AHP();
		List<AHP> listAHP = ahpDao.findAHPByTime(start_time,end_time);
		request.setAttribute("listAHP", listAHP);
		GsonOption[] weightOption = new GsonOption[listAHP.size()];
		GsonOption[] productRiskOption = new GsonOption[listAHP.size()];
		for(int i=0;i<listAHP.size();i++){
			 weightOption[i] = WeightOptionBar(listAHP.get(i).getRowName().split(","),ArrStrToArrDou(listAHP.get(i).getWeight().split(",")));
			 productRiskOption[i] = productRiskOptionBar(listAHP.get(i).getColName().split(","),ArrStrToArrDou(listAHP.get(i).getProductRisk().split(",")),listAHP.get(i).getProductRiskSt());
		}
		String options = null;
		for(int i=0;i<listAHP.size();i++){
			options += "{\"i\" : "+productRiskOption[i];
		}
		//response.getWriter().write(options);
		ServletContext servletContext = getServletContext();          
    	RequestDispatcher dispather = servletContext.getRequestDispatcher("/ahp/ahp_history_search.jsp");
    	dispather.forward(request, response);
		out.flush();
		out.close();
	}
	
	public GsonOption WeightOptionBar(String[] rowName,double[] weight){
		GsonOption option = new GsonOption();
		option.title().text("样品检测指标权重值").subtext("样品检测指标权重柱状图");
		option.tooltip().trigger(Trigger.axis).axisPointer().type(PointerType.shadow);
		option.legend().data().add("权重");
		
		option.calculable(true);
		
	    ValueAxis xAxis = new ValueAxis();
	    xAxis.type(AxisType.category);
	    
	    for(int i=0;i<rowName.length; i++)
	    	xAxis.data().add(rowName[i]);
	    option.xAxis(xAxis);
	    ValueAxis yAxis = new ValueAxis();
	    yAxis.type(AxisType.value);
	    option.yAxis(yAxis);

	    Bar bar = new Bar();
	    bar.name("权重").type(SeriesType.bar);
	    for(int i=0;i<weight.length; i++)
	    	bar.data().add(weight[i]);	 
	    option.series(bar);
	    return option;
	}
	
	//画权值饼图
	public GsonOption WeightOptionPie(String[] rowName,double[] weight){
		//System.out.println("jsonMap:"+jsonMap);
		GsonOption option = new GsonOption();
		option.title().text("样品检测指标权重值比重").subtext("样品检测指标权重饼图");
		option.tooltip().trigger(Trigger.item).formatter("{a} <br/>{b} : {c} ({d}%)");
		for(int i=0;i<rowName.length; i++)
			option.legend().data().add(rowName[i]);
	    Pie pie = new Pie();
	    pie.name("权重值").type(SeriesType.pie).center("50%","45%").radius("50%"); 
	    for(int i=0;i<weight.length;i++){
	    	Map map = new HashMap();
	    	map.put("value",weight[i]);
	    	map.put("name",rowName[i]);
	    	pie.data().add(map);
	    }
	    option.series(pie);
	    return option;
	}
	
	//画样品风险值
	public GsonOption productRiskOptionBar(String[] colName,double[] productRisk,double productRiskSt){
		GsonOption option = new GsonOption();
		option.title().text("样品风险值").subtext("样品风险值柱状图");
		option.tooltip().trigger(Trigger.axis).axisPointer().type(PointerType.shadow);
		option.legend().data().add("风险值");
		option.legend().data().add("风险临界值");
		option.calculable(true);
		
	    ValueAxis xAxis = new ValueAxis();
	    xAxis.type(AxisType.category);
	    
	    for(int i=0;i<colName.length; i++)
	    	xAxis.data().add(colName[i]);
	    option.xAxis(xAxis);
	    ValueAxis yAxis = new ValueAxis();
	    yAxis.type(AxisType.value);
	    option.yAxis(yAxis);

	    Bar bar = new Bar();
	    Line line = new Line();
	    bar.name("风险值").type(SeriesType.bar);
	    line.name("风险临界值").type(SeriesType.line);
	    for(int i=0;i<productRisk.length; i++){
	    	bar.data().add(productRisk[i]);	
	    	line.data().add(productRiskSt);
	    }
	    	
	    option.series(bar,line);
	    return option;
	}
	
	//String[] to double[] 
	private double[] ArrStrToArrDou(String[] str){
		double[] temp = new double[str.length];
		for(int i=0;i<str.length;i++){
			temp[i] = Double.parseDouble(str[i]);
		}
		return temp;
	}

}
