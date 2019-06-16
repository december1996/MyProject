package cn.bean;

import java.util.Date;

public class Accessory {
	private String id;
	private String equipment;
	private String variety;
	private String period;
	private Date lastTime;
	private String state;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getVariety() {
		return variety;
	}
	public void setVariety(String variety) {
		this.variety = variety;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public Date getLastTime() {
		return lastTime;
	}
	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Accessory [id=" + id + ", equipment=" + equipment + ", variety=" + variety + ", period=" + period
				+ ", lastTime=" + lastTime + ", state=" + state + "]";
	}
	
}
