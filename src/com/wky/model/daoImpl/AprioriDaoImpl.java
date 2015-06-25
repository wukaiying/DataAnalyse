package com.wky.model.daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bean.Ann;
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

	@Override
	public List<Apriori> findAprioriByTime(String start, String end) {
		Connection conn = DBConnection.getConnection();
		String findSQL = "select * from apriori where time>=? and time<=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Apriori> list = new ArrayList<Apriori>();
		try{
			ps = conn.prepareStatement(findSQL);
			ps.setString(1, start);
			ps.setString(2, end);
			rs = ps.executeQuery();
			System.out.println(findSQL);
			while(rs.next()){
				Apriori apriori = new Apriori();
				apriori.setId(rs.getInt(1));
				apriori.setTime(rs.getTimestamp(2));
				apriori.setAprioriData(rs.getString(3));
				list.add(apriori);
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
	public Apriori findAprioriById(int id) {
		Connection conn = DBConnection.getConnection();
		String findSQL = "select * from apriori where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Apriori apriori = new Apriori();
		try{
			ps = conn.prepareStatement(findSQL);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			System.out.println(findSQL);
			if(rs.next()){
				apriori.setId(rs.getInt(1));
				apriori.setTime(rs.getTimestamp(2));
				apriori.setAprioriData(rs.getString(3));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(rs);
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		return apriori;
	}

}
