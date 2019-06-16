package cn.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.bean.Record;

public class RecordDaoImpl extends BaseDao implements RecordDao {

	@Override
	public List<Record> getRecordList(String sql, Object[] params) {
		// TODO 自动生成的方法存根
		List<Record> newlist = new ArrayList<Record>();
		ResultSet rs =this.executeSQL(sql, params);
		try {
			while(rs.next()){
				int number = rs.getInt("number");
				String id = rs.getString("id");
				Date time = rs.getDate("time");
				String user = rs.getString("user");
				Date ctime = rs.getDate("ctime");
				String facade = rs.getString("facade");
				String answer = rs.getString("answer");
				String range = rs.getString("ranges");
				String jcresult = rs.getString("jcresult");
				
				Record record=new Record();
				record.setNumber(number);
				record.setId(id);
				record.setTime(time);
				record.setUser(user);
				record.setCtime(ctime);
				record.setFacade(facade);
				record.setAnswer(answer);
				record.setRange(range);
				record.setJcresult(jcresult);
				
				newlist.add(record);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		this.closeResource();
		
		return newlist;
	}

	@Override
	public boolean add(Record rec) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		try {
			String sql="INSERT INTO record(id,time,user,ctime,facade,answer,ranges,jcresult) VALUES(?,?,?,?,?,?,?,?)";
			Object[] params={rec.getId(),rec.getTime(),rec.getUser(),rec.getCtime(),
					rec.getFacade(),rec.getAnswer(),rec.getRange(),rec.getJcresult()};
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
	public boolean delete(int number) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		
		String sql="delete from Record where number = ?";
		Object[] params ={number};
		int i = this.executeUpdate(sql, params);
		if(i>0){
			flag=true;
		}
		this.closeResource();
		return flag;
	}

	@Override
	public boolean update(Record rec) {
		// TODO 自动生成的方法存根
		return false;
	}
/*	测试
	public static void main(String[] args) {
		String sql = "select * from record";
		Object[] params={};
		RecordDaoImpl daoImpl=new RecordDaoImpl();
		Record re=new Record();
		re.setId("FA888");
		re.setTime(new Date());
		re.setUser("周杨");
		re.setCtime(new Date());
		re.setJcresult("正常");
		re.setRange("+-5FS");
//		daoImpl.add(re);
		daoImpl.delete("FA888");
		List<Record> list=daoImpl.getRecordList(sql, params);
		for (Record record : list) {
			System.out.println(record);
		}
	}
	*/

}
