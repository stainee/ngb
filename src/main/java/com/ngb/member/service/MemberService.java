package com.ngb.member.service;

import java.sql.Connection;

import com.ngb.member.dao.MemberDao;
import com.ngb.member.model.vo.Member;

import common.JDBCTemplate;

public class MemberService {
	private MemberDao dao;
	
	public MemberService() {
		super();
		dao = new MemberDao();
		// TODO Auto-generated constructor stub
	}

	public Member selectOneMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = dao.selectOneMember(conn , member);
		JDBCTemplate.close(conn);
		return m;
	}

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = dao.selectOneMember(conn , memberId);
		JDBCTemplate.close(conn);
		return m;
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertMember(conn,m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public String sendMail(String email) {
		// TODO Auto-generated method stub
		String result = dao.sendMail(email);
		return result;
	}
}
