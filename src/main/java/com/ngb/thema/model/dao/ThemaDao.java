package com.ngb.thema.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import com.ngb.thema.model.vo.Thema;
import com.ngb.thema.model.vo.ThemaTime;
import com.ngb.thema.model.vo.ThemaTimeManage;

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
		String query = "select * from thema order by 1";
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


	public ArrayList<ThemaTimeManage> selectAllThemaList(Connection conn) {
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    ArrayList<ThemaTimeManage> themaList = new ArrayList<ThemaTimeManage>();
	    String query = "select a.thema_name, a.thema_code, b.time_code, b.time from thema a left join time b on(a.thema_code = b.thema_code) order by 2,4";

	    try {
	    	pstmt = conn.prepareStatement(query);
	         rset = pstmt.executeQuery();
	         while (rset.next()) {
	            ThemaTimeManage t = new ThemaTimeManage();
	            t.setThemaCode(rset.getString("thema_code"));
	            t.setThemaName(rset.getString("thema_name"));
	            t.setTimeCode(rset.getString("time_code"));
	            t.setTime(rset.getString("time"));
	            themaList.add(t);
	         }

	     } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	     } finally {
	         JDBCTemplate.close(pstmt);
	         JDBCTemplate.close(rset);
	      }
	      return themaList;

	}

	public int addThemaTime(Connection conn, ThemaTime tt) {
		PreparedStatement pstmt = null;
		ArrayList<String> ttList = new ArrayList<String>();
		
		
		ttList.add(tt.getTime1());
		ttList.add(tt.getTime2());
		ttList.add(tt.getTime3());
		ttList.add(tt.getTime4());
		ttList.add(tt.getTime5());
		ttList.add(tt.getTime6());
		ttList.add(tt.getTime7());
		ttList.add(tt.getTime8());
		ttList.add(tt.getTime9());
		ttList.add(tt.getTime10());
		
		System.out.println("안녕하세요"+ttList);
		
		int result = 0;
		String query = "insert into time values(time_seq.nextval, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			for(int i = 0;i<ttList.size();i++) {
				if(ttList.get(i) == "") {
					ttList.remove(i);
					result++;
				}
			}
			for(int i = 0;i<ttList.size();i++) {
			if(ttList.get(i)!="") {
				int rtest = 0;
				pstmt.setString(1, tt.getThemaCode());
				pstmt.setString(2, ttList.get(i));
				rtest = pstmt.executeUpdate();
				result += rtest;
			}else{
				result++;
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public ArrayList<ThemaTimeManage> getThemaTime(Connection conn, String themaCode) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ArrayList<ThemaTimeManage> list = new ArrayList<ThemaTimeManage>();
		System.out.println(list.size());
		String query = "select thema_code,time from time where thema_code = ? order by 2";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,themaCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ThemaTimeManage t = new ThemaTimeManage();
				t.setTime(rset.getString("time"));
				list.add(t); //5
			}
			if(list.size() < 10) {
				for(int i=list.size();i<10;i++) {
					ThemaTimeManage t = new ThemaTimeManage();
					t.setTime("");
					list.add(t);					
				}
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

	public int deleteThamaTime(Connection conn, String tmCode) {
		PreparedStatement pstmt = null;
		System.out.println("tmCode넘어오는지확인"+tmCode);
		int result = 0;
		String query = "delete from time where thema_code = ?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, tmCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}






}
