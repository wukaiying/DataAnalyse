package com.wky.model.daoImpl;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bean.AHP;

import com.github.abel533.echarts.json.GsonOption;
import com.wky.dbUtils.DBConnection;
import com.wky.model.dao.AHPDao;

public class AHPDaoImpl implements AHPDao{

	@Override
	public void addAHPData(AHP ahp) {
		Connection conn = DBConnection.getConnection();
		String addSQL = "insert into ahp(id,time,rowName,weight,colName,productRisk,productRiskSt,category) values(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try{
			ps = conn.prepareStatement(addSQL);
			ps.setInt(1, ahp.getId());
			ps.setTimestamp(2, new Timestamp(ahp.getTime().getTime()));
			ps.setString(3, ahp.getRowName());
			ps.setString(4, ahp.getWeight());
			ps.setString(5, ahp.getColName());
			ps.setString(6, ahp.getProductRisk());
			ps.setDouble(7, ahp.getProductRiskSt());
			ps.setString(8, ahp.getCategory());
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
				ahp.setRowName(rs.getString(3));
				ahp.setWeight(rs.getString(4));
				ahp.setColName(rs.getString(5));
				ahp.setProductRisk(rs.getString(6));
				ahp.setProductRiskSt(rs.getDouble(7));
				ahp.setCategory(rs.getString(8));
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

	@Override
	public AHP findAHPById(int id) {
		Connection conn = DBConnection.getConnection();
		String findSQL = "select *from ahp where id = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		AHP ahp = new AHP();
		try{
			ps = conn.prepareStatement(findSQL);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				ahp.setId(rs.getInt(1));
				ahp.setTime(rs.getTimestamp(2));
				ahp.setRowName(rs.getString(3));
				ahp.setWeight(rs.getString(4));
				ahp.setColName(rs.getString(5));
				ahp.setProductRisk(rs.getString(6));
				ahp.setProductRiskSt(rs.getDouble(7));
				ahp.setCategory(rs.getString(8));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs);
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		return ahp;
	}

}
