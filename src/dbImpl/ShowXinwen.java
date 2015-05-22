package dbImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wky.dbUtils.DBConnection;

import bean.Weibo;
import bean.XinwenBean;

/*
 * author:wky
 * Description:输入热词查新闻
 * */
public class ShowXinwen {
	public List<XinwenBean> getXinwen(String name){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String findSQL = "select news.newsid,news.title,news.URL,foodclasses.FoodClassName from newsfoodclass,news,foodclasses where news.NewsID=newsfoodclass.NewsID and foodclasses.FoodClassID=newsfoodclass.FoodClassID and FoodClassName like '%"+name+"%'";
		System.out.println("findsql:"+findSQL);
		List<XinwenBean> list = new ArrayList<XinwenBean>();
		try{
			ps = conn.prepareStatement(findSQL);
			rs = ps.executeQuery();
			while(rs.next()){
				XinwenBean xinwenBean = new XinwenBean();
				xinwenBean.setNewsID(rs.getInt(1));
				xinwenBean.setTitle(rs.getString(2));
				xinwenBean.setUrl(rs.getString(3));
				xinwenBean.setFoodClassName(rs.getString(4));
				list.add(xinwenBean);
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
