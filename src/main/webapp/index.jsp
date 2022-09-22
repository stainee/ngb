<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/css/main2.css">
<link rel="stylesheet" href = "/css/notosans.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
        <div class="section" id="section1">
                <div id = "section1_detail">
                    <span class = "title">
                        <a href="/">NAGABANG</a>
                    </span>
                    <div class = "login-box">
                    <%if(m==null){ %>
                        <span><a href="/loginFrm.do">로그인</a></span>
                        <span><a href="/signupFrm.do">회원가입</a></span>
                        <%}else{ %>
                        <span><a href="/logout.do">로그아웃</a></span>
                		<%} %>
                    </div>
                    <div class="sub-menu"></div>
                    <div class = "middle-box">
                        <span><a href = "#">NOTICE</a></span>
                        <span><a href = "/reserveFrm.do">RESERVATION</a></span>
                        <span><a href = "#">THEMA</a></span>
                        <span><a href = "#">LOCATION</a></span>
                    </div>
                </div>
        </div>
        <div class="section" id="section2">
            <div class = "notice-wrap">
                <a href = "#">
                    <div class = "notice-title">
                    NOTICE
                </div>
                </a>
                <div>
                    <table class = "main-table">
                        <thead>
                            <th>공지</th>
                            <th>제목</th>
                            <th>날짜</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><a href = "#">주의사항</a></td>
                                <td>22/09/19</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td><a href = "#">주의사항</a></td>
                                <td>22/09/19</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <a href = "#">
                <div class = "thema-title">
                THEMA
            </div>
            </a>
            <div class = "thema-info-wrap">
            <div class = "thema-info-box">
                <div class = "section2-box photo-box left">
                	<a href = "#"><img src="/img/공포의foreach문.png"></a>
                </div>
                <div class = "section2-box content-box">
                    <div class = "mainThema-title">공포의FOREACH문</div>
                    <div class = "mainThema-content">공포의 foreach문...
                        for문도..while문도 사용불가하다..
                        과연 foreach문으로 탈출할 수 있을까...?</div>
                </div>
            </div>

            <div class = "thema-info-box">
                <div class = "section2-box photo-box left">
                	<img src="/img/공포의foreach문.png">
                </div>
                <div class = "section2-box content-box">
                    <div class = "mainThema-title">
                        공포의FOREACH문
                    </div>
                    <div class = "mainThema-content">
                        공포의 foreach문...
                        for문도..while문도 사용불가하다..
                        과연 foreach문으로 탈출할 수 있을까...?
                    </div>
                    </div>
                </div>
            <div class = "thema-info-box">
                <div class = "section2-box photo-box left">
                	<img src="/img/공포의foreach문.png">
                </div>
                </div>
            <div class = "thema-info-box">
                <div class = "section2-box photo-box left">
                	<img src="/img/공포의foreach문.png">
                </div>
                <div class = "section2-box content-box">
                    <div class = "mainThema-title">
                        공포의FOREACH문
                    </div>
                    <div class = "mainThema-content">
                        공포의 foreach문...
                        for문도..while문도 사용불가하다..
                        과연 foreach문으로 탈출할 수 있을까...?
                    </div>
                    </div>
                </div>
            <div class = "thema-info-box">
                <div class = "section2-box photo-box left">
                	<img src="/img/공포의foreach문.png">
                </div>
                <div class = "section2-box content-box">
                    <div class = "mainThema-title">
                        공포의FOREACH문
                    </div>
                    <div class = "mainThema-content">
                        공포의 foreach문...
                        for문도..while문도 사용불가하다..
                        과연 foreach문으로 탈출할 수 있을까...?
                    </div>
                    </div>
                </div>
            <div class = "thema-info-box">
                <div class = "section2-box photo-box left">
                	<img src="/img/공포의foreach문.png">
                </div>
                <div class = "section2-box content-box">
                    <div class = "mainThema-title">
                        공포의FOREACH문
                    </div>
                    <div class = "mainThema-content">
                        공포의 foreach문...
                        for문도..while문도 사용불가하다..
                        과연 foreach문으로 탈출할 수 있을까...?
                    </div>
                    </div>
                </div>
                <div class = "slide-navi prev">
                    <span class = "material-icons">arrow_back_ios_new</span>
                </div>
                <div class = "slide-navi next">
                    <span class = "material-icons">arrow_forward_ios</span>
                </div>
            </div>
        </div>
        <div class="section" id="section3">
            <div class = "location-title">오시는길</div>
            <div class = "location">
            </div>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
    </div>
    <script>
    var mHtml = $("html");
    var page = 1;
    const headerWrap = $(".header-wrap");
    const header = $(".header");
    const loginBox = $(".login-box");
    const title = $(".title");
    headerWrap.css("display","none");

    mHtml.animate({scrollTop : 0},10);

    $(window).on("wheel", function(e) {
        if(mHtml.is(":animated")) return;
        if(e.originalEvent.deltaY > 0) {
            if(page == 3) return;
            page++;
        } else if(e.originalEvent.deltaY < 0) {
            if(page == 1) return;
            page--;
        }
        var posTop =(page-1) * $(window).height();
        mHtml.animate({scrollTop : posTop});

        if(page == 1){
            headerWrap.hide(300);
            loginBox.css("display","block");
            title.show(300);
        }
        if(page != 1){
            headerWrap.show(300);
            loginBox.css("display","none");
            title.hide(300);
        }
    });
let imgNo = 0;
const ul = $(".thema-info-box");
const imgCount = ul.children().length; // 사용하는 이미지 갯수
const width = 300;
ul.css("width",(imgCount*width)+"px");
$(".prev").on("click",function(){
    if(imgNo != 0){
        imgNo--;
        const move = -imgNo*width;
        ul.css("transform","translateX("+move+"px)").css("transition-duration","1s")
    }
});
$(".next").on("click",function(){
    if(imgNo != imgCount-1){
        imgNo++;
        const move = -imgNo*width;
        ul.css("transform","translateX("+move+"px)").css("transition-duration","1s")
    }
});
</script>
</body>
</html>