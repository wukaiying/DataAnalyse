package com.wky.servlet;

import java.io.File;
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

import org.joone.helpers.factory.JooneTools;

import bean.AHP;
import bean.Ann;

import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.AxisType;
import com.github.abel533.echarts.code.PointerType;
import com.github.abel533.echarts.code.SeriesType;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Bar;
import com.wky.dbUtils.Matrix;
import com.wky.dbUtils.ReadFile;
import com.wky.model.dao.AHPDao;
import com.wky.model.dao.AnnDao;
import com.wky.model.factory.AHPDaoFactory;
import com.wky.model.factory.AnnDaoFactory;

public class AnnDetailsServlet extends HttpServlet {

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
		System.out.println(id);
		if(id!=null){
			AnnDao annDao = AnnDaoFactory.getAnnDaoInstance();
			Ann ann = new Ann();
			ann = annDao.findAnnById(Integer.parseInt(id));
			String annForcastData = ann.getAnnForcastData();
			String annStandard = ann.getAnnStandard();
			int index = ann.getIndex();
			int length = ann.getLength();
			List<double[]> annForcastResult = new ArrayList<double[]>();
			String[][] annForcastDataArr = Matrix.OnetoTwo(annForcastData.split(","), index, length);
			for(int i=0;i<index;i++){
				annForcastResult.add(ArrStrToArrDou(annForcastDataArr[i]));
			}
			double[] annStandardArr = ArrStrToArrDou(annStandard.split(","));
			GsonOption annOptionBar = annOptionBar(annForcastResult,ann.getDataType(),annStandardArr);
			request.setAttribute("annOptionBar", annOptionBar.toString());
			
		}else{
			
		}
		ServletContext servletContext = getServletContext();          
    	RequestDispatcher dispather = servletContext.getRequestDispatcher("/ann/ann_details.jsp");
    	dispather.forward(request, response);
		out.flush();
		out.close();
	}
	
	/**
	 * 
	 * @param list
	 * @param dropdownlist 判断传入数据格式
	 * @param standardData  神经网络标准输出
	 * @return
	 */
	//画样品风险值
	public GsonOption annOptionBar(List<double[]> list,String dropdownlist,double[] standardData){
		GsonOption option = new GsonOption();
		if(dropdownlist.equals("product")){
			option.title().text("样品风险值").subtext("样品风险值柱状图");
			option.tooltip().trigger(Trigger.axis).axisPointer().type(PointerType.shadow);
			//option.tooltip().formatter("{a}");
			for(int i=0;i<list.size();i++){
				option.legend().data().add("样本"+i);
			}
			option.legend().data().add("标准");
			option.calculable(true);
			option.grid().y(70).y2(30).x2(20);
		    ValueAxis xAxis = new ValueAxis();
		    xAxis.type(AxisType.category);
		    
		    for(int i=0;i<list.get(0).length; i++){
		    	xAxis.data().add("指标"+i);
		    }
		    option.xAxis(xAxis);
		    ValueAxis yAxis = new ValueAxis();
		    yAxis.type(AxisType.value);
		    option.yAxis(yAxis);
		    for(int i=0;i<list.size();i++){
		    	Bar bar = new Bar();
			    bar.name("样本"+i).type(SeriesType.bar);
			    bar.itemStyle().normal().label().show(true);
			    for(int j=0;j<list.get(0).length; j++){
			    	bar.data().add(list.get(i)[j]);	
			    } 	
			    option.series(bar);
		    }
		    //标准线
		    Bar barSt = new Bar();
		    barSt.name("标准").type(SeriesType.bar);
		    //barSt.xAxisIndex(1);
		    barSt.itemStyle().normal().color("rgba(252,206,16,0.5)");
		    barSt.itemStyle().normal().label().show(true);
		    barSt.itemStyle().normal().label().formatter(
		    		"function(p){return p.value > 0 ? (p.value +'+'):'';}"
		    		);
		    for(int i=0;i<standardData.length;i++){
		    	 barSt.data().add(standardData[i]);
		    }
		    option.series(barSt);
		}else if(dropdownlist.equals("month")){
			option.title().text("样品风险值").subtext("样品风险值柱状图");
			option.tooltip().trigger(Trigger.axis).axisPointer().type(PointerType.shadow);
			for(int i=0;i<list.size();i++){
				option.legend().data().add((i+1)+"月份");
			}
			option.calculable(true);
		    ValueAxis xAxis = new ValueAxis();
		    xAxis.type(AxisType.category);
		    
		    for(int i=0;i<list.get(0).length; i++){
		    	xAxis.data().add("指标"+i);
		    }
		    option.xAxis(xAxis);
		    ValueAxis yAxis = new ValueAxis();
		    yAxis.type(AxisType.value);
		    option.yAxis(yAxis);
		    for(int i=0;i<list.size();i++){
		    	Bar bar = new Bar();
			    bar.name((i+1)+"月份").type(SeriesType.bar);
			    for(int j=0;j<list.get(0).length; j++){
			    	bar.data().add(list.get(i)[j]);	
			    } 	
			    option.series(bar);
		    }	    
		}else if(dropdownlist.equals("year")){
			option.title().text("样品风险值").subtext("样品风险值柱状图");
			option.tooltip().trigger(Trigger.axis).axisPointer().type(PointerType.shadow);
			for(int i=0;i<list.size();i++){
				option.legend().data().add("第"+(i+1)+"年");
			}
			option.calculable(true);
		    ValueAxis xAxis = new ValueAxis();
		    xAxis.type(AxisType.category);
		    
		    for(int i=0;i<list.get(0).length; i++){
		    	xAxis.data().add("指标"+i);
		    }
		    option.xAxis(xAxis);
		    ValueAxis yAxis = new ValueAxis();
		    yAxis.type(AxisType.value);
		    option.yAxis(yAxis);
		    for(int i=0;i<list.size();i++){
		    	Bar bar = new Bar();
			    bar.name("第"+(i+1)+"年").type(SeriesType.bar);
			    for(int j=0;j<list.get(0).length; j++){
			    	bar.data().add(list.get(i)[j]);	
			    } 	
			    option.series(bar);
		    }	    
		}else{
			
		}
		
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
