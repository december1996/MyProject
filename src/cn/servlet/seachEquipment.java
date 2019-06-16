package cn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class seachEquipment extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2390604369739325580L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String sql;
		
		HttpSession session = req.getSession();
		
		String id =(String)req.getParameter("id");
		System.out.println(id.length());
		String department=(String)req.getParameter("department");
		System.out.println(department);
		
		if(id.length()==0&&department.length()==0){
			sql="select * From equipment";
		}else
		if(id.length()==0&&department.length()!=0){
			sql = String.format("select * From equipment where department='%s'",department);
		}else
		if(id.length()!=0&&department.length()==0){
			sql = String.format("select * From equipment where number='%s'",id);
		}else {
			sql = String.format("select * From equipment where number='%s' and department='%s'",id,department);
			}
		
		System.out.println(sql);
		
		session.setAttribute("seachEQM",sql);
		req.getRequestDispatcher("admin-equipment.jsp").forward(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
}
