package dbImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wky.dbUtils.DBConnection;

import bean.DairyBean;


public class PlaceAnalyse {
	public  List<DairyBean> getPlaceAnalyseCr(String place){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//String sql = "select dairy.DairyID,dairy.SimpleName,CrRe from dairy where dairy.DetectPlace like '%Õ≠»  –%' and CrRe  REGEXP '[0-9]'";
		String sql = "select dairy.DairyID,dairy.SimpleName,CrRe from dairy where dairy.DetectPlace like '%"+place+"%' and CrRe  REGEXP '[0-9]'";
		List<DairyBean> list = new ArrayList<DairyBean>();
		//System.out.println(sql+"11231232113");
		try{
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				DairyBean dairyBean = new DairyBean();
				dairyBean.setSimpleName(rs.getString(2));
				dairyBean.setCrRe(rs.getString(3));
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
	
	public  List<DairyBean> getPlaceAnalyseProtein(String place){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select dairy.DairyID,dairy.SimpleName,ProteinRe from dairy where dairy.DetectPlace like '%"+place+"%' and ProteinRe  REGEXP '[0-9]'";
		System.out.println(sql+"ssssssssssssssssssssssssssssssssss");
		List<DairyBean> list = new ArrayList<DairyBean>();
		try{
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				DairyBean dairyBean = new DairyBean();
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
	//ª∆«˙√πÀÿ
	public  List<DairyBean> getPlaceAnalyseAx(String place){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		//String sql = "select dairy.DairyID,dairy.SimpleName,CrRe from dairy where dairy.DetectPlace like '%Õ≠»  –%' and CrRe  REGEXP '[0-9]'";
		String sql = "select dairy.DairyID,dairy.SimpleName,AflatoxinRe from dairy where dairy.DetectPlace like '%"+place+"%' and AflatoxinRe  REGEXP '[0-9]'";
		System.out.println("sql:"+sql);
		List<DairyBean> list = new ArrayList<DairyBean>();
		try{
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				DairyBean dairyBean = new DairyBean();
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
