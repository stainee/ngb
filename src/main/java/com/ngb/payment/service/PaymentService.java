package com.ngb.payment.service;

import java.sql.Connection;

import com.ngb.payment.model.dao.PaymentDao;
import com.ngb.reserve.model.dao.ReserveDao;

import common.JDBCTemplate;

public class PaymentService {
	private PaymentDao dao;
	private ReserveDao rdao;

	public PaymentService() {
		super();
		dao = new PaymentDao();
		rdao = new ReserveDao();
	}

	public int insertPayment(int price, String tid) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		int reserveNo = rdao.selectCurrReserve(conn);
		if(reserveNo == 0) {//가져오지 못함
			JDBCTemplate.rollback(conn);
		}else {
			result = dao.insertPayment(conn, reserveNo, price, tid);
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}
		return result;
	}

	
	
}
