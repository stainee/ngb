package com.ngb.reserve.controller;

import java.io.UnsupportedEncodingException;


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

public class ReserveMailSender {

	public boolean sendMail1(String mailTitle, String receiver, String mailContent) {
		boolean result = false;
		//이메일 통신설정
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host","smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		//인증정보설정(로그인)
		Session session = Session.getDefaultInstance(prop, 
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						PasswordAuthentication pa = new PasswordAuthentication("testzb0712","qqeqiggagbnrqeys");
						return pa;
					}
				}
		);
		//이메일을 전송해서 전송하는 객체
		MimeMessage msg = new MimeMessage(session);
		
		//이메일 작성
		try {
			//메일 전송날짜 설정
			msg.setSentDate(new Date());
			//보내는 사람 정보
			msg.setFrom(new InternetAddress("testzb0712@gmail.com","나가방"));
			//받는 사람 정보
			InternetAddress to = new InternetAddress(receiver);
			msg.setRecipient(Message.RecipientType.TO, to);
			//이메일 제목설정
			msg.setSubject(mailTitle,"UTF-8");
			//이메일 본문설정
			msg.setContent(mailContent,"text/html;charset=utf-8");
			//이메일 전송
			Transport.send(msg);
			result = true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public String reserveSendMail2(String reserveMail) {
		boolean result = false;
		//인증용 랜덤코드 생성
		Random r = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<14;i++) {
			//숫자, 영어소문자, 영어대문자 섞에서 8개 조합
			//0 : 0~9, 1 : A-Z, 2 : a-z
			//int flag = r.nextInt(14);
			//if(flag == 0) {
				//0~9
				int randomNum = r.nextInt(10);
				sb.append(randomNum);
//			}else if(flag == 1) {
//				//A~Z
//				char randomChar = (char)(r.nextInt(26)+65);
//				sb.append(randomChar);
//			}else if(flag == 2) {
//				//a~z
//				char randomChar = (char)(r.nextInt(26)+97);
//				sb.append(randomChar);
//			}
		}
		
		//이메일 통신설정
				Properties prop = System.getProperties();
//				prop.put("mail.smtp.host","smtp.gmail.com");
//				prop.put("mail.smtp.port", 465);
//				prop.put("mail.smtp.auth", "true");
//				prop.put("mail.smtp.ssl.enable", "true");
//				prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				prop.put("mail.smtp.host", "smtp.gmail.com");
				prop.put("mail.smtp.port", 587); //변경
				prop.put("mail.smtp.auth", "true");
				prop.put("mail.smtp.starttls.enable", true); //추가
				prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); //추가
				//prop.put("mail.smtp.ssl.enable", true);  // 주석
				prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				//인증정보설정(로그인)
				Session session = Session.getDefaultInstance(prop, 
						new Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								PasswordAuthentication pa = new PasswordAuthentication("testzb0712","qqeqiggagbnrqeys");
								return pa;
							}
						}
				);
				//이메일을 전송해서 전송하는 객체
				MimeMessage msg = new MimeMessage(session);
				
				//이메일 작성
				try {
					//메일 전송날짜 설정
					msg.setSentDate(new Date());
					//보내는 사람 정보
					msg.setFrom(new InternetAddress("testzb0712@gmail.com","나가방"));
					//받는 사람 정보
					InternetAddress to = new InternetAddress(reserveMail);
					msg.setRecipient(Message.RecipientType.TO, to);
					//이메일 제목설정
					msg.setSubject("나가방 인증메일","UTF-8");
					//이메일 본문설정
					msg.setContent("<h1>안녕하세요. 방탈출 카페 나가방입니다.</h1>"
									+"<h3>입금하실 가상 계좌번호는 [<span style='color:blue'>KH은행</span>] [<span style='color:red'>"
									+sb.toString()
									+"</span>] 입니다.</h3>"
							,"text/html;charset=utf-8");
					//이메일 전송
					Transport.send(msg);
					result = true;
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(result) {
					return sb.toString();
				}else {
					return null;
				}
	}

	//예약 결과를 보여주는 메일 발송
	public void reserveResultSendMail(String mail, int reserveNo) {
		boolean result = false;
		//이메일 통신설정
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 587); //변경
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", true); //추가
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); //추가
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		//인증정보설정(로그인)
		Session session = Session.getDefaultInstance(prop, 
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						PasswordAuthentication pa = new PasswordAuthentication("testzb0712","qqeqiggagbnrqeys");
						return pa;
					}
				}
		);
		//이메일을 전송해서 전송하는 객체
		MimeMessage msg = new MimeMessage(session);
		
		//이메일 작성
		try {
			//메일 전송날짜 설정
			msg.setSentDate(new Date());
			//보내는 사람 정보
			msg.setFrom(new InternetAddress("testzb0712@gmail.com","나가방"));
			//받는 사람 정보
			InternetAddress to = new InternetAddress(mail);
			msg.setRecipient(Message.RecipientType.TO, to);
			//이메일 제목설정
			msg.setSubject("나가방 예약확인 메일입니다 ","UTF-8");
			//이메일 본문설정
			msg.setContent("<h1>안녕하세요. 방탈출 카페 나가방입니다.</h1>"
							+"<h3>고객님의 예약번호는 <span>"+reserveNo
							+"</span> 입니다.</h3>"
					,"text/html;charset=utf-8");
			//이메일 전송
			Transport.send(msg);
			result = true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
































