package cn.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.bean.Accessory;

public class AccessoryDaoImpl extends BaseDao implements AccessoryDao {

	@Override
	public List<Accessory> getAccessoryList(String sql, Object[] params) {
		// TODO 自动生成的方法存根
		List<Accessory> newlist = new ArrayList<Accessory>();
		try {
			ResultSet rs = this.executeSQL(sql, params);
			//处理执行结果
			while(rs.next()){
				//读取结果集数据
				String id=rs.getString("id");
				String equipment=rs.getString("equipment");
				String variety=rs.getString("variety");
				String period=rs.getString("period");
				Date lastTime=rs.getDate("lastTime");
				String state=rs.getString("state");
				//封装成附件对象
				Accessory acc=new Accessory();
				acc.setLastTime(lastTime);
				acc.setId(id);
				acc.setEquipment(equipment);
				acc.setPeriod(period);
				acc.setState(state);
				acc.setVariety(variety);
				newlist.add(acc);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		this.closeResource();
		return newlist;
	}

	@Override
	public boolean add(Accessory acc) {
		// TODO 自动生成的方法存根
		boolean flag;
		flag = false;	
		try {
			String sql="insert into accessory(id,equipment,variety,period,lastTime,state) values(?,?,?,?,?,?)";
			Object[] params={acc.getId(),acc.getEquipment(),acc.getVariety(),acc.getPeriod(),acc.getLastTime(),acc.getState()};
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
	public boolean delete(String id) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		
		String sql="delete from accessory where id = ?";
		Object[] params ={id};
		int i = this.executeUpdate(sql, params);
		if(i>0){
			flag=true;
		}
		this.closeResource();
		return flag;
	}

	@Override
	public boolean update(Accessory acc) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		String sql="update accessory set equipment=?,variety=? ,period=?, lastTime=? , state=? where id=?";
		Object[] params={acc.getEquipment(),acc.getVariety(),acc.getPeriod(),acc.getLastTime(),acc.getState(),acc.getId()};
		int i = this.executeUpdate(sql, params);
		if(i>0){
			flag=true;
		}
		this.closeResource();
		return flag;
	}
	public boolean updateTime(String id,Date date){
		boolean flag=false;
		String sql = "update accessory set lastTime=? where id=?";
		Object[] params={date,id};
		int i = this.executeUpdate(sql, params);
		if(i>0){
			flag=false;
		}
		return flag;
	}
}
