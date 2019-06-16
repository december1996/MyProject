package cn.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.bean.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public List<User> getUserList(String sql, Object[] params) {
		// TODO 自动生成的方法存根
		List<User> newlist = new ArrayList<User>();
		ResultSet rs = this.executeSQL(sql, params);
		try {
			while(rs.next()){
				User user =new User();
				String username= rs.getString("username");
				String uid=rs.getString("uid");
				String password=rs.getString("password");
				String department=rs.getString("department");
				String tell=rs.getString("tell");
				String role=rs.getString("role");
				
				user.setUid(uid);
				user.setUsername(username);
				user.setPassword(password);
				user.setDepartment(department);
				user.setTell(tell);
				user.setRole(role);
				
				newlist.add(user);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		this.closeResource();
		return newlist;
	}

	@Override
	public boolean add(User user) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		String sql="insert into user(username,uid,password,department,tell,role) values(?,?,?,?,?,?)";
		Object[] params = {user.getUsername(),user.getUid(),user.getPassword(),user.getDepartment(),user.getTell(),user.getRole()};
		int i = this.executeUpdate(sql, params);
		if(i>0){
			flag=true;
		}
		return flag;
	}

	@Override
	public boolean delete(String uid) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		String sql="delete from user where uid = ?";
		Object[] params ={uid};
		int i = this.executeUpdate(sql, params);
		if(i>0){
			flag=true;
		}
		this.closeResource();
		return flag;
	}

	@Override
	public boolean update(User user) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		return flag;
	}
	
	public boolean password(String uid,String password){
		boolean flag=false;
		String sql="update user set password=? where uid=?";
		Object[] params={password,uid};
		int i =this.executeUpdate(sql, params);
		if(i>0){
			flag=true;
		}
		return flag;	
	}
	/*测试
	public static void main(String[] args) {
		String sql = "select * from user";
		Object[] params = {};
		User user=new User();
		user.setUid("ceshi");
		user.setUsername("测试");
		user.setPassword("ceshi");
		user.setDepartment("一厂");
		user.setTell("15879555598");
		user.setRole("测试人员");
		
		UserDaoImpl daoImpl= new UserDaoImpl();
//		daoImpl.add(user);
//		daoImpl.delete("ceshi");
		List<User> list=daoImpl.getUserList(sql, params);
		for (User users : list) {
			System.out.println(users);
		}
	}
	*/

}
