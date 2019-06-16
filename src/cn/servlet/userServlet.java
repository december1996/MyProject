package cn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.User;
import cn.dao.UserDaoImpl;
import cn.util.JSONUtil;
import net.sf.json.JSONObject;

public class userServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9075718260214430424L;
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		JSONObject jsonObjIn = JSONUtil.getJSON(req, resp);
		String uid = jsonObjIn.getString("uid");
		
		UserDaoImpl daoImpl= new UserDaoImpl();
		boolean isSuccess=daoImpl.delete(uid);
		
		JSONObject jsonObjOut = new JSONObject();
		jsonObjOut.put("isSuccess", isSuccess);
		JSONUtil.returnJSON(req, resp, jsonObjOut);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		JSONObject jsonObjIn = JSONUtil.getJSON(req, resp);
		User user= new User();
		
		user.setUsername(jsonObjIn.getString("username"));
		user.setUid(jsonObjIn.getString("uid"));
		user.setPassword(jsonObjIn.getString("password"));
		user.setDepartment(jsonObjIn.getString("department"));
		user.setTell(jsonObjIn.getString("tell"));
		user.setRole(jsonObjIn.getString("role"));
		
		UserDaoImpl daoImpl= new UserDaoImpl();
		boolean isSuccess=daoImpl.add(user);
		
		JSONObject jsonObjOut = new JSONObject();
		jsonObjOut.put("isSuccess", isSuccess);
		JSONUtil.returnJSON(req, resp, jsonObjOut);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		JSONObject jsonObjIn = JSONUtil.getJSON(req, resp); 
		String uid = jsonObjIn.getString("uid");
		String password = jsonObjIn.getString("password");
		
		UserDaoImpl daoImpl = new UserDaoImpl();
		boolean isSuccess=daoImpl.password(uid, password);
		
		JSONObject jsonObjOut = new JSONObject();
		jsonObjOut.put("isSuccess", isSuccess);
		JSONUtil.returnJSON(req, resp, jsonObjOut);
	}
}
