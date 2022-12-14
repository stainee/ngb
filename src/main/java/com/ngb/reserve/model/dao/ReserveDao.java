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
		String query = "SELECT";
		query += " RESERVE_NO,";
		query += " B.THEMA_CODE,";
		query += " B.THEMA_NAME,";
		query += " B.PEOPLE_MAX,";
		query += " B.THEMA_PRICE,";
		query += " CASE WHEN C.RESERVE_NAME IS NULL THEN '-' ELSE TO_CHAR(C.RESERVE_NAME) END AS RESERVE_NAME,";
		query += " CASE WHEN C.RESERVE_PHONE IS NULL THEN '-' ELSE TO_CHAR(C.RESERVE_PHONE) END AS RESERVE_PHONE,";
		query += " CASE WHEN C.RESERVE_AMOUNT IS NULL THEN '0' ELSE TO_CHAR(C.RESERVE_AMOUNT) END AS RESERVE_AMOUNT,";
		query += " CASE WHEN C.RESERVE_PAY IS NULL THEN '-' ELSE TO_CHAR(C.RESERVE_PAY) END AS RESERVE_PAY,";
		query += " CASE WHEN C.RESERVE_DATE IS NULL THEN '-' ELSE TO_CHAR(C.RESERVE_DATE,'YY-MM-DD HH24:SS') END AS RESERVE_DATE,";
		query += " C.RESERVE_DATE,";
		query += " C.PLAY_DATE,";
		query += " A.TIME_CODE,";
		query += " A.TIME";
		query += " FROM";
		query += " TIME A"; 
		query += " INNER JOIN THEMA B ON (A.THEMA_CODE = B.THEMA_CODE)";
		query += " LEFT OUTER JOIN RESERVE C ON (C.THEMA_CODE = A.THEMA_CODE AND C.TIME_CODE = A.TIME_CODE AND TO_CHAR(C.PLAY_DATE,'YY-MM-DD') = ?)";
		query += " ORDER BY THEMA_CODE,A.TIME";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, strDate);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReserveMngr r = new ReserveMngr();
				r.setThemaPrice(rset.getInt("thema_price"));
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
				r.setPeopleMax(rset.getString("people_max"));
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
				result.setPeopleMax(rset.getString("people_max"));
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

	public ArrayList<Thema> themaTable(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Thema> themaTable = new ArrayList<Thema>();
		
		String query = "select thema_code, thema_name from thema";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Thema t = new Thema();
				t.setThemaCode(rset.getString("thema_code"));
				t.setThemaName(rset.getString("thema_name"));
				themaTable.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return themaTable;
	}

	public Reserve selectOneReserve(Connection conn, String themaCode, int timeCode, String playDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from reserve where thema_code=? and time_code=? and to_char(play_date, 'yy-mm-dd')=?";
		Reserve r = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, themaCode);
			pstmt.setInt(2, timeCode);
			pstmt.setString(3, playDate);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Reserve();
				r.setReserveNo(rset.getInt("reserve_no"));
				r.setThemaCode(rset.getString("thema_code"));
				r.setReserveName(rset.getString("reserve_name"));
				r.setReservePhone(rset.getString("reserve_phone"));
				r.setReserveAmount(rset.getInt("reserve_amount"));
				r.setReservePay(rset.getInt("reserve_pay"));
				r.setReserveDate(rset.getString("reserve_date"));
				r.setPlayDate(rset.getString("play_date"));
				//???????????? themaName ?????????????????????
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
	
	public int insertReserve(Connection conn, Reserve r) {
		PreparedStatement pstmt = null;
		Reserve result = new Reserve();
		int resultSet = 0;
		String query = "insert into reserve values(reserve_seq.nextval, ?, sysdate, ?, ?, ?, ?, ?, null, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getThemaCode());
			pstmt.setInt(2, r.getReservePay());
			pstmt.setString(3, r.getReserveName());
			pstmt.setString(4, r.getReserveMail());
			pstmt.setString(5, r.getReservePhone());
			pstmt.setInt(6, r.getReserveAmount());
			pstmt.setString(7, r.getPlayDate());
			pstmt.setInt(8, r.getTimeCode());
			
			resultSet = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return resultSet;
	}
	
	public Reserve findReserve(Connection conn, Reserve reserve) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reserve reser = null;
		String query ="select reserve_no,to_char(play_date,'yymmdd') as playdate ,reserve_pay,reserve_name,reserve_mail,reserve_phone,reserve_amount,thema_name,time from (reserve join (select Time_code,time from time) using (time_code))join (select thema_code,thema_name from thema) using (thema_code) where reserve_no=? and reserve_name=?";

		try {
			pstmt = conn.prepareStatement(query);
			//pstmt.setString(1, reserve.getReserveName());
			pstmt.setInt(1, reserve.getReserveNo());
			//pstmt.setString(2, reserve.getReserveMail());
			pstmt.setString(2, reserve.getReserveName());
								//??????????????? reserve?????? ?????? ???????????? ????????????
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				//????????? ????????? ??? ?????????
				reser = new Reserve();
				
				reser.setReserveAmount(rset.getInt("reserve_amount"));
				reser.setPlayDate(rset.getString("playdate"));
				//???????????? ??????
				reser.setReserveMail(rset.getString("reserve_mail"));
				reser.setReserveName(rset.getString("reserve_name"));
				reser.setReserveNo(rset.getInt("reserve_no"));
				reser.setReservePay(rset.getInt("reserve_pay"));
				reser.setReservePhone(rset.getString("reserve_phone"));
				reser.setThemaName(rset.getString("thema_name"));
				reser.setTime(rset.getString("time"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return reser;
	}

	public ArrayList<ReserveMngr> emptyReserveInfo(Connection conn, ReserveMngr rm) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReserveMngr> resultList = new ArrayList<ReserveMngr>();
		resultList.add(rm);
		String query = "";
		
		return null;
	}

	public int insertReserveMngr(Connection conn, ReserveMngr rm) {
		PreparedStatement pstmt = null;
		Reserve result = new Reserve();
		int resultSet = 0;
		int reservePay = Integer.parseInt(rm.getReserveAmount())*rm.getThemaPrice();
		String query = "insert into reserve values(reserve_seq.nextval, ?, sysdate, ?, ?, ?, ?, ?, null, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rm.getThemaCode());
			pstmt.setInt(2, reservePay);
			pstmt.setString(3, rm.getReserveName());
			pstmt.setString(4, rm.getReserveMail());
			pstmt.setString(5, rm.getReservePhone());
			pstmt.setString(6, rm.getReserveAmount());
			pstmt.setString(7, rm.getPlayDate());
			pstmt.setString(8, rm.getTimeCode());
			
			resultSet = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return resultSet;
	}

	public int deleteReserveMngr(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM RESERVE WHERE RESERVE_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int deleteReserve(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "delete from reserve where reserve_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,reserveNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	

	public int selectCurrReserve(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select max(reserve_no) as curr from reserve";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("curr");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
}


























