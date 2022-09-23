package com.ngb.thema.model.vo;

public class ThemaTime {
	private String themaCode;
	private String themaName;
	private int timeCode;
	private String time;
	public ThemaTime() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThemaTime(String themaCode, String themaName, int timeCode, String time) {
		super();
		this.themaCode = themaCode;
		this.themaName = themaName;
		this.timeCode = timeCode;
		this.time = time;
	}
	public String getThemaCode() {
		return themaCode;
	}
	public void setThemaCode(String themaCode) {
		this.themaCode = themaCode;
	}
	public String getThemaName() {
		return themaName;
	}
	public void setThemaName(String themaName) {
		this.themaName = themaName;
	}
	public int getTimeCode() {
		return timeCode;
	}
	public void setTimeCode(int timeCode) {
		this.timeCode = timeCode;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
