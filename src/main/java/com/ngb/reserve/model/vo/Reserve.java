package com.ngb.reserve.model.vo;

import java.sql.Date;

public class Reserve {
	private int reserveNo;
	private String themaCode;
	private String themaName;
	private String reserveDate;
	private int reservePay;
	private String reserveName;
	private String reserveMail;
	private String reservephone;
	private int reserveAmount;
	private int reserveState;
	private String reserveEtc;
	private String playDate;
	private String time;
	private String timeCode;
	private int peopleMin;
	private int peopleMax;
	
	public Reserve() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reserve(int reserveNo, String themaCode, String reserveDate, int reservePay, String reserveName,
			String reserveMail, String reservephone, int reserveAmount, int reserveState, String reserveEtc,
			String playDate, String time, int time_code) {
		super();
		this.reserveNo = reserveNo;
		this.themaCode = themaCode;
		this.reserveDate = reserveDate;
		this.reservePay = reservePay;
		this.reserveName = reserveName;
		this.reserveMail = reserveMail;
		this.reservephone = reservephone;
		this.reserveAmount = reserveAmount;
		this.reserveState = reserveState;
		this.reserveEtc = reserveEtc;
		this.playDate = playDate;
		this.time = time;
		this.timeCode = timeCode;
	}
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public String getThemaCode() {
		return themaCode;
	}
	public void setThemaCode(String themaCode) {
		this.themaCode = themaCode;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public int getReservePay() {
		return reservePay;
	}
	public void setReservePay(int reservePay) {
		this.reservePay = reservePay;
	}
	public String getReserveName() {
		return reserveName;
	}
	public void setReserveName(String reserveName) {
		this.reserveName = reserveName;
	}
	public String getReserveMail() {
		return reserveMail;
	}
	public void setReserveMail(String reserveMail) {
		this.reserveMail = reserveMail;
	}
	public String getReservephone() {
		return reservephone;
	}
	public void setReservephone(String reservephone) {
		this.reservephone = reservephone;
	}
	public int getReserveAmount() {
		return reserveAmount;
	}
	public void setReserveAmount(int reserveAmount) {
		this.reserveAmount = reserveAmount;
	}
	public int getReserveState() {
		return reserveState;
	}
	public void setReserveState(int reserveState) {
		this.reserveState = reserveState;
	}
	public String getReserveEtc() {
		return reserveEtc;
	}
	public void setReserveEtc(String reserveEtc) {
		this.reserveEtc = reserveEtc;
	}
	public String getPlayDate() {
		return playDate;
	}
	public void setPlayDate(String playDate) {
		this.playDate = playDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTimeCode() {
		return timeCode;
	}
	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
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
	
	public String getThemaName() {
		return themaName;
	}
	public void setThemaName(String themaName) {
		this.themaName = themaName;
	}

	
	@Override
	public String toString() {
		return "Reserve [reserveNo=" + reserveNo + ", themaCode=" + themaCode + ", reserveDate=" + reserveDate
				+ ", reservePay=" + reservePay + ", reserveName=" + reserveName + ", reserveMail=" + reserveMail
				+ ", reservephone=" + reservephone + ", reserveAmount=" + reserveAmount + ", reserveState="
				+ reserveState + ", reserveEtc=" + reserveEtc + ", playDate=" + playDate + ", time=" + time
				+ ", time_code=" + timeCode + ", peopleMin=" + peopleMin + ", peopleMax=" + peopleMax + "]";
	}
	
	
	
}
