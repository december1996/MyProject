package cn.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.bean.Equipment;
import cn.sql.UserSQL;

public class adEServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -420898074289021692L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String sql;
		String number=req.getParameter("number").trim();
		String department=req.getParameter("department").trim();
		String danger=req.getParameter("danger").trim();
		String condition=req.getParameter("condition").trim();
		String user=req.getParameter("user").trim();
		String backNews=null;
		Equipment adEbean=new Equipment();
		req.setAttribute("adEbean",adEbean);
		//获取数据库连接
		Connection con=UserSQL.getConnection();
		
		PreparedStatement ps;
		// 判断填写信息
		if(number.length()==0||department.length()==0||danger.length()==0||condition.length()==0||user.length()==0){
			adEbean.setBackNews("信息填写不完整请重新填写");
			req.getRequestDispatcher("admin-addEquipment.jsp").forward(req, resp);
		}
		boolean isNum=true;
		for (int i = 0; i<number.length(); i++) {
			char c = number.charAt(i);
			if (!(c<='9'&&c>='0')) {
				isNum=false;
			}
		}
		if(!isNum){
			adEbean.setBackNews("设备编号格式不正确（纯数字）");
			req.getRequestDispatcher("admin-addEquipment.jsp").forward(req, resp);
		}
		try {
			
			if (!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			else
				System.out.println("404 not found");
			sql = "INSERT INTO equipment VALUES(?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,number);
			ps.setString(2,department);
			ps.setString(3,danger);
			ps.setString(4,condition);
			ps.setString(5,user);
			int m = ps.executeUpdate();
			if(m!=0){
				backNews="添加成功";
				adEbean.setBackNews(backNews);
				adEbean.setNumber(number);
				adEbean.setCondition(condition);
				adEbean.setDanger(danger);
				adEbean.setUser(user);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.getRequestDispatcher("admin-addEquipment.jsp").forward(req, resp);
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
}
