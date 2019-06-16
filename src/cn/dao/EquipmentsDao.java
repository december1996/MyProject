package cn.dao;

import java.util.List;

import cn.bean.Equipment;

public interface EquipmentsDao {
	//查询设备信息
	public List<Equipment> getEquipmentsList(String sql,Object[] params);
	//增加设备
	public boolean add(Equipment equ);
	//删除设备
	public boolean delete(int id);
	//修改设备
	public boolean update(Equipment equ);
}
