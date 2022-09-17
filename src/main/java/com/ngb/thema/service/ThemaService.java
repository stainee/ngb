package com.ngb.thema.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ngb.thema.model.dao.ThemaDao;
import com.ngb.thema.model.vo.Thema;

import common.JDBCTemplate;

public class ThemaService {

	private ThemaDao dao;
	
	
	public ThemaService() {
		super();
		dao = new ThemaDao();
	}


	//테마 추가
	public int insertThema(Thema t) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertThema(conn,t);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	//관리자 테마 조회
	public ArrayList<Thema> selectAllThema() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Thema> list = dao.selectAllThema(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	//테마 상세 보기
	public Thema selectOneThema(String themaCode) {
		Connection conn = JDBCTemplate.getConnection();
		Thema t = dao.selectOneThema(conn,themaCode);
		JDBCTemplate.close(conn);
		return t;
	}




}
