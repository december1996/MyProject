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

import cn.bean.Accessory;
import cn.service.AccService;
import cn.service.AccServiceImp;
import cn.util.JSONUtil;
import net.sf.json.JSONObject;

public class accessoryServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6051142182703835346L;
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		//获取JSON数据
		JSONObject jsonObjIn = JSONUtil.getJSON(req, resp);
		String id = jsonObjIn.getString("id");
		
		AccService accService=new AccServiceImp();
		boolean isSuccess=accService.delete(id);
		
		//返回JSON数据
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
		String equipment=new String(req.getParameter("equipment").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(equipment);
		
		if(id.length()==0&&equipment.length()==0){
			sql="select * From accessory";
		}else
		if(id.length()==0&&equipment.length()!=0){
			sql = String.format("select * From accessory where equipment='%s'",equipment);
		}else
		if(id.length()!=0&&equipment.length()==0){
			sql = String.format("select * From accessory where id='%s'",id);
		}else {
			sql = String.format("select * From accessory where id='%s' and equipment='%s'",id,equipment);
			}
		
		System.out.println(sql);
		
		session.setAttribute("seachACC",sql);
		req.getRequestDispatcher("admin-accessory.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		//获取数据格式
		JSONObject jsonObjIn = JSONUtil.getJSON(req, resp);
		
		Accessory accessory=new Accessory();
		
		accessory.setId(jsonObjIn.getString("id"));
		accessory.setEquipment(jsonObjIn.getString("equipment"));
		accessory.setPeriod(jsonObjIn.getString("period"));
		accessory.setState(jsonObjIn.getString("state"));
		accessory.setVariety(jsonObjIn.getString("variety"));
		String dateStr=jsonObjIn.getString("lastTime");
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = sdf.parse(dateStr);
			accessory.setLastTime(date);
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
//		System.out.println(accessory.toString());
		AccService accService=new AccServiceImp();
		boolean isSuccess = accService.add(accessory);
		System.out.println(isSuccess);
		
		//返回数据格式
		JSONObject jsonObjOut = new JSONObject();
		jsonObjOut.put("isSuccess",isSuccess);
		System.out.println(jsonObjOut);
		JSONUtil.returnJSON(req,resp,jsonObjOut);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		//获取数据格式
				JSONObject jsonObjIn = JSONUtil.getJSON(req, resp);
				
				Accessory accessory=new Accessory();
				
				accessory.setId(jsonObjIn.getString("id"));
				accessory.setEquipment(jsonObjIn.getString("equipment"));
				accessory.setPeriod(jsonObjIn.getString("period"));
				accessory.setState(jsonObjIn.getString("state"));
				accessory.setVariety(jsonObjIn.getString("variety"));
				String dateStr=jsonObjIn.getString("lastTime");
				SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date date = sdf.parse(dateStr);
					accessory.setLastTime(date);
				} catch (ParseException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
//				System.out.println(accessory.toString());
				AccService accService=new AccServiceImp();
				boolean isSuccess = accService.update(accessory);
				System.out.println(isSuccess);
				
				//返回数据格式
				JSONObject jsonObjOut = new JSONObject();
				jsonObjOut.put("isSuccess",isSuccess);
				System.out.println(jsonObjOut);
				JSONUtil.returnJSON(req,resp,jsonObjOut);
	}
}
