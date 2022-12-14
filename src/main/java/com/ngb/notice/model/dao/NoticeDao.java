package com.ngb.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ngb.notice.model.vo.Notice;

import common.JDBCTemplate;

public class NoticeDao {

	public ArrayList<Notice> selectNoticeList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		String query ="select * from (select rownum as rnum, n.* from (SELECT * FROM NOTICE order by notice_no desc)n)where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setRegDate(rset.getString("reg_date"));
				n.setReadCount(rset.getInt("read_count"));
				n.setNoticeFilepath(rset.getString("notice_filepath"));
				list.add(n);
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

	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		//별칭을 지정해서
		//아래에서 별칭을 이용해서 받는다
		
		//게시물이 총 몇개인지 알수있는 쿼리
		String query = "select count(*) as cnt from notice";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				//얻은 총 갯수를 totalCount에 저장
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

	public int updateReadCount(Connection conn, int noticeNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update notice set read_count = read_count+1 where notice_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Notice selectOneNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		String query = "select * from notice where notice_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setRegDate(rset.getString("reg_date"));
				n.setReadCount(rset.getInt("read_count"));
				n.setNoticeFilepath(rset.getString("notice_filepath"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return n;
	}

	public int insertNotice(Connection conn, Notice n) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,0,null)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeWriter());
			pstmt.setString(3, n.getNoticeContent());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}			
		return result;
	}

	public int updateNotice(Connection conn, Notice n) {
		// TODO Auto-generated method stub
				PreparedStatement pstmt = null;
				int result = 0;
				String query = "update notice set notice_title=?, notice_content=? where notice_no=?";
				
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, n.getNoticeTitle());
					pstmt.setString(2, n.getNoticeContent());
					pstmt.setInt(3, n.getNoticeNo());
					result = pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					JDBCTemplate.close(pstmt);
				}
				return result;
	}

	public int deleteNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from notice where notice_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> selectNoticeList(Connection conn, String notice_title, String searchInput, int start,
			int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		String query ="select * from (select rownum as searchnum,n.* from(select * from (select rownum as rnum, n.* from (SELECT * FROM NOTICE order by notice_no desc)n)where "+notice_title+" like ?)n)where searchnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+searchInput+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeWriter(rset.getString("notice_writer"));
				n.setNoticeContent(rset.getString("notice_content"));
				n.setRegDate(rset.getString("reg_date"));
				n.setReadCount(rset.getInt("read_count"));
				n.setNoticeFilepath(rset.getString("notice_filepath"));
				list.add(n);
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

	public int selectNoticeCount(Connection conn, String notice_title, String searchInput) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		//별칭을 지정해서
		//아래에서 별칭을 이용해서 받는다
		
		//게시물이 총 몇개인지 알수있는 쿼리
		String query = "select count(*) as searchcnt from(select * from (select rownum as searchnum,n.* from(select * from (select rownum as rnum, n.* from (SELECT * FROM NOTICE order by notice_no desc)n)where "+notice_title+" like ?)n))";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+searchInput+"%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				//얻은 총 갯수를 totalCount에 저장
				totalCount = rset.getInt("searchcnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}

}
