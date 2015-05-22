package com.wky.dbUtils;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;

public class TestExcelUtil {
	public static void main(String[] args){
			try {
				
				ExcelUtil eu = new ExcelUtil();
				eu.setExcelPath("E:/食品安全数据挖掘/食品数据分析/AHP/AHP数据/ahp_data.xls");
				
				//System.out.println("=======测试Excel 默认 读取========");
				List<Row> list = eu.readExcel();
				//行数
				int rows = list.size();
				int cols = list.get(1).getPhysicalNumberOfCells();
				System.out.println("rows:"+rows);
				System.out.println("cols:"+cols);
				Row r = list.get(0);  //某一行
				StringBuffer sb0 = new StringBuffer();
				Iterator it = r.cellIterator();
				while(it.hasNext()){
					sb0.append(it.next()+",");
				}
				System.out.println("第一行：");
				System.out.println(sb0);
				//读取第一列
				StringBuffer sb = new StringBuffer();
				for(int i=1;i<rows;i++){
					Row r1 = list.get(i);   //每一行
					sb.append(r1.getCell(0)+",");
				}
				System.out.println("第一列：");
				System.out.println(sb);
	
				
				//读取中件的数据
				StringBuffer sb1 = new StringBuffer();
				int index = 1;
				for(int i=1;i<rows;i++){
					Row r2 = list.get(i);
					for(int j=1;j<cols;j++){
						sb1.append(r2.getCell(j)+",");
						index ++;
					}
				}
				String str = sb1.toString();
				System.out.println("Str:"+str);
				System.out.println("中间数据：");
				System.out.println(sb1);
				System.out.println("index:"+index);
				
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
