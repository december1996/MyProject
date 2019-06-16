package cn.bean;

import java.util.Date;

public class Record {
	
	private int number;
	private String id;
	private Date time;
	private String user;
	private Date ctime;
	private String facade;
	private String answer;
	private String range;
	private String jcresult;
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public Date getCtime() {
		return ctime;
	}
	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time2) {
		this.time = time2;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getFacade() {
		return facade;
	}
	public void setFacade(String facade) {
		this.facade = facade;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getRange() {
		return range;
	}
	public void setRange(String range) {
		this.range = range;
	}
	public String getJcresult() {
		return jcresult;
	}
	public void setJcresult(String jcresult) {
		this.jcresult = jcresult;
	}
	@Override
	public String toString() {
		return "Record [number=" + number + ", id=" + id + ", time=" + time + ", user=" + user + ", ctime=" + ctime
				+ ", facade=" + facade + ", answer=" + answer + ", range=" + range + ", jcresult=" + jcresult + "]";
	}
	
	
}
