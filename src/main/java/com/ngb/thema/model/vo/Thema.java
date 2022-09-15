package com.ngb.thema.model.vo;

public class Thema {
	private String themaCode;
	private String category;
	private String themaName;
	private String themaContent;
	private int devicePer;
	private int lockPer;
	private int peopleMin;
	private int peopleMax;
	private int themaLevel;
	private int themaPrice;
	private String themaFilepath;
	
	public Thema() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Thema(String themaCode, String category, String themaName, String themaContent, int devicePer, int lockPer,
			int peopleMin, int peopleMax, int themaLevel, int themaPrice, String themaFilepath) {
		super();
		this.themaCode = themaCode;
		this.category = category;
		this.themaName = themaName;
		this.themaContent = themaContent;
		this.devicePer = devicePer;
		this.lockPer = lockPer;
		this.peopleMin = peopleMin;
		this.peopleMax = peopleMax;
		this.themaLevel = themaLevel;
		this.themaPrice = themaPrice;
		this.themaFilepath = themaFilepath;
	}
	public String getThemaCode() {
		return themaCode;
	}
	public void setThemaCode(String themaCode) {
		this.themaCode = themaCode;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getThemaName() {
		return themaName;
	}
	public void setThemaName(String themaName) {
		this.themaName = themaName;
	}
	public String getThemaContent() {
		return themaContent;
	}
	public void setThemaContent(String themaContent) {
		this.themaContent = themaContent;
	}
	public int getDevicePer() {
		return devicePer;
	}
	public void setDevicePer(int devicePer) {
		this.devicePer = devicePer;
	}
	public int getLockPer() {
		return lockPer;
	}
	public void setLockPer(int lockPer) {
		this.lockPer = lockPer;
	}
	public int getPeopleMin() {
		return peopleMin;
	}
	public void setPeopleMin(int peopleMin) {
		this.peopleMin = peopleMin;
	}
	public int getPeopleMax() {
		return peopleMax;
	}
	public void setPeopleMax(int peopleMax) {
		this.peopleMax = peopleMax;
	}
	public int getThemaLevel() {
		return themaLevel;
	}
	public void setThemaLevel(int themaLevel) {
		this.themaLevel = themaLevel;
	}
	public int getThemaPrice() {
		return themaPrice;
	}
	public void setThemaPrice(int themaPrice) {
		this.themaPrice = themaPrice;
	}
	public String getThemaFilepath() {
		return themaFilepath;
	}
	public void setThemaFilepath(String themaFilepath) {
		this.themaFilepath = themaFilepath;
	}
	
	
}
