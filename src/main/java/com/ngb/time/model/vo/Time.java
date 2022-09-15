package com.ngb.time.model.vo;

import java.sql.Date;

public class Time {
	private int timeCode;
	private String themaCode;
	private String time;
	public Time() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Time(int timeCode, String themaCode, String time) {
		super();
		this.timeCode = timeCode;
		this.themaCode = themaCode;
		this.time = time;
	}
	
}
