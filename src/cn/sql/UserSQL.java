package cn.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UserSQL {
	// Connection
	public static Connection con;
	// 加载驱动
	public static String driver = "com.mysql.jdbc.Driver";
	// URL
	public static String url = "jdbc:mysql://localhost:3306/db_accessory";
	// MySQL账号
	public static String dbuser = "root";
	// MySQL密码
	public static String dbpassword = "123456";
	 public static Connection getConnection(){
	        try {
	            //������
	            Class.forName(driver);
	            
	            //������ݿ�
	            	con = DriverManager.getConnection(url, dbuser, dbpassword);
	            
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return con;
	    }
}
