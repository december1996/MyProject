package cn.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.bean.User;
import cn.sql.UserSQL;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1407426876504649675L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		System.out.println("username=" + username + "password=" + pwd);
		// 获得session
		HttpSession session=request.getSession();
		try {
			//获取连接
			Connection con=UserSQL.getConnection();
			// 判断连接是否成功
			if (!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			else
				System.out.println("404 not found");			
			// SQL语句
			String sql = String.format("select * From user where uid='%s' and password='%s'", username, pwd);
			
			Statement stmt = con.createStatement();	
			// 获取结果集
			ResultSet rs = stmt.executeQuery(sql);		
			//判断用户是否存在
			if (rs.next()) {
				User user = new User();
//				request.setAttribute("via", rs.getString("username"));
				getMessage(rs, user);
				//把user放到session				
				session.setAttribute("user", user);
				session.setAttribute("lgin", "lgin");
				if (user.getRole().equals("系统管理员")) {
					request.getRequestDispatcher("admin.jsp").forward(request, response);
				}else
				request.getRequestDispatcher("admin-index.jsp").forward(request, response);
				
			} else{
				
				response.getWriter().write("<script>alert('Incorrect user name or password')</script>");
				
				}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param rs
	 * @param user
	 * @throws SQLException
	 */
	public void getMessage(ResultSet rs, User user) throws SQLException {
		user.setDepartment(rs.getString("department"));
		user.setUsername(rs.getString("username"));
		user.setRole(rs.getString("role"));
		user.setTell(rs.getString("tell"));
		user.setUid(rs.getString("uid"));
		user.setPassword(rs.getString("password"));
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	
}
