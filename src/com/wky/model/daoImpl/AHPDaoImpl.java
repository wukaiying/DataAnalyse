package com.wky.model.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bean.AHP;

import com.wky.dbUtils.DBConnection;
import com.wky.model.dao.AHPDao;

public class AHPDaoImpl implements AHPDao{

	@Override
	public void addAHPData(AHP ahp) {
		Connection conn = DBConnection.getConnection();
		String addSQL = "insert into ahp(id,time,weightData,riskData) values(?,?,?,?)";
		PreparedStatement ps = null;
		try{
			ps = conn.prepareStatement(addSQL);
			ps.setInt(1, ahp.getId());
			ps.setTimestamp(2, new Timestamp(ahp.getTime().getTime()));
			ps.setString(3, ahp.getWeightData());
			ps.setString(4, ahp.getRiskData());
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		
	}

	@Override
	public List<AHP> findAHPByTime(String start, String end) {
		Connection conn = DBConnection.getConnection();
		String findSQL = "select * from ahp where time>=? and time<=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<AHP> list = new ArrayList<AHP>();
		try{
			ps = conn.prepareStatement(findSQL);
			ps.setString(1, start);
			ps.setString(2, end);
			rs = ps.executeQuery();
			System.out.println(findSQL);
			while(rs.next()){
				AHP ahp = new AHP();
				ahp.setId(rs.getInt(1));
				ahp.setTime(rs.getTimestamp(2));
				ahp.setWeightData(rs.getString(3));
				ahp.setRiskData(rs.getString(4));
				list.add(ahp);
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
