package com.wky.drawcharts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.wky.dbUtils.DBConnection;

public class SentimentPieWeibo {
	public int getCount(String keyname,int flag){
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String findSQL = "select count(*) from tb_weibocomment,tb_weibo where weiboId=fk_weiboId and keyWord like '%"+keyname+"%' and tb_weibocomment.label='"+flag+"'";
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

}
