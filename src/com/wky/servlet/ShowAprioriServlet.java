package com.wky.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;

import bean.Apriori;

import com.wky.apriori.Apriori2;
import com.wky.dbUtils.ExcelUtil;
import com.wky.model.dao.AprioriDao;
import com.wky.model.factory.AprioriDaoFactory;

public class ShowAprioriServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		doPost(request,response);
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//获取前台输入参数
		PrintWriter out = response.getWriter();
		String stSupport = request.getParameter("support");
		String stCONFIDENCE = request.getParameter("confidence");
		String fileFullPath = request.getParameter("fileFullPath");
		System.out.println("fileFullPath:"+fileFullPath);
		String stMethod = request.getParameter("method");
		if((stSupport==null||"".equals(stCONFIDENCE))||(stCONFIDENCE==null||"".equals(stCONFIDENCE))){
			stSupport = "2";
			stCONFIDENCE="0.99";
		}
		int SUPPORT = Integer.parseInt(stSupport);
		double CONFIDENCE = Double.parseDouble(stCONFIDENCE);
		System.out.println(SUPPORT);
		System.out.println(CONFIDENCE);
		//读取excel数据
		List<String> transList = null;
		try{
			ExcelUtil eu = new ExcelUtil();
			eu.setExcelPath(fileFullPath);
			//读取sheet
			List<Row> list = eu.readExcel();
			//excel表格行数列数
			int rows = list.size();
			int cols = list.get(1).getPhysicalNumberOfCells();
			transList=new ArrayList<String>(); //所有交易
			for(int i=0;i<rows;i++){
				StringBuffer sbRow = new StringBuffer();
				for(int j=0;j<cols;j++){
					sbRow.append(list.get(i).getCell(j)+";");			
				}
				transList.add(sbRow.toString());
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}	      	
		Apriori2 ap = new Apriori2();
		/**
		 * 频繁集
		 */
		Map<String,Integer> frequentCollectionMap=ap.getFC(transList,SUPPORT);
		System.out.println("----------------频繁集"+"----------------");
	       Set<String> fcKeySet=frequentCollectionMap.keySet();
	       for(String fcKey:fcKeySet){
	                System.out.println(fcKey+"  :  "+frequentCollectionMap.get(fcKey));
	       }
		/**
		 * 关联规则
		 */
		Map<String,Double> relationRulesMap=ap.getRelationRules(frequentCollectionMap,CONFIDENCE);
	    request.setAttribute("relationRulesMap", relationRulesMap);
	    request.getSession().setAttribute("sessionRelationRulesMap", relationRulesMap);
	    //把数据也插入数据库一份
	    Apriori apriori = new Apriori();
	    apriori.setAprioriData(relationRulesMap.toString());
	    apriori.setTime(new Date());
	    AprioriDao aprioriDao = AprioriDaoFactory.getAprioriDaoInstance();
	    aprioriDao.addAprioriData(apriori);
	    
	    System.out.println("----------------关联规则"+"----------------");
        Set<String> rrKeySet=relationRulesMap.keySet();
        for(String rrKey:rrKeySet){
                            System.out.println(rrKey+"  :  "+relationRulesMap.get(rrKey));
                   
         }
        ServletContext servletContext = getServletContext();          
    	RequestDispatcher dispather = servletContext.getRequestDispatcher("/Apriori/ShowApriori.jsp");
    	dispather.forward(request, response);
		out.flush();
		out.close();
	}
	
  

}
