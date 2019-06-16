package cn.bean;

import com.sun.rowset.CachedRowSetImpl;

public class DataByPage {
	//存储表中全部记录的行集对象
	private CachedRowSetImpl rowSet = null;
	//每页显示的记录数
	private int pageSize = 1;
	//分页后显示的记录数
	private int totalPages = 1;
	//当前显示页
	private int currentPage = 1;
	public CachedRowSetImpl getRowSet() {
		return rowSet;
	}
	public void setRowSet(CachedRowSetImpl rowSet) {
		this.rowSet = rowSet;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
}
