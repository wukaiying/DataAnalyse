<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="apriori.*" %>
<%@page import="com.wky.dbUtils.*" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="bean.*"%>
<%@page import="dbImpl.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Test items correlation analysis</title>

  </head>
  
  <body>
  	<%
  		//AprioriAlgorithm testAprioriAlgorithm = new AprioriAlgorithm();
  		AprioriAlgorithm apriori;
		Map<Integer, Set<String>> txDatabase;
		Float minSup = new Float("0.50");           //外界给出
		Float minConf = new Float("0.70");          //外界给出
		txDatabase = new HashMap<Integer, Set<String>>();
		//数据库
		Set<String> set1 = new TreeSet<String>();
		/*旧的
		DBUtils dbUtils = new DBUtils();	
		String SQL = "select *from correlationanalysis where ca_id=1";
		ResultSet rs = dbUtils.select(SQL);
		if(rs.next()){
			set1.add(rs.getString(2));
			set1.add(rs.getString(3));
			set1.add(rs.getString(4));
			set1.add(rs.getString(5));
			set1.add(rs.getString(6));
			set1.add(rs.getString(7));
			set1.add(rs.getString(8));	
		}
		//Test
		for(String o:set1){
			System.out.println(o+" ");
		}*/
		//新的
		Connection conn = DBConnection.getConnection();
		String sql = "select *from correlationanalysis where ca_id=1";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				set1.add(rs.getString(2));
				set1.add(rs.getString(3));
				set1.add(rs.getString(4));
				set1.add(rs.getString(5));
				set1.add(rs.getString(6));
				set1.add(rs.getString(7));
				set1.add(rs.getString(8));	
			}
			for(String o:set1){
			System.out.println(o+" ");
		    }
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs);
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		txDatabase.put(1, set1);
		//System.out.println(txDatabase+"asdfas");
		
		Set<String> set2 = new TreeSet<String>();
		Connection conn1 = DBConnection.getConnection();
		String SQL1 = "select *from correlationanalysis where ca_id=2";
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		try{
			ps1 = conn1.prepareStatement(SQL1);
			rs1=ps1.executeQuery();
			if(rs1.next()){
			set2.add(rs1.getString(2));
			set2.add(rs1.getString(3));
			set2.add(rs1.getString(4));
			set2.add(rs1.getString(5));
			set2.add(rs1.getString(6));
			set2.add(rs1.getString(7));
		    }
			for(String o:set2){
			System.out.println(o+" ");
		    }
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs1);
			DBConnection.close(ps1);
			DBConnection.close(conn1);
		}
		txDatabase.put(2, set2);
		//
		Set<String> set3 = new TreeSet<String>();
		Connection conn2 = DBConnection.getConnection();
		String SQL2 = "select *from correlationanalysis where ca_id=3";
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		try{
			ps2 = conn2.prepareStatement(SQL2);
			rs2=ps2.executeQuery();
			if(rs2.next()){
			set3.add(rs2.getString(2));
			set3.add(rs2.getString(3));
			set3.add(rs2.getString(4));
		    }
			for(String o:set3){
			System.out.println(o+" ");
		    }
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs2);
			DBConnection.close(ps2);
			DBConnection.close(conn2);
		}
		txDatabase.put(3, set3);
		Set<String> set4 = new TreeSet<String>();
		Connection conn3 = DBConnection.getConnection();
		String SQL3 = "select *from correlationanalysis where ca_id=4";
		PreparedStatement ps3 = null;
		ResultSet rs3 = null;
		try{
			ps3 = conn3.prepareStatement(SQL3);
			rs3=ps3.executeQuery();
			if(rs3.next()){
			set4.add(rs3.getString(2));
			set4.add(rs3.getString(3));
			set4.add(rs3.getString(4));
			set4.add(rs3.getString(5));
			set4.add(rs3.getString(6));
		    }
			for(String o:set4){
			System.out.println(o+" ");
		    }
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs3);
			DBConnection.close(ps3);
			DBConnection.close(conn3);
		}
		txDatabase.put(4, set4);
		
		apriori = new AprioriAlgorithm(txDatabase, minSup, minConf);
		Map<Set<String>, Integer> result = apriori.getCandFreq1ItemSet();
		apriori.mineFreqItemSet(); // 挖掘频繁项集
		apriori.mineAssociationRules();
		Map<Set<String>, Set<Set<String>>> result1 = apriori.getAssiciationRules();
		Iterator<Map.Entry<Set<String>, Set<Set<String>>>> it = result1.entrySet().iterator();
		Set<String> keyset = new HashSet<String>();
		Set<Set<String>> valueset = new HashSet<Set<String>>();
		while(it.hasNext()){	
			Map.Entry<Set<String>, Set<Set<String>>> entry = it.next();
			//getkey
			
			keyset = entry.getKey();
			for(String str:keyset){
				//System.out.println("----------------");
				System.out.println(str+"a");
			}
			
			//getvalue
			valueset = entry.getValue();
			for(Set<String> str1:valueset){
				System.out.println(str1+"b");
			}
			//System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
		}
  	%>
  	<p><%=result1 %></p>
  </body>
</html>
