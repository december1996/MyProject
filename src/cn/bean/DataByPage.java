package cn.bean;

import com.sun.rowset.CachedRowSetImpl;

public class DataByPage {
	//�洢����ȫ����¼���м�����
	private CachedRowSetImpl rowSet = null;
	//ÿҳ��ʾ�ļ�¼��
	private int pageSize = 1;
	//��ҳ����ʾ�ļ�¼��
	private int totalPages = 1;
	//��ǰ��ʾҳ
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
