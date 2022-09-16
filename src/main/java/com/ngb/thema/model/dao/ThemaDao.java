package com.ngb.thema.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ngb.thema.model.vo.Thema;

public class ThemaDao {

	public int insertThema(Connection conn, Thema t) {
		PreparedStatement pstmt = null;
		String query = "insert into thema values(?,?,?,?,?,?,?,?,?,?,?)";
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
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

}
