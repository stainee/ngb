package com.ngb.reserve.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ngb.reserve.model.vo.Reserve;
import com.ngb.reserve.model.vo.ReserveMngr;
import com.ngb.thema.model.vo.Thema;

import common.JDBCTemplate;

public class ReserveDao {

	public ArrayList<Reserve> selectAllReserve(Connection conn) {
		PreparedStatement pstmt = null;
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
				r.setThemaName(rset.getString("thema_name"));
				r.setReserveName(rset.getString("reserve_name"));
				r.setReservePhone(rset.getString("reserve_phone"));
				r.setReserveAmount(rset.getInt("reserve_amount"));
				r.setReservePay(rset.getInt("reserve_pay"));
				r.setReserveDate(rset.getString("reserve_date"));
				r.setPlayDate(rset.getString("play_date"));
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
			pstmt.setString(2, r.getReservePhone());
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
		
		String query = "select to_char(sysdate,'yy-mm-dd') as date1, to_char(sysdate+1,'yy-mm-dd') as date2, to_char(sysdate+2,'yy-mm-dd') as date3, to_char(sysdate+3,'yy-mm-dd') as date4, to_char(sysdate+4,'yy-mm-dd') as date5, to_char(sysdate+5,'yy-mm-dd') as date6, to_char(sysdate+6,'yy-mm-dd')as date7 from dual";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
					Reserve r = new Reserve();
					r.setPlayDate(rset.getString("date1"));
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

	public ArrayList<ReserveMngr> selectDateReserveInfo(Connection conn, String strDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReserveMngr> selectList = new ArrayList<ReserveMngr>();
		String query = "";
		 query +=" SELECT * FROM"; 
		 query +=" (SELECT "; 
		 query +="     C.RESERVE_NO,";
		 query +="     A.THEMA_CODE,"; 
		 query +="     A.TIME_CODE,"; 
		 query +="     A.TIME,"; 
		 query +="     B.THEMA_NAME,"; 
		 query +="     C.RESERVE_NAME,"; 
		 query +="     C.RESERVE_PHONE,"; 
		 query +="     to_char(C.RESERVE_AMOUNT) ||'/'|| to_char(people_max) AS RESERVE_AMOUNT,"; 
		 query +="     to_char(C.RESERVE_PAY) AS RESERVE_PAY,"; 
		 query +="     to_char(C.RESERVE_DATE,'yy-mm-dd HH24:SS') AS RESERVE_DATE,"; 
		 query +="     to_char(C.PLAY_DATE) AS PLAY_DATE,"; 
		 query +="     '예약 불가' AS RESERVE_STATE"; 
		 query +="  FROM TIME A"; 
		 query +="  INNER JOIN THEMA B ON (A.THEMA_CODE = B.THEMA_CODE)"; 
		 query +="  LEFT OUTER JOIN RESERVE C ON (C.THEMA_CODE = C.THEMA_CODE AND A.TIME_CODE = C.TIME_CODE)"; 
		 query +="  WHERE TO_CHAR(C.PLAY_DATE,'yy-mm-dd') = ?"; 
		 query +="  "; 
		 query +="  union "; 
		 query +="  "; 
		 query +="  SELECT "; 
		 query +="     C.RESERVE_NO,";
		 query +="     A.THEMA_CODE,"; 
		 query +="     A.TIME_CODE,"; 
		 query +="     A.TIME,"; 
		 query +="     B.THEMA_NAME,"; 
		 query +="     '-' as RESERVE_NAME,"; 
		 query +="     '-' as RESERVE_PHONE,"; 
		 query +="     '-' as RESERVE_AMOUNT,"; 
		 query +="     '-' as RESERVE_PAY,"; 
		 query +="     '-' as RESERVE_DATE,"; 
		 query +="     '-' as PLAY_DATE,"; 
		 query +="     '예약가능' as RESERVE_STATE"; 
		 query +="  FROM TIME A"; 
		 query +="  INNER JOIN THEMA B ON (A.THEMA_CODE = B.THEMA_CODE)"; 
		 query +="  LEFT OUTER JOIN RESERVE C ON (C.THEMA_CODE = C.THEMA_CODE AND A.TIME_CODE = C.TIME_CODE)"; 
		 query +="  WHERE TO_CHAR(C.PLAY_DATE,'yy-mm-dd') <> ? or C.PLAY_DATE is null)";
		 query +="  order by 2, 4";
		try {
			pstmt = conn.prepareStatement(query);
			System.out.println(query);
			pstmt.setString(1, strDate);
			pstmt.setString(2, strDate);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReserveMngr r = new ReserveMngr();
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setThemaCode(rset.getString("thema_code"));
				r.setThemaName(rset.getString("thema_name"));
				r.setReserveName(rset.getString("reserve_name"));
				r.setReservePhone(rset.getString("reserve_phone"));
				r.setReserveAmount(rset.getString("reserve_amount"));
				r.setReservePay(rset.getString("reserve_pay"));
				r.setReserveDate(rset.getString("reserve_date"));
				r.setPlayDate(rset.getString("play_date"));
				r.setTimeCode(rset.getString("time_code"));
				r.setTime(rset.getString("time"));
				selectList.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return selectList;
	}

	public ReserveMngr selectReserveEdit(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReserveMngr result = new ReserveMngr();
		
		String query = "select * from (select * from reserve join (select Time_code,time from time) using (time_code)) join thema using(thema_code) where reserve_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				result.setReserveNo(rset.getInt("reserve_no"));
				result.setThemaCode(rset.getString("thema_code"));
				result.setThemaName(rset.getString("thema_name"));
				result.setReserveName(rset.getString("reserve_name"));
				result.setReservePhone(rset.getString("reserve_phone"));
				result.setReserveAmount(rset.getString("reserve_amount"));
				result.setReservePay(rset.getString("reserve_pay"));
				result.setReserveDate(rset.getString("reserve_date"));
				result.setPlayDate(rset.getString("play_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Thema> timeTable(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Thema> timeTable = new ArrayList<Thema>();
		
		String query = "select thema_code, thema_name,time_code, time from time join thema using(thema_code) order by 4";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Thema t = new Thema();
				t.setThemaCode(rset.getString("thema_code"));
				t.setThemaName(rset.getString("thema_name"));
				t.setTimeCode(rset.getString("time_code"));
				t.setTime(rset.getString("time"));
				timeTable.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return timeTable;
	}

	public Reserve selectOneReserve(Connection conn, String themaCode, int timeCode, String playDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from reserve where thema_code=? and time_code=? and to_char(play_date, 'yy-mm-dd')=?";
		Reserve r = new Reserve();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, themaCode);
			pstmt.setInt(2, timeCode);
			pstmt.setString(3, playDate);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setThemaCode(rset.getString("thema_code"));
				r.setReserveName(rset.getString("reserve_name"));
				r.setReservePhone(rset.getString("reserve_phone"));
				r.setReserveAmount(rset.getInt("reserve_amount"));
				r.setReservePay(rset.getInt("reserve_pay"));
				r.setReserveDate(rset.getString("reserve_date"));
				r.setPlayDate(rset.getString("play_date"));
				//때에따라 themaName 추가해야할수도
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}
}


























