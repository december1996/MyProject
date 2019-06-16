package cn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.Equipment;
import cn.dao.EquipmentsDao;
import cn.dao.EquipmentsDaoImpl;
import cn.util.JSONUtil;
import net.sf.json.JSONObject;

public class equipmentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3736412449687986336L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		super.doPost(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		super.doGet(req, resp);
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
//		System.out.println("equipmentServlet");
		JSONObject jsonObjIn = JSONUtil.getJSON(req, resp);
		int id =Integer.parseInt(jsonObjIn.getString("number"));
		
		EquipmentsDao equipmentsDao =new EquipmentsDaoImpl();
		boolean isSuccess=equipmentsDao.delete(id);
		
		//返回JSON数据
		JSONObject jsonObjOut = new JSONObject();
		jsonObjOut.put("isSuccess", isSuccess);
		JSONUtil.returnJSON(req, resp, jsonObjOut);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		
		JSONObject jsonObjIn = JSONUtil.getJSON(req, resp);		
		Equipment equ = new Equipment();
		
		equ.setNumber(jsonObjIn.getString("number"));
		equ.setDepartment(jsonObjIn.getString("department"));
		equ.setDanger(jsonObjIn.getString("danger"));
		equ.setCondition(jsonObjIn.getString("condition"));
		equ.setUser(jsonObjIn.getString("user"));
		
		EquipmentsDao equipmentsDao=new EquipmentsDaoImpl();
		boolean isSuccess=equipmentsDao.update(equ);
		
		JSONObject jsonObjOut =new JSONObject();
		jsonObjOut.put("isSuccess", isSuccess);
		JSONUtil.returnJSON(req, resp, jsonObjOut);
		
	}
	
}
