package com.ngb.time.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ngb.time.model.dao.TimeDao;
import com.ngb.time.model.vo.Time;

import common.JDBCTemplate;

public class TimeService {
	private TimeDao dao;

	public TimeService() {
		super();
		dao = new TimeDao();
	}
	//테마코드로 테마 시간 조회
	public ArrayList<Time> getThemaTimeList(String themaCode) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Time> list = dao.selectAllThemaTime(conn, themaCode);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Time> getReserveList(String themaCode, String date) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Time> list = dao.selectAllReserveTime(conn, themaCode, date);
		JDBCTemplate.close(conn);

		return list;
	}
	
}
