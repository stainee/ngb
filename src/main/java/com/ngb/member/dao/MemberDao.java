package com.ngb.member.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.spi.DirStateFactory.Result;

import com.ngb.member.model.vo.Member;

import common.JDBCTemplate;

public class MemberDao {
	public Member selectOneMember(Connection conn, Member member) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_id= ? and member_pw = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberMail(rset.getString("member_mail"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	
	public Member selectOneMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberMail(rset.getString("member_mail"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return m;
	}
	
	public Member selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberMail(rset.getString("member_mail"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into member values(member_seq.nextval,?,?,?,?,?,1,SYSDATE)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberPhone());
			pstmt.setString(5, m.getMemberMail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public String sendMail(String email) {
		boolean result = false;
		//인증용 랜덤코드 생성
		Random r = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<8;i++) {
			//숫자,영어소문자,영어대문자 섞어서 8개 조합
			//0 : 0~9 , 1 : A-Z, 2 : a-z
			int flag = r.nextInt(3);
			if(flag == 0) {
				//0~9
				int randomNum = r.nextInt(10);
				//문자열로 추가
				sb.append(randomNum);
				
			}else if(flag == 1) {
				//A~Z 65번부터 시작임
				//알파벳 26자를 65번부터
				char randomChar = (char)(r.nextInt(26)+65);
				sb.append(randomChar);
			}else if(flag == 2) {
				char randomChar = (char)(r.nextInt(26)+97);
				sb.append(randomChar);
			}
		}
		
		Properties prop = System.getProperties();
//		prop.put("mail.smtp.host", "smtp.gmail.com");
//		prop.put("mail.smtp.port", 465);
//		prop.put("mail.smtp.auth", "true");
//		prop.put("mail.smtp.ssl.enable", "true");
//		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//		
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 587); //변경
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", true); //추가
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); //추가
		//prop.put("mail.smtp.ssl.enable", true);  // 주석
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		//인증정보설정(로그인 개념)
		Session session = Session.getDefaultInstance(prop, 
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						PasswordAuthentication pa = new PasswordAuthentication("dhfkdlspt","yudqqmwhadncepyf");
						return pa;
					}		
				}
		);
		//이메일을 작성해서 전송하는 객체
		MimeMessage msg = new MimeMessage(session);
		
		//이메일 작성
		
		try {
			//메일 전송 날짜 설정
			msg.setSentDate(new Date());
			
			//보내는 사람 정보
			msg.setFrom(new InternetAddress("dhfkdlspt@gamil.com","나가방"));
			
			//받는사람 정보
			//new InternetAddress(지정한 변수명으로);
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			//이메일 제목
			msg.setSubject("나가방 인증메일 입니다..","UTF-8");
			
			//이메일 본문 설정
			//text/html;charset=utf-8 : html로 해석해라
			msg.setContent("<h1>안녕하세요</h1>" + "<h3>인증번호는 [<span style='color:red'>"+sb.toString()+"</span>] 입니다.</h3>","text/html;charset=utf-8");
		
			//이메일 전송
			Transport.send(msg);
			
			//전송이 잘됬으면 true
			result = true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//위에서 받은 결과로 처리해주겠다
		if(result) {
			return sb.toString();
		}else {
			return null;
		}
	}
	
	public ArrayList<Member> selectAllMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		String query= "select * from member";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("member_No"));
				m.setMemberId(rset.getString("member_Id"));
				m.setMemberPw(rset.getString("member_Pw"));
				m.setMemberName(rset.getString("member_Name"));
				m.setMemberPhone(rset.getString("member_Phone"));
				m.setMemberMail(rset.getString("member_mail"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setEnrollDate(rset.getString("enroll_date"));
				list.add(m);
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

	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = "update member set member_name=?, member_id=?, member_pw=?, member_phone=?, member_mail=?, member_level=? where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getMemberId());
			pstmt.setString(3, m.getMemberPw());
			pstmt.setString(4, m.getMemberPhone());
			pstmt.setString(5, m.getMemberMail());
			pstmt.setInt(6, m.getMemberLevel());
			pstmt.setInt(7, m.getMemberNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member searchMemberId(Connection conn, String memberName, String memberMail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_name=? and member_mail=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberMail);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				m = new Member();
				m.setMemberId(rset.getString("member_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
}
