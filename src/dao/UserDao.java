package dao;
import java.sql.*;

import model.UserInfo;

public class UserDao extends DbDao {
	//个人信息查询
	public UserInfo queryUser(String username) {
		UserInfo user=null;
		this.conn = getConn();
		this.stmt = getStmt();
		String sql = "select * from userinfo where username ='"+username+"'";
		try {
			ResultSet rs = stmt.executeQuery(sql);
			if (rs!=null && rs.next()){
				user=new UserInfo();
				user.setUsername(rs.getString("username"));
				user.setUserImg(rs.getString("userImg"));
				user.setBPhone(rs.getString("bPhone"));
				user.setRelationUser(rs.getString("relationUser"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}
	
	//用户信息修改
	public boolean updateUser(String id,UserInfo user) {
		boolean flag = false;
		this.conn = getConn();
		this.stmt = getStmt();
		String sql="update userinfo set username='" + user.getUsername()
		+ "',bPhone='" + user.getBPhone() + "',relationUser='"+user.getRelationUser()+"' where username='"+id+"'";	
		try {
			int i = stmt.executeUpdate(sql);
			if(i==1) {
				flag=true;
			}
		}catch (SQLException e) {
				e.printStackTrace();
			}
		return flag;
	}
	
	public boolean updateImg(String address,String userImg) {
		boolean flag = false;
		this.conn = getConn();
		this.stmt = getStmt();
		String sql="update userinfo set userImg='"+address+"' where userImg='"+userImg+"'";
		try {
			int i = stmt.executeUpdate(sql);
			if(i==1) {
				flag=true;
			}
		}catch (SQLException e) {
				e.printStackTrace();
			}
		return flag;
	}
}

