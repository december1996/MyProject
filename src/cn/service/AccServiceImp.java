package cn.service;

import java.util.List;

import cn.bean.Accessory;
import cn.dao.AccessoryDao;
import cn.dao.AccessoryDaoImpl;

public class AccServiceImp implements AccService {
	//查询
	@Override
	public List<Accessory> getAccessoryList(String sql, Object[] params) {
		// TODO 自动生成的方法存根
		AccessoryDao accessoryDao= new AccessoryDaoImpl();
		return accessoryDao.getAccessoryList(sql, params);
	}
	//添加
	@Override
	public boolean add(Accessory acc) {
		// TODO 自动生成的方法存根
		AccessoryDao accessoryDao= new AccessoryDaoImpl();
		return accessoryDao.add(acc);
	}
	//删除
	@Override
	public boolean delete(String id) {
		// TODO 自动生成的方法存根
		AccessoryDao accessoryDao= new AccessoryDaoImpl();
		return accessoryDao.delete(id);
	}
	//更新
	@Override
	public boolean update(Accessory acc) {
		// TODO 自动生成的方法存根
		AccessoryDao accessoryDao= new AccessoryDaoImpl();
		return accessoryDao.update(acc);
	}

}
