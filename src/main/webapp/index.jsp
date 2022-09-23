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
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8rdr0sm91f&submodules=geocoder"></script>
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
                        <span><a href = "/themaUserList.do">THEMA</a></span>
                        <span id = "go-location"><a href = "#section3">LOCATION</a></span>
                    </div>
                </div>
        </div>
        <div class="section" id="section2">
	    	<div id = "thema-info-wrap" class = "thema-info-wrap">
	    	<!-- 테마목록 들어가는 자리 -->
	    	</div>
            <div class = "notice-wrap">
                <a href = "#">
                    <div class = "notice-title">NOTICE</div>
                </a>
            </div>
        </div>
        <div class="section" id="section3">
            <div class = "location-title">LOCATION</div>
            <div class = "location">
            	<div id="map" style="width:1200px; height:500px; margin:0 auto;"></div>
            </div>
	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
    </div>
    <script>
    $(document).ready(function(){
		$.ajax({
			url: "/mainThemaPrint.do",
			success: function(data){
				var html = "";
				$.each(data,function(idx,value){
					html += "<div id = 'test' class='thema-info-box'>";
					html += "<div class='section2-box photo-box left'>";
					html += "<a href = '#location'>";
					html += "<img src='/upload/thema/"+value.themaFilepath+"'>";
					html += "</a>";
					html += "</div>";
					html += "</div>";
				});
				html += "<div class='slide-navi prev'>";
				html += "<span class='material-icons'>arrow_back_ios_new</span>";
				html += "</div>";
				html += "<div class='slide-navi next'>";
				html += "<span class='material-icons'>arrow_forward_ios</span>";
				html += "</div>";

				$("#thema-info-wrap").html(html);				
			}
		});
 	});
 	
 		
 		$(document).on("click",".prev",function(){
 				console.log($(".thema-info-box").length);
 				
 		});
		let imgNo = 0;

		$(document).on("click",".prev",function(){
			var length = $(".thema-info-box").length;
			const width = 200;
		    if(imgNo != 0){
		        imgNo--;
		        const move = -imgNo*width;
		        $(".thema-info-box").css("transform","translateX("+move+"px)").css("transition-duration","1s")
		    }
		});
		$(document).on("click",".next",function(){
			var length = $(".thema-info-box").length;
			const width = 200;
		    if(imgNo != length-1){
		        imgNo++;
		        const move = -imgNo*width;
		        $(".thema-info-box").css("transform","translateX("+move+"px)").css("transition-duration","1s")
		    }
		});
    
    
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
const goLocation = $("#go-location");

goLocation.on("click",function(){
    headerWrap.show(300);
    loginBox.css("display","none");
    title.hide(300);
	page = 3;
});


    

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

const map = new naver.maps.Map("map",{
	center: new naver.maps.LatLng(37.533837,126.896836),
	zoom : 17,
	zoomControl: true,
	zoomControlOptions : {
		position: naver.maps.Position.TOP_RIGHT,
		style : naver.maps.ZoomControlStyle.SMALL
	}
});

const marker = new naver.maps.Marker({
	position: new naver.maps.LatLng(37.533837,126.896836),
	map : map 
});

	
</script>
</body>
</html>