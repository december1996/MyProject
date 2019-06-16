package cn.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
	//获取数据库连接
	Connection con=null;
	public String driver = "com.mysql.jdbc.Driver";
	public String url = "jdbc:mysql://localhost:3306/db_accessory";
	public String dbuser = "root";
	public String dbpassword = "123456";
	
	public PreparedStatement pstmt =null;
	public ResultSet rs=null;
	
	public boolean getConnection(){
	        try {
	            Class.forName(driver);
	            con = DriverManager.getConnection(url, dbuser, dbpassword);		          
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            return	false;
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            return	false;
	        }
	        return	true;
	    }
	//增删改
	public int executeUpdate(String sql,Object[] params){
		int updateRows = 0;
		if(this.getConnection()){
			try {
				pstmt = con.prepareStatement(sql);
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i+1,params[i]);					
				}
				updateRows=pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		return updateRows;
	}
	
	//查
	public ResultSet executeSQL(String sql,Object[] params){
		if(this.getConnection()){
			try {
				pstmt = con.prepareStatement(sql);
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i+1,params[i]);					
				}
				rs=pstmt.executeQuery();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		return rs;
	}
	//释放资源
	public boolean closeResource(){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				return false;
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				return false;
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
}
