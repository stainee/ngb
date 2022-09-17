package com.ngb.reserve.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ngb.reserve.model.dao.ReserveDao;
import com.ngb.reserve.model.vo.Reserve;
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

}
