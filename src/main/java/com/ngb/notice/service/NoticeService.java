package com.ngb.notice.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ngb.notice.vo.Notice;
import com.ngb.notice.vo.NoticePageData;
import com.ngb.noticel.dao.NoticeDao;

import common.JDBCTemplate;

public class NoticeService {
	private NoticeDao dao;

	public NoticeService() {
		super();
		dao = new NoticeDao();
	}

	public NoticePageData selectNoticeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		//한페이지 게시물 10
		int numPerPage = 10;
		//끝은 한페이지 게시물*현재 몇페이지인지
		//시작은 끝 - 한페이지게시물+1
		int end = numPerPage*reqPage;
		int start = end - numPerPage + 1;
		ArrayList<Notice> list = dao.selectNoticeList(conn,start,end);
		
		//페이징처리
		//전체페이지 수 계산 -> 전체 게시물 수를 조회
		int totalCount = dao.selectNoticeCount(conn);
		//전체 페이지
		int totalPage = 0;
		
		//전체게시물 을 한페이지 단위로 나눠서 0이면
		//그것이 페이지 갯수
		//나머지 값이 0이 아니면 그 페이지 갯수+1
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		//네비게이션을 몇개를 보이게 할것인지 지정
		int pageNaviSize = 5;
		
		//페이지 네비게이션 시작번호 지정
		//reqPage 1~5 -> 1부터 시작해서 5개
		//reqPage 6~10-> 6부터 5개
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			
			pageNavi += "</a></li>";
		}
		//페이지 숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/noticeList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}

		
		// +=을 안하면 위에서 아무리 로직을 돌려도 pageNavi에 저장을 하지않기 때문에
		// 하단버튼이 생성되지 않는다.]
		// pageNavi = "</ul>"; 로 하면 그냥 ul로 대체될뿐이다.
		pageNavi += "</ul>";
		NoticePageData npd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
				
		return npd;
	}

	public Notice selectOntNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateReadCount(conn,noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
			Notice n = dao.selectOneNotice(conn,noticeNo);
			//공지사항 상세내용조회 후에 해당 공지사항에 작성된 댓글도 모두 조회
			//1. 일반댓글 조회
			JDBCTemplate.close(conn);
			return n;
		}else {
			JDBCTemplate.rollback(conn);
			JDBCTemplate.close(conn);
			return null;
		}
	
	}
	
}
