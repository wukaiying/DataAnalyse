package dbImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.wky.dbUtils.DBConnection;
import com.wky.dbUtils.Page;

import bean.DairyBean;

public class ShowAll {
	public List<DairyBean> getInfo(String name,String city){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//String sql = "select dairy.DairyID,dairy.SimpleName,CrRe from dairy where dairy.DetectPlace like '%铜仁市%' and CrRe  REGEXP '[0-9]'";
		String findSQL = "select DairyID,RegistNum,SimpleName,DetectPlace,DetectedPlace,FinalJudge,ProductionDate from dairy where dairy.DetectPlace like '%"+city+"%' and dairy.SimpleName like '%"+name+"%'";
		System.out.println("findsql:"+findSQL);
		List<DairyBean> list = new ArrayList<DairyBean>();
		try{
			ps = conn.prepareStatement(findSQL);
			rs = ps.executeQuery();
			while(rs.next()){
				DairyBean dairyBean = new DairyBean();
				dairyBean.setDairyID(rs.getString(1));
				dairyBean.setRegistNum(rs.getString(2));
				dairyBean.setSimpleName(rs.getString(3));
				dairyBean.setDetectPlace(rs.getString(4));
				dairyBean.setDetectedPlace(rs.getString(5));
				dairyBean.setFinalJudge(rs.getString(6));
				dairyBean.setProductionDate(rs.getString(7));
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
	
	//返回总记录数
	public int getAllCount(String name,String city){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String findSQL = "select count(*) from dairy where dairy.DetectPlace like '%"+city+"%' and dairy.SimpleName like '%"+name+"%'";
		System.out.println("findsql:"+findSQL);
		int count=0;
		try{
			ps = conn.prepareStatement(findSQL);
			rs = ps.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs);
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		return count;
	}
	
	//含有分页的
	public List<DairyBean> getInfoFenye(String name,String city,Page page){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//String sql = "select dairy.DairyID,dairy.SimpleName,CrRe from dairy where dairy.DetectPlace like '%铜仁市%' and CrRe  REGEXP '[0-9]'";
		String findSQL = "select DairyID,RegistNum,SimpleName,DetectPlace,DetectedPlace,FinalJudge,ProductionDate from dairy where dairy.DetectPlace like '%"+city+"%' and dairy.SimpleName like '%"+name+"%' limit ?,?";
		System.out.println("findsql:"+findSQL);
		List<DairyBean> list = new ArrayList<DairyBean>();
		try{
			ps = conn.prepareStatement(findSQL);
			ps.setInt(1, page.getBeginIndex());   //查询起点，查询记录数
			ps.setInt(2, page.getEveryPage());
			rs = ps.executeQuery();
			while(rs.next()){
				DairyBean dairyBean = new DairyBean();
				dairyBean.setDairyID(rs.getString(1));
				dairyBean.setRegistNum(rs.getString(2));
				dairyBean.setSimpleName(rs.getString(3));
				dairyBean.setDetectPlace(rs.getString(4));
				dairyBean.setDetectedPlace(rs.getString(5));
				dairyBean.setFinalJudge(rs.getString(6));
				dairyBean.setProductionDate(rs.getString(7));
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
