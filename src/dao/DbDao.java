package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbDao {
	 Connection conn = null;
	 Statement stmt = null;
	 PreparedStatement pstmt=null;
	 ResultSet rs=null;
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
	
	/** 数据库连接方法**/
	public void getConnection() {
		try {
			this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/struts2?characterEncoding=utf8","root","1708030145"); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConn(){
		if(conn==null)this.getConnection();
		return conn;
	}
	
	
	/**
	 * 创建表达式对象
	 * @return
	 */
	public Statement getStmt(){
		if(stmt!=null)return stmt;
		if(conn==null)this.getConnection();
		try {
			this.stmt = this.conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	public void closeConn(){
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public void closeStmt(){
		if(stmt!=null)
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public void closeAll(){
		if(rs!=null)
			try {
				rs.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		this.closeStmt();
		this.closeConn();
		if(pstmt!=null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}

