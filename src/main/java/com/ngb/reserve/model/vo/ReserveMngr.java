package com.ngb.reserve.model.vo;

public class ReserveMngr {
	private int reserveNo;
	private String themaCode;
	private String themaName;
	private String reserveDate;
	private String reservePay;
	private String reserveName;
	private String reserveMail;
	private String reservePhone;
	private String reserveAmount;
	private String reserveState;
	private String reserveEtc;
	private String playDate;
	private String time;
	private String timeCode;
	private String peopleMax;
	private int themaPrice;
	

	public ReserveMngr() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReserveMngr(int reserveNo, String themaCode, String themaName, String reserveDate, String reservePay,
			String reserveName, String reserveMail, String reservePhone, String reserveAmount, String reserveState,
			String reserveEtc, String playDate, String time, String timeCode, String peopleMax) {
		super();
		this.reserveNo = reserveNo;
		this.themaCode = themaCode;
		this.themaName = themaName;
		this.reserveDate = reserveDate;
		this.reservePay = reservePay;
		this.reserveName = reserveName;
		this.reserveMail = reserveMail;
		this.reservePhone = reservePhone;
		this.reserveAmount = reserveAmount;
		this.reserveState = reserveState;
		this.reserveEtc = reserveEtc;
		this.playDate = playDate;
		this.time = time;
		this.timeCode = timeCode;
		this.peopleMax = peopleMax;
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
	public String getThemaName() {
		return themaName;
	}
	public void setThemaName(String themaName) {
		this.themaName = themaName;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public String getReservePay() {
		return reservePay;
	}
	public void setReservePay(String reservePay) {
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
	public String getReservePhone() {
		return reservePhone;
	}
	public void setReservePhone(String reservephone) {
		this.reservePhone = reservephone;
	}
	public String getReserveAmount() {
		return reserveAmount;
	}
	public void setReserveAmount(String reserveAmount) {
		this.reserveAmount = reserveAmount;
	}
	public String getReserveState() {
		return reserveState;
	}
	public void setReserveState(String reserveState) {
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
	
	public String getPeopleMax() {
		return peopleMax;
	}

	public void setPeopleMax(String peopleMax) {
		this.peopleMax = peopleMax;
	}
	public int getThemaPrice() {
		return themaPrice;
	}

	public void setThemaPrice(int themaPrice) {
		this.themaPrice = themaPrice;
	}

	@Override
	public String toString() {
		return "reserveMngr [reserveNo=" + reserveNo + ", themaCode=" + themaCode + ", themaName=" + themaName
				+ ", reserveDate=" + reserveDate + ", reservePay=" + reservePay + ", reserveName=" + reserveName
				+ ", reserveMail=" + reserveMail + ", reservephone=" + reservePhone + ", reserveAmount=" + reserveAmount
				+ ", reserveState=" + reserveState + ", reserveEtc=" + reserveEtc + ", playDate=" + playDate + ", time="
				+ time + ", timeCode=" + timeCode + ", peopleMax=" + peopleMax + "]";
	}

	
	
}
