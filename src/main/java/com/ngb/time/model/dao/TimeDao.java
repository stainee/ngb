package com.ngb.time.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ngb.time.model.vo.Time;

import common.JDBCTemplate;

public class TimeDao {

	
	public ArrayList<Time> selectAllThemaTime(Connection conn, String themaCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Time> list = new ArrayList<Time>();
		String query = "select time,time_code from thema left join time using (thema_code) where thema_code= ? order by time_code asc";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, themaCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Time t = new Time();
				t.setTime(rset.getString("time"));
				t.setTimeCode(rset.getInt("time_code"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Time> selectAllReserveTime(Connection conn, String themaCode, String date) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Time> list = new ArrayList<Time>();
		String query = "select time, r.time_code from reserve r left join time t using (thema_code) "
				+ "where thema_code= ? and to_char(play_date, 'yy-mm-dd') = ? and t.time_code=r.time_code";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, themaCode);
			pstmt.setString(2, date);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Time t = new Time();
				t.setTime(rset.getString("time"));
				t.setTimeCode(rset.getInt("time_code"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
