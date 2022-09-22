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

	//테마 삭제
	public Thema deleteThema(String themaCode) {
		Connection conn = JDBCTemplate.getConnection();
		Thema t = dao.selectOneThema(conn, themaCode);
		int result = dao.deleteThema(conn,themaCode);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			t=null;
		}
		JDBCTemplate.close(conn);
		return t;
	}

	//테마 가져오기
	public Thema getThema(String themaCode) {
		Connection conn = JDBCTemplate.getConnection();
		Thema t = dao.selectOneThema(conn, themaCode);
		JDBCTemplate.close(conn);
		return t;
	}

	//테마 수정
	public int updateThema(Thema t) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateThema(conn,t);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	//셀렉박스로 선택한 테마 조회
	public ArrayList<Thema> selectThema(int level, String category) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Thema> list = dao.selectThema(conn, level, category);
		JDBCTemplate.close(conn);
		return list;
	}

	//셀렉박스로 선택한 테마 조회-테마가 전체일 때
	public ArrayList<Thema> selectThema1(int level) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Thema> list = dao.selectThema(conn, level);
		JDBCTemplate.close(conn);
		return list;
	}

	//셀렉박스로 선택한 테마 조회-난이도가 전체일 때
	public ArrayList<Thema> selectThema2(String category) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Thema> list = dao.selectThema(conn, category);
		JDBCTemplate.close(conn);
		return list;
	}








}
