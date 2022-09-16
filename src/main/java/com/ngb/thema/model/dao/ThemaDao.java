package com.ngb.thema.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ngb.thema.model.vo.Thema;

import common.JDBCTemplate;

public class ThemaDao {

	//관리자-테마 등록
	public int insertThema(Connection conn, Thema t) {
		PreparedStatement pstmt = null;
		String query = "insert into thema values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, t.getThemaCode());
			pstmt.setString(2,t.getCategory());
			pstmt.setString(3, t.getThemaName());
			pstmt.setString(4, t.getThemaContent());
			pstmt.setInt(5, t.getDevicePer());
			pstmt.setInt(6,t.getLockPer());
			pstmt.setInt(7,t.getPeopleMin());
			pstmt.setInt(8,t.getPeopleMax());
			pstmt.setInt(9,t.getThemaLevel());
			pstmt.setInt(10,t.getThemaPrice());
			pstmt.setString(11, t.getThemaFilepath());
			pstmt.setInt(12, t.getThemaTime());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//관리자 - 테마 조회
	public ArrayList<Thema> selectAllThema(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Thema> list = new ArrayList<Thema>();
		String query = "select * from thema";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Thema t  = new Thema();
				t.setThemaCode(rset.getString("thema_code"));
				t.setCategory(rset.getString("category"));
				t.setThemaName(rset.getString("thema_name"));
				t.setThemaPrice(rset.getInt("thema_price"));
				t.setThemaTime(rset.getInt("thema_time"));
				t.setDevicePer(rset.getInt("device_per"));
				t.setLockPer(rset.getInt("lock_per"));
				t.setPeopleMin(rset.getInt("people_min"));
				t.setPeopleMax(rset.getInt("people_max"));
				t.setThemaLevel(rset.getInt("thema_level"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
