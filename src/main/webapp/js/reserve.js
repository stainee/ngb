
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
    const length = $(".themaList li").length;
    thema_idx = $(".themaList li").index(this);
    if(!$(this).hasClass("thema-lock")){
        for(let k=0; k<length; k++){
            $(".themaList li").eq(k).removeClass("select");
        }
        $(".themaList li").eq(thema_idx).addClass("select");
    }
    
    //테마에 맞는 가격을 가져오기
    $.ajax({
        url: "/getThemaPrice.do",
        type:"post",
        data: {idx : thema_idx},
        dataType:"json",
        success: function(thema) {

            $("#themaPrice").text(thema.themaPrice +"원");
            thema_code = thema.themaCode;

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
                            console.log(reserveList);
                        }
                    }) // ajax

                    $(".timeList").empty();
                    time_list = list;
                    for(let t=0; t<time_list.length; t++){
                        $(".timeList").append("<li>"+time_list[t].time+"</li>");

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
                    
                }
            }); //ajax 

        }
    });
    
})




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
        }              
    });                    
    
});

