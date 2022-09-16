package com.ngb.thema.service;

import java.sql.Connection;

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

}
