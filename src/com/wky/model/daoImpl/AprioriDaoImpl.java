package com.wky.model.daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import bean.Apriori;

import com.wky.dbUtils.DBConnection;
import com.wky.model.dao.AprioriDao;

public class AprioriDaoImpl implements AprioriDao{

	@Override
	public void addAprioriData(Apriori apriori) {
		Connection conn = DBConnection.getConnection();
		String addSQL = "insert into apriori(id,time,aprioriData) values(?,?,?)";
		PreparedStatement ps = null;
		try{
			ps = conn.prepareStatement(addSQL);
			ps.setInt(1, apriori.getId());
			ps.setTimestamp(2, new Timestamp(apriori.getTime().getTime()));
			ps.setString(3, apriori.getAprioriData());
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		
	}

}
