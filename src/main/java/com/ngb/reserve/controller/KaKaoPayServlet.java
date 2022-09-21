package com.ngb.reserve.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KaKaoPay
 */
@WebServlet("/kakaoPay.do")
public class KaKaoPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KaKaoPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int price = Integer.parseInt(request.getParameter("reserve_pay"));
		String themaCode = request.getParameter("thema_code");
		
		//REST API
		URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Authorization", "KakaoAK 4cd7966831fbf5f2f92cde2508a84cac"); // 어드민 키
		connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		connection.setDoOutput(true);

		String parameter = "cid=TC0ONETIME" // 가맹점 코드 -- 테스트 결제
				+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
				+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
				+ "&item_name="+themaCode // 상품명
				+ "&quantity=1" // 상품 수량
				+ "&total_amount="+price // 총 금액
				+ "&vat_amount="+price*0.04 // 부가세
				+ "&tax_free_amount=0" // 상품 비과세 금액
				+ "&approval_url=http://localhost:8888/" // 결제 성공 시
				+ "&fail_url=http://localhost:8888/" // 결제 실패 시
				+ "&cancel_url=http://localhost:8888/"; // 결제 취소 시
		OutputStream send = connection.getOutputStream(); // 스트림을 연결한다
		DataOutputStream dataSend = new DataOutputStream(send); // 데이터를 연결한다
		dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받는다.
		dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫는다)
		int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
		InputStream receive;
		
		if(result == 200) { //잘 받았으면
			receive = connection.getInputStream();
		}else {
			receive = connection.getErrorStream(); 
		}
		InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
		BufferedReader change = new BufferedReader(read);
		String str = change.readLine();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
