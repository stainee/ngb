package com.ngb.reserve.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ngb.reserve.model.vo.Reserve;

public class ReserveDao {

	public Reserve selectAllReserve(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		String query = "select * from reserve";
		
		
		return null;
	}

}
