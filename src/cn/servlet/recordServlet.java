package cn.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.bean.Record;
import cn.dao.AccessoryDaoImpl;
import cn.dao.RecordDao;
import cn.dao.RecordDaoImpl;
import cn.util.JSONUtil;
import net.sf.json.JSONObject;

public class recordServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2818695074583453989L;
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		JSONObject jsonObjIn= JSONUtil.getJSON(req, resp);
		int	number =jsonObjIn.getInt("number"); 
		
		RecordDaoImpl daoImpl = new RecordDaoImpl();
		boolean isSuccess=daoImpl.delete(number);
		
		JSONObject jsonObjOut = new JSONObject();
		jsonObjOut.put("isSuccess", isSuccess);
		JSONUtil.returnJSON(req, resp, jsonObjOut);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String sql;
		
		HttpSession session = req.getSession();
		
		String id =(String)req.getParameter("id");
		System.out.println(id.length());
		String user=new String(req.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(user);
		
		if(id.length()==0&&user.length()==0){
			sql="select * From record";
		}else
		if(id.length()==0&&user.length()!=0){
			sql = String.format("select * From record where user='%s'",user);
		}else
		if(id.length()!=0&&user.length()==0){
			sql = String.format("select * From record where id='%s'",id);
		}else {
			sql = String.format("select * From record where id='%s' and user='%s'",id,user);
			}
		
		System.out.println(sql);
		
		session.setAttribute("seachREC",sql);
		req.getRequestDispatcher("admin-service.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		JSONObject jsonObjIn= JSONUtil.getJSON(req, resp);
		
		Record record = new Record();
		record.setId(jsonObjIn.getString("id"));
		
		String dateStr=jsonObjIn.getString("lastTime");
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = sdf.parse(dateStr);
			record.setTime(date);
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		Date now = new Date();
		record.setCtime(now);
		
		AccessoryDaoImpl acdi = new AccessoryDaoImpl();
		acdi.updateTime(record.getId(),now);
		
		record.setUser(jsonObjIn.getString("user"));
		record.setFacade(jsonObjIn.getString("facade"));
		record.setAnswer(jsonObjIn.getString("answer"));
		record.setRange(jsonObjIn.getString("range"));
		record.setJcresult(jsonObjIn.getString("jcResult"));
		
		RecordDao recordDao=new RecordDaoImpl();
		boolean isSuccess=recordDao.add(record);
		
		JSONObject jsonObjOut =new JSONObject();
		jsonObjOut.put("isSuccess", isSuccess);
		
		JSONUtil.returnJSON(req, resp, jsonObjOut);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		super.doPut(req, resp);
	}
}
