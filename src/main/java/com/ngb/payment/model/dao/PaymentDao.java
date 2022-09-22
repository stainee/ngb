package com.ngb.payment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ngb.reserve.model.vo.Reserve;

import common.JDBCTemplate;

public class PaymentDao {

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

}
