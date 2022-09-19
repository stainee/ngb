let idx=0;
let thema_idx=0;
let thema_code=0;
let time_list = [];
let lock_list = [];
let date = new Date();
date = dateFormat(date);

//dateFormating
function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    return date.getFullYear() + '-' + month + '-' + day + ' ';
}

//다음 스텝으로 전환
$(".next").on("click", function(){
    const length = $(".tab-menu .tabstep").length;
    idx++;
    for(let i=0; i<length; i++){
        $(".tab-menu .tabstep").eq(i).removeClass("tabstep-now");
    }
    for(let k=0; k<=idx; k++){
        $(".tab-menu .tabstep").eq(k).addClass("tabstep-now");
    }
    
    nextTab();
    //예약정보 set
    if(idx==1){ 
        setReserveInfo();
    }
})

//이전 스텝으로 전환
$(".prev").on("click", function(){
    if(idx>0){
        const length = $(".tab-menu .tabstep").length;
        idx--;
        for(let i=0; i<length; i++){
            $(".tab-menu .tabstep").eq(i).removeClass("tabstep-now");
        }
        for(let k=0; k<=idx; k++){
            $(".tab-menu .tabstep").eq(k).addClass("tabstep-now");
        }
        prevTab();
    }
})

//다음 탭으로 display 속성 전환
function nextTab(){
    const length = $(".tabs .tab").length;
    for(let i=0; i<length; i++){
            $(".tabs .tab").eq(i).css("display", "none");
    }
        $(".tabs .tab").eq(idx).css("display", "block");
}

//이전 탭으로 display 속성 전환
function prevTab(){
    const length = $(".tabs .tab").length;
    for(let i=0; i<length; i++){
            $(".tabs .tab").eq(i).css("display", "none");
    }
        $(".tabs .tab").eq(idx).css("display", "block");
}


// 테마 버튼을 눌렀을시 효과
$(".themaList li").on("click",function(){
    //테마 버튼마다 이벤트 부여
    showthemaList(this);
    //테마 버튼마다 인원수 조회
    
})


/*함수들*/
function setReserveInfo(){
    //예약날짜
    $("#playDate").text(date);
    //예약시간
    const reserveTime = $(".timeList .select").text();
    $("#playTime").text(reserveTime);
    //예약테마
    const reserveThemaName = $(".themaList .select").text();
    $("#themaName").text(reserveThemaName);
    //결제금액 -- default = 인원수 1
    const price = $("#themaPrice").text().split("원")[0]; 
    $("#totalPrice").text(price+"원");
}

function getThemaInfo(themaCode){
    const themaInfo = [];
    const length = $(".themaList .li").length;

    for(let th=0; th<length; th++){
        let code = $(".themaList .li").eq(th).attr(id);
        let price = $(".themaList .li").eq(th).attr(price);
        let peopleMin = $(".themaList .li").eq(th).attr(min);
        let peopleMax = $(".themaList .li").eq(th).attr(max);
        thema ={}
        thema[code] = price;
        thema[code] = peopleMin;
        thema[code] = peopleMax;
        themainfo.push(thema);
    }
    console.log(themainfo);
}

function showthemaList(thisObj){
    thema_idx = $(".themaList li").index(thisObj);
    const length = $(".themaList li").length;
    if(!$(thisObj).hasClass("thema-lock")){
        for(let k=0; k<length; k++){
            $(".themaList li").eq(k).removeClass("select");
        }
        $(".themaList li").eq(thema_idx).addClass("select");
    }
    
    //테마에 맞는 가격을 가져오기
    $.ajax({
        url: "/getThemaCode.do",
        type:"post",
        data: {idx : thema_idx},
        dataType:"json",
        success: function(thema) {
            thema_code = thema.themaCode;
            getThemaInfo();
            // let price = getThemaPrice(themaCode);
            // $("#themaPrice").text(thema.themaPrice +"원");

            //테마에 맞는 시간 가져오기
            $.ajax({
                url: "/getThemaTime.do",
                type: "post",
                data:{themaCode : thema_code,
                        date: date},
                dataType :"json",
                success: function (list){
                    //이미 예약된 테마를 가져와 비교하여 list에 추가
                    $.ajax({
                        url:"/getReserveTime.do",
                        type:"post",
                        data:{themaCode : thema_code,
                            date : date},
                        dataType : "json",
                        success : function(reserveList){
                            lock_list = reserveList;
                            time_list = list;
                            
                            $(".timeList").empty();
                            //lock_list에 존재 유무 찾기
                            for(let t=0; t<time_list.length; t++){
                                let searchIndex = -1;
                                for(let l=0; l<lock_list.length; l++){
                                    if(lock_list[l].timeCode == time_list[t].timeCode){
                                        searchIndex = t;
                                        break;
                                    }
                                }
                                //lock_list 에 있으면 lock 된 목록을 표시, 아니면 일반 리스트를 표시한다.
                                if(searchIndex ==-1){
                                    $(".timeList").append("<li name="+time_list[t].timeCode+">"+time_list[t].time+"</li>");
                                }else{ 
                                    $(".timeList").append("<li class='time-lock' name="+time_list[t].timeCode+">"+time_list[t].time+"</li>");
                                }
                            }
                            //시간 리스트 눌렀을시 효과
                            $(".timeList li").on("click",function(){
                                const length = $(".timeList li").length;
                                const idx = $(".timeList li").index(this);
                                if(!$(this).hasClass("time-lock")){
                                for(let k=0; k<length; k++){
                                    $(".timeList li").eq(k).removeClass("select");
                                }
                                $(".timeList li").eq(idx).addClass("select");
                            }
    
                            })
                        

                        }
                    }) // ajax
                    
                }
            }); //ajax 

        }
    });
}


$(function() {
    //input을 datepicker로 선언
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시              
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,minDate: "D"
        ,defaultDate : new Date()
        //,maxDate: "+1M" //최대 선택일자
        ,onSelect: function(dateText, inst) { 
            date = dateText;
            showthemaList($(".themaList li").eq(0));
        }              
    });                    
    
});

