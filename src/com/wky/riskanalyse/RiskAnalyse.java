package com.wky.riskanalyse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wky.dbUtils.DBConnection;

import bean.DairyBean;

public class RiskAnalyse {
	public  List<DairyBean> getRiskAnalyse(String place,String material){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//String sql = "select dairy.DairyID,dairy.SimpleName,CrRe from dairy where dairy.DetectPlace like '%Õ≠»  –%' and CrRe  REGEXP '[0-9]'";
		String sql = "select dairy.DairyID,dairy.SimpleName,"+material+",Manufacturer from dairy where dairy.DetectPlace like '%"+place+"%' and CrRe  REGEXP '[0-9]'";
		List<DairyBean> list = new ArrayList<DairyBean>();
		//System.out.println(sql+"11231232113");
		try{
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				DairyBean dairyBean = new DairyBean();
				dairyBean.setDairyID(rs.getString(1));
				dairyBean.setSimpleName(rs.getString(2));
				dairyBean.setCrRe(rs.getString(3));
				dairyBean.setManufacturer(rs.getString(4));
				list.add(dairyBean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs);
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		return list;
	}
	
	public List<DairyBean> getHighRisk(List<DairyBean> listhigh,double x){
		for(DairyBean l:listhigh){
			if((0.5)-Float.parseFloat(l.getCrRe())>=x){
				listhigh.remove(l);
			}
		}
		return listhigh;
	}
}
