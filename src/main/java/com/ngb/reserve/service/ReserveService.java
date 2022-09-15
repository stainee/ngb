package com.ngb.reserve.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ngb.reserve.model.dao.ReserveDao;
import com.ngb.reserve.model.vo.Reserve;

import common.JDBCTemplate;

public class ReserveService {
	private ReserveDao dao;

	public ReserveService(ReserveDao dao) {
		super();
		this.dao = dao;
	}

	
}
