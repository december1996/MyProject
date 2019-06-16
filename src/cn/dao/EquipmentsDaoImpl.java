package cn.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.bean.Equipment;

public class EquipmentsDaoImpl extends BaseDao implements EquipmentsDao {

	//查询设备信息
	@Override
	public List<Equipment> getEquipmentsList(String sql, Object[] params) {
		// TODO 自动生成的方法存根
		List<Equipment> newlist = new ArrayList<Equipment>();
		try {
			ResultSet rs = this.executeSQL(sql, params);
			//处理执行结果
			while(rs.next()){
				//读取结果集数据
				String number=rs.getString("number");
				String department=rs.getString("department");
				String danger=rs.getString("danger");
				String condition=rs.getString("state");
				String user=rs.getString("user");
				//封装成设备对象
				Equipment equ=new Equipment();
				equ.setCondition(condition);
				equ.setDanger(danger);
				equ.setDepartment(department);
				equ.setNumber(number);
				equ.setUser(user);
				newlist.add(equ);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		this.closeResource();
		return newlist;
	}

	@Override
	public boolean add(Equipment equ) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		try {
			String sql="INSERT INTO equipment VALUES(?,?,?,?,?)";
			Object[] params={Integer.parseInt(equ.getNumber()),equ.getDepartment(),equ.getDanger(),equ.getCondition(),equ.getUser()};
			int i = this.executeUpdate(sql, params);
			if(i>0){
				flag=true;
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			this.closeResource();
		}
		return flag;
	}

	@Override
	public boolean delete(int id) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		
		String sql="delete from equipment where number= ?";
		Object[] params ={id};
		int i = this.executeUpdate(sql, params);
		if(i>0){
			flag=true;
		}
		this.closeResource();
		return flag;
	}

	@Override
	public boolean update(Equipment equ) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		String sql = "update equipment set  department = ?, danger = ?, state = ?, user = ? where number = ?";
		Object[] params ={equ.getDepartment(),equ.getDanger(),equ.getCondition(),equ.getUser(),Integer.parseInt(equ.getNumber())};
		int i = this.executeUpdate(sql, params);
		if(i>0){
			flag=true;
		}
		this.closeResource();
		return flag;
	}
	
//测试	
/*	public static void main(String[] args) {
		EquipmentsDaoImpl epdi=new EquipmentsDaoImpl();
		Equipment e=new Equipment();
		e.setNumber("444444444");
		e.setDepartment("二厂");
		e.setDanger("危险点4");
		e.setCondition("危险");
		e.setUser("笑笑");
//		epdi.add(e);
		epdi.delete(Integer.parseInt(e.getNumber()));
//		epdi.update(e);
		String sql = "select * From equipment";
		Object[] params={};
		List<Equipment> list = epdi.getEquipmentsList(sql, params);
		
		for (Equipment equipment : list) {
			System.out.println(equipment);
		}
	}
*/
	
}
