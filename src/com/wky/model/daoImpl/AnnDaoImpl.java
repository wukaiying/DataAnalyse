package com.wky.model.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import bean.Ann;

import com.wky.dbUtils.DBConnection;
import com.wky.model.dao.AnnDao;

public class AnnDaoImpl implements AnnDao{

	@Override
	public void addAnnData(Ann ann) {
		Connection conn = DBConnection.getConnection();
		String addSQL = "insert into ann(id,time,dataType,annData,trainError,epoch) values(?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try{
			ps = conn.prepareStatement(addSQL);
			ps.setInt(1, ann.getId());
			ps.setTimestamp(2, new Timestamp(ann.getTime().getTime()));
			ps.setString(3, ann.getDataType());
			ps.setString(4, ann.getAnnData());
			ps.setDouble(5, ann.getTrainError());
			ps.setInt(6, ann.getEpoch());
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		
	}

}
