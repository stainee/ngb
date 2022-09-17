package com.ngb.reserve.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ngb.reserve.model.vo.Reserve;
import com.ngb.thema.model.vo.Thema;

import common.JDBCTemplate;

public class ReserveDao {

	public ArrayList<Reserve> selectAllReserve(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		String query = "select * from (select * from reserve join (select Time_code,time from time) using (time_code)) join thema using(thema_code)";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reserve r = new Reserve();
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setThemaCode(rset.getString("thema_code"));
				r.setReserveName(rset.getString("reserve_name"));
				r.setReservephone(rset.getString("reserve_phone"));
				r.setReserveAmount(rset.getInt("reserve_amount"));
				r.setReservePay(rset.getInt("reserve_pay"));
				r.setReserveDate(rset.getString("reserve_date"));
				r.setPlayDate(rset.getString("play_date"));
				r.setTime(rset.getString("time"));
				r.setPeopleMax(rset.getInt("people_max"));
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int updateReserve(Connection conn, Reserve r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update reserve set reserve_name = ?, reserve_phone = ?, reserve_amount = ? where reserve_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getReserveName());
			pstmt.setString(2, r.getReservephone());
			pstmt.setInt(3, r.getReserveAmount());
			pstmt.setInt(4, r.getReserveNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Reserve> selectReserveDate(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reserve> dateList = new ArrayList<Reserve>();
		
		String query = "select distinct to_char(play_date, 'yy/mm/dd')날짜 from reserve order by 1 asc";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reserve r = new Reserve();
				r.setPlayDate(rset.getString("날짜"));
				dateList.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return dateList;
	}

}


























