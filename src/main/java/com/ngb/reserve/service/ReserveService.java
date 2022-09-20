package com.ngb.reserve.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ngb.reserve.model.dao.ReserveDao;
import com.ngb.reserve.model.vo.Reserve;
import com.ngb.reserve.model.vo.ReserveMngr;
import com.ngb.thema.model.vo.Thema;

import common.JDBCTemplate;

public class ReserveService {
	private ReserveDao dao;

	public ReserveService() {
		super();
		dao = new ReserveDao();
//		this.dao = dao;
	}

	public ArrayList<Reserve> selectAllReserve() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reserve> list = dao.selectAllReserve(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int updateReserve(Reserve r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateReserve(conn,r);
		if(result > 0) {
			JDBCTemplate.commit(conn);
			JDBCTemplate.close(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public ArrayList<Reserve> selectReserveDate() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reserve> dateList = dao.selectReserveDate(conn);
		JDBCTemplate.close(conn);
		
		return dateList;
	}

	public ArrayList<ReserveMngr> selectDateReserveInfo(String strDate) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<ReserveMngr> selectList = dao.selectDateReserveInfo(conn, strDate);
		JDBCTemplate.close(conn);
		return selectList;
	}

	public ReserveMngr selectReserveEdit(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		ReserveMngr result = dao.selectReserveEdit(conn, reserveNo);
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Thema> timeTable() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Thema> timeTable = dao.timeTable(conn);
		return timeTable;
	}

	public Reserve searchOneReserve(String themaCode, int timeCode, String playDate) {
		Connection conn = JDBCTemplate.getConnection();
		Reserve reserve = dao.selectOneReserve(conn,themaCode, timeCode, playDate);
		JDBCTemplate.close(conn);
		return reserve;
	}

	public int insertReserve(Reserve r) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertReserve(conn,r);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	

	public Reserve findReserve(Reserve reserve) {
		Connection conn = JDBCTemplate.getConnection();
		Reserve reser = dao.findReserve(conn,reserve);
		JDBCTemplate.close(conn);
		
		return reser;
	}

}
