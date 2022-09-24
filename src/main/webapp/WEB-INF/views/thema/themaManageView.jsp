<%@page import="com.ngb.thema.model.vo.Thema"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Thema t = (Thema)request.getAttribute("t");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/notosans.css">
<link rel="stylesheet" href="/css/themaManageView.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
	
	<div class="content-wrap">
    <div class="title-wrap">테마관리</div>
    
        <div class="table-wrap">
        <table class="tbl tbl-hover notice-tbl">
            <tr>
                <th class="tr-1">테마코드</th>
                <td>
    				<%=t.getThemaCode() %>
                </td>
                <th class="tr-1">테마</th>
                <td>
					<%=t.getCategory() %>
                </td>
            </tr>
            <tr>
                <th class="tr-1">이미지 미리보기</th>
					<td>
						<img src="/upload/thema/<%=t.getThemaFilepath() %>">
					</td>
            </tr>
            <tr>
	            <th class="tr-1">테마명</th>
	            <td>
	                 <%=t.getThemaName() %>
	            </td>
	            <th class="tr-1">시간제한</th>
	            <td>
	                 <%=t.getThemaTime() %>
	            </td>
	         </tr>
            <tr>
                <th class="tr-1">잠금장치</th>
                <td>
					<%=t.getDevicePer() %>
                </td>
                <th class="tr-1">자물쇠</th>
                <td>
					<%=t.getLockPer()%>
                </td>
            </tr>
            <tr>
                <th class="tr-1">최소인원</th>
                <td>
					<%=t.getPeopleMin() %>
                </td>
                <th class="tr-1">최대인원</th>
                <td>
					<%=t.getPeopleMax() %>
                </td>
            </tr>
            <tr>
                <th class="tr-1">난이도</th>
                <td>
					<%=t.getThemaLevel() %>
                </td>
                <th class="tr-1">가격(1인당)</th>
                <td>
					<%=t.getThemaPrice() %>
                </td>
            </tr>
            <tr>
                <th class="tr-1">설명</th>
                <td colspan="3">
                    <%=t.getThemaContentBr() %>
                </td>
            </tr>
        </table>
        
        <button class="delete-btn" onclick="noticeDelete('<%=t.getThemaCode() %>');">삭제</button>
        <a class="update-btn" href="/updateThemaForm.do?themaCode=<%=t.getThemaCode()%>"><button>수정</button></a>
    </div>
    </div>
    
    <script>

		
		function noticeDelete(themaCode){
			console.log(themaCode);
			if(confirm("테마를 삭제하시겠습니까?")){
				location.href="/deleteThema.do?themaCode="+themaCode;
			}
		}
		
	    const tabs=$(".tap-ul>li");
	    tabs.on("click",function(){
	      	tabs.css("color","black").css("background-color","white");
	    	$(this).css("color","white").css("background-color","rgb(255,193,7)");
	    });
	    tabs.eq(0).click();

	</script>
</body>

</html>