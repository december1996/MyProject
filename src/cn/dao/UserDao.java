package cn.dao;

import java.util.List;

import cn.bean.User;

public interface UserDao {
	//获取用户列表
	public List<User> getUserList(String sql ,Object[] params);
	//增加用户
	public boolean add(User user);
	//根据附件编号删除附件信息
	public boolean delete(String uid);
	//修改附件信息
	public boolean update(User user);
}
