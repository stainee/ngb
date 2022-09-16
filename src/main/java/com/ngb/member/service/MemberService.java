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
}
