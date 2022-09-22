package com.ngb.payment.model.vo;

public class Payment {
	private int reserveNo;
	private String tid;
	private int price;
	
	
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Payment(int reserveNo, String tid, int price) {
		super();
		this.reserveNo = reserveNo;
		this.tid = tid;
		this.price = price;
	}
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
