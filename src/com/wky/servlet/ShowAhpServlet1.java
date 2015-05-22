package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;

import com.alibaba.fastjson.JSON;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.AxisType;
import com.github.abel533.echarts.code.PointerType;
import com.github.abel533.echarts.code.SeriesType;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;
import com.github.abel533.echarts.style.ItemStyle;
import com.wky.ahp.AHPComputeWeight;
import com.wky.dbUtils.ExcelUtil;

public class ShowAhpServlet1 extends HttpServlet {
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
		String fileFullPath = request.getParameter("fileFullPath");
		System.out.println(fileFullPath);
		try {
			ExcelUtil eu = new ExcelUtil();
			eu.setExcelPath(fileFullPath);
			//读取第一个sheet
			List<Row> list = eu.readExcel();			
			//读取第二个sheet,为标准数据。
			eu = eu.RestoreSettings();
			eu.setSelectedSheetIdx(1);
			List<Row> listSt = eu.readExcel();			
			/**
			 * 第一个sheet操作
			 */
			//excel表格行数列数
			int rows = list.size();
			int cols = list.get(1).getPhysicalNumberOfCells();
			System.out.println("rows:"+rows);
			System.out.println("cols:"+cols);
			Row r = list.get(0);  //某一行
			StringBuffer sbRowName = new StringBuffer();
			Iterator it = r.cellIterator();
			while(it.hasNext()){
				sbRowName.append(it.next()+",");
			}
			//第一行名字
			String[] rowName = sbRowName.toString().split(",");
			System.out.println("第一行：");
			System.out.println(sbRowName);
			//读取第一列
			StringBuffer sbColName = new StringBuffer();
			for(int i=1;i<rows;i++){
				Row r1 = list.get(i);   //每一行
				sbColName.append(r1.getCell(0)+",");
			}
			String[] colName = sbColName.toString().split(",");
			System.out.println("第一列：");
			System.out.println(sbColName);
			
			//读取中件的数据
			StringBuffer sbNumData = new StringBuffer();
			int index = 1;
			for(int i=1;i<rows;i++){
				Row r2 = list.get(i);
				for(int j=1;j<cols;j++){
					sbNumData.append(r2.getCell(j)+",");
					index ++;
				}
			}
			System.out.println("中间数据：");
			System.out.println(sbNumData);
			//System.out.println("index:"+index);
			String[] arrayData = sbNumData.toString().split(",");
			//ahp传入数据接口
			double[][] b = new double[rows-1][cols-1];
			int k=0;
			for(int i=0;i<rows-1;i++){
				for(int j=0;j<cols-1;j++){
					b[i][j] = Double.parseDouble(arrayData[k]);
					k++;
				}
			}
			//带入AHP算法得到权值
			int N = b[0].length;
			System.out.println("N:"+N);
			AHPComputeWeight instance = AHPComputeWeight.getInstance();
			double[] weight = instance.weight1(b, N);
			for(double x:weight){
				System.out.println(x);
			}
			
			//计算样品风险值(权值乘以每一个样品各个指标的值)
			DecimalFormat dt = new DecimalFormat("######0.00");
			double [] productRisk = new double[rows+1];   //样品和各个指标权重相乘后的数组
			for(int i=0;i<rows-1;i++){
				for(int j=0;j<cols-1;j++){
					productRisk[i] += b[i][j]*weight[j];
				}
			}
			for(int i=0;i<rows-1;i++){
				productRisk[i] = Double.parseDouble(dt.format(productRisk[i]));
			}
			
			/**
			 * 第二个sheet操作
			 */
			//确定两个表格行列相同		
			//先算标准权值
			StringBuffer sbStNumData = new StringBuffer();
			for(int i=1;i<rows;i++){
				Row rSt = listSt.get(i);
				for(int j=1;j<cols;j++){
					sbStNumData.append(rSt.getCell(j)+",");
				}
			}
			System.out.println("sbStNumData:"+sbStNumData);
			String[] arrayStData = sbStNumData.toString().split(",");
			//ahp标准数据传入数据接口
			double[][] bSt = new double[rows-1][cols-1];
			int p=0;
			for(int i=0;i<rows-1;i++){
				for(int j=0;j<cols-1;j++){
					bSt[i][j] = Double.parseDouble(arrayStData[p]);
					p++;
				}
			}
			//带入AHP算法得到权值
			int NSt = bSt[0].length;
			System.out.println("N:"+N);
			//AHPComputeWeight instanceSt = AHPComputeWeight.getInstance();
			double[] weightSt = instance.weight1(bSt, NSt);
			//计算样品标准风险值
			double productRiskSt = 0.0;
			for(int i=0;i<cols-1;i++){
				productRiskSt += (bSt[0][i]*weightSt[i]);
			}
			System.out.println("productRiskSt:"+productRiskSt);			
		
			//发送weightBar到前台
			GsonOption weightBar = WeightOptionBar(rowName,weight); 
			request.setAttribute("weightBar", weightBar.toString());
			request.getSession().setAttribute("sessionWeightBar", weightBar.toString());
			//发送weightPie到前台
			GsonOption weightPie = WeightOptionPie(rowName,weight); 
			request.setAttribute("weightPie", weightPie.toString());
			request.getSession().setAttribute("sessionWeightPie", weightPie.toString());
			//发送productRisk到前台
			GsonOption productRiskBar = productRiskOptionBar(colName,productRisk,productRiskSt); 
			request.setAttribute("productRiskBar", productRiskBar.toString());
			request.getSession().setAttribute("sessionProductRiskBar", productRiskBar.toString());
			ServletContext servletContext = getServletContext();			
			RequestDispatcher dispather = servletContext.getRequestDispatcher("/ahp/show_ahp.jsp");	
			dispather.forward(request, response);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
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
	

}
