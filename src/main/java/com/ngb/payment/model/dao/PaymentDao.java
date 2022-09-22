package com.ngb.payment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ngb.payment.model.vo.Payment;

import common.JDBCTemplate;

public class PaymentDao {

	//예약번호, 가격, tid를 입력받아 저장
	public int insertPayment(Connection conn, int reserveNo, int price, String tid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into payment values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			pstmt.setString(2,  tid);
			pstmt.setInt(3, price);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//예약번호를 받아 결제정보를 서칭
	public Payment searchPayment(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Payment p = null;
		String query = "select * from payment where reserve_no=?";
		try {
			p = new Payment();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p.setReserveNo(rset.getInt("reserve_no"));
				p.setTid(rset.getString("tid"));
				p.setPrice(rset.getInt("price"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return p;
	}

	//결제 정보 삭제
	public int deletePayment(Connection conn, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from payment where reserve_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
