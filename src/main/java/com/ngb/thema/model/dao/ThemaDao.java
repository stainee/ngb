package com.ngb.thema.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ngb.thema.model.vo.Thema;
import com.ngb.thema.model.vo.ThemaTime;

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
				t.setThemaFilepath(rset.getString("thema_filepath"));
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

	//관리자 - 테마 상세 보기
	public Thema selectOneThema(Connection conn, String themaCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Thema t  = null;
		String query = "select * from thema where thema_code=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,themaCode);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				t = new Thema();
				t.setThemaCode(rset.getString("thema_code"));
				t.setCategory(rset.getString("category"));
				t.setThemaName(rset.getString("thema_name"));
				t.setThemaContent(rset.getString("thema_content"));
				t.setDevicePer(rset.getInt("device_per"));
				t.setLockPer(rset.getInt("lock_per"));
				t.setPeopleMin(rset.getInt("people_min"));
				t.setPeopleMax(rset.getInt("people_max"));
				t.setThemaLevel(rset.getInt("thema_level"));
				t.setThemaPrice(rset.getInt("thema_price"));
				t.setThemaFilepath(rset.getString("thema_filepath"));
				t.setThemaTime(rset.getInt("thema_time"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return t;
	}

	//테마 삭제
	public int deleteThema(Connection conn, String themaCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from thema where thema_code=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, themaCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
				
		return result;
	}
	
	//테마 수정
	public int updateThema(Connection conn, Thema t) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update thema set category=?, thema_name=?, thema_time=?, thema_filepath=?, device_per=?,"
				+ "lock_per=?, people_min=?, people_max=?, thema_level=?, thema_price=?, thema_content=? where thema_code=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,t.getCategory());
			pstmt.setString(2, t.getThemaName());
			pstmt.setInt(3, t.getThemaTime());
			pstmt.setString(4, t.getThemaFilepath());
			pstmt.setInt(5, t.getDevicePer());
			pstmt.setInt(6, t.getLockPer());
			pstmt.setInt(7, t.getPeopleMin());
			pstmt.setInt(8, t.getPeopleMax());
			pstmt.setInt(9, t.getThemaLevel());
			pstmt.setInt(10, t.getThemaPrice());
			pstmt.setString(11,t.getThemaContent());
			pstmt.setString(12,t.getThemaCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//특정 조건으로 조회
	public ArrayList<Thema> selectThema(Connection conn, int level, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Thema> list = new ArrayList<Thema>();
		String query = "select * from thema where thema_level=? and category=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, level);
			pstmt.setString(2, category);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Thema t = new Thema();
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
				t.setThemaFilepath(rset.getString("thema_filepath"));
				t.setThemaContent(rset.getString("thema_content"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
	
	//셀렉박스로 선택한 테마 조회-테마가 전체일 때
	public ArrayList<Thema> selectThema(Connection conn, int level) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Thema> list = new ArrayList<Thema>();
		String query = "select * from thema where thema_level=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, level);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Thema t = new Thema();
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
				t.setThemaFilepath(rset.getString("thema_filepath"));
				t.setThemaContent(rset.getString("thema_content"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
	
	//셀렉박스로 선택한 테마 조회-난이도가 전체일 때
	public ArrayList<Thema> selectThema(Connection conn, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Thema> list = new ArrayList<Thema>();
		String query = "select * from thema where category=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Thema t = new Thema();
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
				t.setThemaFilepath(rset.getString("thema_filepath"));
				t.setThemaContent(rset.getString("thema_content"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public ArrayList<ThemaTime> selectAllTmt(Connection conn, ArrayList<Thema> tmCodeList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ThemaTime> tmt = new ArrayList<ThemaTime>();
		String query = "select a.thema_code, a.thema_name,b.time_code,b.time from thema a left join time b on(a.thema_code = b.thema_code) where a.thema_code=? order by 1,4";
		try {
			pstmt = conn.prepareStatement(query);
			for(int i=0;i<8;i++) {
				rset = pstmt.executeQuery();
//				pstmt.setString(1, list.get(i).thema_code);
				while(rset.next()) {
					
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}






}
