package cn.dao;

import java.util.List;

import cn.bean.Record;

public interface RecordDao {
	//查询记录
	public List<Record> getRecordList(String sql,Object[] params);
	//增加记录
	public boolean add(Record rec);
	//根据附件编号删除记录
	public boolean delete(int number);
	//修改附件信息
	public boolean update(Record rec);
}
