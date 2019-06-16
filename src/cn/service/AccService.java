package cn.service;

import java.util.List;

import cn.bean.Accessory;

public interface AccService {
	//查询附件
	public List<Accessory> getAccessoryList(String sql,Object[] params);
	//增加附件信息
	public boolean add(Accessory acc);
	//根据附件编号删除附件信息
	public boolean delete(String id);
	//修改附件信息
	public boolean update(Accessory acc);
}
