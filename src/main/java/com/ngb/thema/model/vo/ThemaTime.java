package com.ngb.thema.model.vo;

import java.util.ArrayList;

public class ThemaTime {
	private String themaCode;
	private String themaName;
	private ThemaTimeFrm timeList;
	public ThemaTime() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThemaTime(String themaCode, String themaName, ThemaTimeFrm timeList) {
		super();
		this.themaCode = themaCode;
		this.themaName = themaName;
		this.timeList = timeList;
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
	public ThemaTimeFrm getTimeList() {
		return timeList;
	}
	public void setTimeList(ThemaTimeFrm timeList) {
		this.timeList = timeList;
	}
	
}
