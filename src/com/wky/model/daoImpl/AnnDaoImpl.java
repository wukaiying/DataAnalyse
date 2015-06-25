package com.wky.model.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bean.AHP;
import bean.Ann;

import com.wky.dbUtils.DBConnection;
import com.wky.model.dao.AnnDao;

public class AnnDaoImpl implements AnnDao{

	@Override
	public void addAnnData(Ann ann) {
		Connection conn = DBConnection.getConnection();
		String addSQL = "insert into ann values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try{
			ps = conn.prepareStatement(addSQL);
			ps.setInt(1, ann.getId());
			ps.setTimestamp(2, new Timestamp(ann.getTime().getTime()));
			ps.setString(3, ann.getDataType());
			ps.setString(4, ann.getAnnForcastData());
			ps.setDouble(5, ann.getTrainError());
			ps.setInt(6, ann.getEpoch());
			ps.setString(7, ann.getAnnStandard());
			ps.setInt(8, ann.getIndex());
			ps.setInt(9, ann.getLength());
			//System.out.println(addSQL);
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		
	}

	@Override
	public List<Ann> findAnnByTime(String start, String end) {
		Connection conn = DBConnection.getConnection();
		String findSQL = "select * from ann where time>=? and time<=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Ann> list = new ArrayList<Ann>();
		try{
			ps = conn.prepareStatement(findSQL);
			ps.setString(1, start);
			ps.setString(2, end);
			rs = ps.executeQuery();
			System.out.println(findSQL);
			while(rs.next()){
				Ann ann = new Ann();
				ann.setId(rs.getInt(1));
				ann.setTime(rs.getTimestamp(2));
				ann.setDataType(rs.getString(3));
				ann.setAnnForcastData(rs.getString(4));
				ann.setTrainError(rs.getDouble(5));
				ann.setEpoch(rs.getInt(6));
				ann.setAnnStandard(rs.getString(7));
				ann.setIndex(rs.getInt(8));
				ann.setLength(rs.getInt(9));
				list.add(ann);
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
	public Ann findAnnById(int id) {
		Connection conn = DBConnection.getConnection();
		String findSQL = "select * from ann where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Ann ann = new Ann();
		try{
			ps = conn.prepareStatement(findSQL);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			System.out.println(findSQL);
			if(rs.next()){
				ann.setId(rs.getInt(1));
				ann.setTime(rs.getTimestamp(2));
				ann.setDataType(rs.getString(3));
				ann.setAnnForcastData(rs.getString(4));
				ann.setTrainError(rs.getDouble(5));
				ann.setEpoch(rs.getInt(6));
				ann.setAnnStandard(rs.getString(7));
				ann.setIndex(rs.getInt(8));
				ann.setLength(rs.getInt(9));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs);
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		return ann;
	}

}
