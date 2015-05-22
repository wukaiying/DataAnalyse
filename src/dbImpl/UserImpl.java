package dbImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.wky.dbUtils.DBConnection;

import bean.User;

public class UserImpl {
	public User findUserByID(int id){
		Connection conn = DBConnection.getConnection();
		String findSql = "select *from User where User.id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user  =null;
		try{
			ps = conn.prepareStatement(findSql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setIsAdmin(rs.getInt(4));
			}
		}catch(Exception e){
			
		}finally{
			DBConnection.close(rs);
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		return user;
	}
	/**
	 * @exception:×¢²á´úÂë 
	 * @author:wky
	 * @time:4.9
	 */
	public int addUser(User user){
		Connection conn = DBConnection.getConnection();
		String addSql = "insert into User(name,password,isAdmin) values(?,?,?)";
		System.out.println(addSql);
		PreparedStatement ps = null;
		ResultSet rs = null;
		int i = 0;
		try{
			ps = conn.prepareStatement(addSql);
			ps.setString(1,user.getName());
			ps.setString(2, user.getPassword());
			ps.setInt(3, user.getIsAdmin());
			i = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(ps);
			DBConnection.close(conn);
		}
		return i;
	}
}
