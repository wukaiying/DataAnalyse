package dbImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wky.dbUtils.DBConnection;

import bean.DairyBean;

public class ShowAllElemAnalyse {
	public List<DairyBean> getProteinAnalyse(String city,String name){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//String sql = "select dairy.DairyID,dairy.SimpleName,CrRe from dairy where dairy.DetectPlace like '%Õ≠»  –%' and CrRe  REGEXP '[0-9]'";
		String findSQL = "select DairyID,SimpleName,ProteinRe from dairy where dairy.DetectPlace like '%"+city+"%' and dairy.SimpleName like '%"+name+"%' and ProteinRe regexp'[0-9]'";
		System.out.println("findsql:"+findSQL);
		List<DairyBean> list = new ArrayList<DairyBean>();
		try{
			ps = conn.prepareStatement(findSQL);
			rs = ps.executeQuery();
			while(rs.next()){
				DairyBean dairyBean = new DairyBean();
				dairyBean.setDairyID(rs.getString(1));
				dairyBean.setSimpleName(rs.getString(2));
				dairyBean.setProteinRe(rs.getString(3));
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
	
	public List<DairyBean> getAflatoxinAnalyse(String city,String name){
		
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//String sql = "select dairy.DairyID,dairy.SimpleName,CrRe from dairy where dairy.DetectPlace like '%Õ≠»  –%' and CrRe  REGEXP '[0-9]'";
		String findSQL = "select DairyID,SimpleName,AflatoxinRe from dairy where dairy.DetectPlace like '%"+city+"%' and dairy.SimpleName like '%"+name+"%' and AflatoxinRe regexp'[0-9]'";
		System.out.println("findsql:"+findSQL);
		List<DairyBean> list = new ArrayList<DairyBean>();
		try{
			ps = conn.prepareStatement(findSQL);
			rs = ps.executeQuery();
			while(rs.next()){
				DairyBean dairyBean = new DairyBean();
				dairyBean.setDairyID(rs.getString(1));
				dairyBean.setSimpleName(rs.getString(2));
				dairyBean.setAflatoxinRe(rs.getString(3));
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

}
