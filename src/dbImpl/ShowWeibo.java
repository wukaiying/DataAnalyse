package dbImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wky.dbUtils.DBConnection;

import bean.Weibo;

public class ShowWeibo {
	public List<Weibo> getWeibo(String name){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String findSQL = "select * from tb_weibo where keyWord like '%"+name+"%'";
		System.out.println("findsql:"+findSQL);
		List<Weibo> list = new ArrayList<Weibo>();
		try{
			ps = conn.prepareStatement(findSQL);
			rs = ps.executeQuery();
			while(rs.next()){
				Weibo weibo = new Weibo();
				weibo.setFk_weiboId(rs.getString(2));
				weibo.setUserId(rs.getString(3));
				weibo.setKeyWord(rs.getString(4));
				weibo.setContent(rs.getString(5));
				weibo.setCollectAt(rs.getString(9));
				list.add(weibo);
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
