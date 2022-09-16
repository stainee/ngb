
let idx=0;
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

function nextTab(){
    const length = $(".tabs .tab").length;
    for(let i=0; i<length; i++){
            $(".tabs .tab").eq(i).css("display", "none");
    }
        $(".tabs .tab").eq(idx).css("display", "block");
}

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

function prevTab(){
    const length = $(".tabs .tab").length;
    for(let i=0; i<length; i++){
            $(".tabs .tab").eq(i).css("display", "none");
    }
        $(".tabs .tab").eq(idx).css("display", "block");
}

$(".time-list li").on("click",function(){
    const length = $(".time-list li").length;
    const idx = $(".time-list li").index(this);
    if(!$(this).hasClass("time-lock")){
        for(let k=0; k<length; k++){
            $(".time-list li").eq(k).removeClass("select");
        }
        $(".time-list li").eq(idx).addClass("select");
    }
})

$(".thema-list li").on("click",function(){
    const length = $(".thema-list li").length;
    const idx = $(".thema-list li").index(this);
    if(!$(this).hasClass("thema-lock")){
        for(let k=0; k<length; k++){
            $(".thema-list li").eq(k).removeClass("select");
        }
        $(".thema-list li").eq(idx).addClass("select");
    }
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
        //,maxDate: "+1M" //최대 선택일자
        ,onSelect: function(dateText, inst) { 
        console.log(dateText);
        }              
    });                    
    
});