let idx=0;
let thema_idx=0;
let thema_code=0;
let time_code=0;
let time_list = [];
let lock_list = [];
let date = new Date();
date = dateFormat(date);
reserve={};

//dateFormating
function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    return date.getFullYear() + '-' + month + '-' + day + ' ';
}

//첫번째 다음 버튼
$("#tab1NextBtn").on("click", function(){
    //예약정보(테마,시간)을 입력했는지 확인
    let check = checkReserveInfo();
    if(check == true){
        //예약정보 set
        setReserveInfo();
        //다음 스텝으로 넘어간다
        nextStep();
    }
})

//신용카드로 결제
$("#credit").on("click",function(){
    //이름, 전화번호, 인원을 선택했는지 확인
    thema = getThemaInfo(thema_code);
    let check = checkReserveDetailInfo(thema);
    if(check==true){
        setReserveInfo();
        getReserveInfo();
        //예약 확인
        $.ajax({
            url:"/checkReserve.do",
            type:"post",
            data:{
                thema_code: reserve.thema_code,
                time_code: reserve.time_code,
                play_date: reserve.play_date
            },
            dataType : "text",
            //예약하기
            success : function(result){
                //예약 가능하면 결제, 아니면 취소
                if(result=="yes"){
                    //결제하기
                    const isPaid = payCard();
                    //결제 완료 되었으면
                    if(result=="complete"){
                        reserveFunc();
                    }else{//result=="fail"
                        alert("결제에 실패하였습니다");
                    }

                }else{  //예약 불가능하면 alert
                    alert("이미 예약된 테마입니다");
                }
            }
        })
    }
    
    
})

//카카오페이로 결제 
$("#kakaoPay").on("click", function(){
    thema = getThemaInfo(thema_code);
    let check = checkReserveDetailInfo(thema);
    if(check==true){
        setReserveInfo();
        getReserveInfo();
        //예약 확인
        $.ajax({
            url:"/checkReserve.do",
            type:"post",
            data:{
                thema_code: reserve.thema_code,
                time_code: reserve.time_code,
                play_date: reserve.play_date
            },
            dataType : "text",
            //예약하기
            success : function(result){
                //예약 가능하면 결제, 아니면 취소
                if(result=="yes"){
                    kakaoPay();

                }else{  //예약 불가능하면 alert
                    alert("이미 예약된 테마입니다");
                }
            }
        })
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

// 테마 버튼을 눌렀을시 효과
$(".themaList li").on("click",function(){
    //테마 버튼마다 이벤트 부여
    showthemaList(this);
    //테마 버튼마다 테마 정보 조회
    thema = getThemaInfo(thema_code);
})

//인원수 변경시마다 결제금액 변동
$("select[name=reserveAmount]").on("change", function(){
    const pricePerPerson = $("#themaPrice").text().split("원")[0]; 
    const peopleAmount = $(this).val();
    const totalPrice = pricePerPerson*peopleAmount;
    $(".totalPrice").text(totalPrice+"원");
})

/*함수들*/



// 다음 스텝 전환
function nextStep(){
    const length = $(".tab-menu .tabstep").length;
    idx++;
    for(let i=0; i<length; i++){
        $(".tab-menu .tabstep").eq(i).removeClass("tabstep-now");
    }
    for(let k=0; k<=idx; k++){
        $(".tab-menu .tabstep").eq(k).addClass("tabstep-now");
    }

    nextTab();
}

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


function setReserveInfo(){
    //예약날짜
    $(".playDate").text(date);
    //예약시간Code(DB Code)
    time_code = $(".timeList .select").attr("timeCode");
    //예약시간
    const reserveTime = $(".timeList .select").text();
    $(".playTime").text(reserveTime);
    //예약테마Code 
    thema_code = $(".themaList .select").attr("id");
    //예약테마
    const reserveThemaName = $(".themaList .select").text();
    $(".themaName").text(reserveThemaName);
    //결제금액 (인당)
    let price;
    if(idx==0){
        //두번째탭 넘어가는 순간 price의 초기 설정은 1인 가격으로 하여야 한다.
        price = $("#themaPrice").text().split("원")[0];
    }else{
        price = $(".totalPrice").text().split("원")[0];
    }
    //결제금액 1인 기본 셋팅
    $(".totalPrice").text(price+"원");

    const peopleAmount = $("select[name=reserveAmount]").val();
    $(".peopleAmount").text(peopleAmount);
    
}

function getReserveInfo(){
    //예약테마
    const reserveThemaName = $(".themaList .select").text().trim();
    //총 결제금액
    const totalPrice = $(".totalPrice").text().split("원")[0];
    //예약인원
    const peopleAmount = $("select[name=reserveAmount]").val();
    //이름
    const name = $("input[name=reserveName]").val();
    //전화번호
    const phone = $("input[name=reservePhone]").val();
    //이메일
    const email = $("input[name=reserveMail]").val();
    reserve = {
        thema_code: thema_code,
        time_code: time_code,
        reserve_pay : totalPrice,
        reserve_name : name,
        reserve_mail : email,
        reserve_phone : phone,
        reserve_amount : peopleAmount,
        // reserve_state : 객체에 저장하지 않는다
        play_date: date,
        thema_name: reserveThemaName
    }
}
//첫번째 스텝의 예약정보를 모두 입력했는지를 확인하는 메소드
function checkReserveInfo(){
    let themaSelect = false;
    let timeSelect = false;

    themaSelect = $(".themaList li").hasClass("select");
    timeSelect = $(".timeList li").hasClass("select");

    if(themaSelect == false){
        alert("테마를 선택해주세요");
        return false;
    }
    else if(timeSelect == false){
        alert("시간을 선택해주세요");
        return false;
    }
    else{
        return true;
    }
}

//두번째 스텝의 세부 예약정보를 모두 입력했는지를 확인하는 메소드
function checkReserveDetailInfo(thema){
    let name = true;
    let people = 0; //정상일 경우 default=0 크면 1 작으면 -1
    let phone = true;
    let email = true;

    let nameValue = $("input[name=reserveName]").val();
    let phoneValue = $("input[name=reservePhone]").val();
    let peopleValue = $("select[name=reserveAmount]").val();
    let mailValue = $("input[name=reserveMail]").val();

    //전화번호가 비지 않았고 11자리의 숫자인지 유효성 검사
    const phoneReg = /^[0-9]{11}$/;
    if(phoneValue !=""){
        if (!phoneReg.test(phoneValue)) { //11자리의 숫자인지 유효성 검사
            phone = false;
        }
    }else{ //전화번호가 비었으면
        phone = false;
    }

    //이름이 비었으면
    if(nameValue==""){
        name=false;
    }
    //인원이 작거나 큰지 검사
    if(peopleValue>thema.peopleMax){//인원이 최대인원보다 크면
        people =1;
    }else if(peopleValue<thema.peopleMin){//인원이 최소인원보다 작으면
        people =-1;
    }

    //이메일이 비었거나 유효하지 않으면
    const mailReg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    if(!mailValue==""){
        if(!mailReg.test(mailValue)){
            email = false;
        }
    }else{
        email = false;
    }

    if(name==true && people==0 && phone==true && email==true){
        return true;
    }else{
        if(name==false){
            alert("이름을 입력하여 주십시오");
        }else if(phone==false){
            alert("정확한 전화번호를 입력하여 주십시오");
        }else if(email==false){
            alert("정확한 이메일을 입력하여 주십시오");
        }
        else if(people!=0){
            if(people==1){
                alert("최대 수용 가능 인원을 초과하였습니다");
            }else{
                alert("최소 등록 인원을 충족하지 못하였습니다");
            }
        }
        return false;
    }

}
//선택한 테마 정보 가져오기
function getThemaInfo(themaCode){
    thema ={}
    const length = $(".themaList li").length;
    for(let th=0; th<length; th++){
        let code = $(".themaList li").eq(th).attr("id");
        if(themaCode == code){
            let price = $(".themaList li").eq(th).attr("price");
            let peopleMin = $(".themaList li").eq(th).attr("min");
            let peopleMax = $(".themaList li").eq(th).attr("max");
            thema = {themaCode: code,
                    price : price,
                    peopleMin : peopleMin,
                    peopleMax : peopleMax}
            break;
        }
    }
    
    return thema;
}   

function showthemaList(thisObj){
    //테마 인덱스 가져오기
    thema_idx = $(".themaList li").index(thisObj);
    //테마 코드 가져오기
    thema_code = $(thisObj).attr("id");
    const length = $(".themaList li").length;
    if(!$(thisObj).hasClass("thema-lock")){
        for(let k=0; k<length; k++){
            $(".themaList li").eq(k).removeClass("select");
        }
        $(".themaList li").eq(thema_idx).addClass("select");
    }
    //테마를 눌렀을시 테마 가격을 조회 및 표시
    let price = getThemaInfo(thema_code).price;
    $("#themaPrice").text(price +"원");

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
                            $(".timeList").append("<li timeCode="+time_list[t].timeCode+">"+time_list[t].time+"</li>");
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

function reserveFunc(){
    $.ajax({

        url:"/reserve.do",
        type:"post",
        data:{
            thema_code: reserve.thema_code,
            time_code: reserve.time_code,
            reserve_pay : reserve.reserve_pay,
            reserve_name : reserve.reserve_name,
            reserve_mail : reserve.reserve_mail,
            reserve_phone : reserve.reserve_phone,
            reserve_amount : reserve.reserve_amount,
            play_date: reserve.play_date,
            thema_name: reserve.thema_name
        }
    });
}
function payCard(){
    const price = $(".totalPrice").val().split("원")[0]; 
    const d = new Date();
    const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
    let result = "";
    IMP.init("imp87317522");
    IMP.request_pay({
        pay_method: "card",
        merchant_uid : "상품코드_"+date,
        name : "결제 테스트",
        amount : price,
        buyer_email : reserve.reserve_mail,
        buyer_name : reserve.reserve_name,
        buyer_tel : reserve.reserve_phone
    }, function(rsp){
        if(rsp.success){
            result = "complete";
        }else{
            result="fail";
        }
    });

    return result;
}

function kakaoPay(){
    $.ajax({
        url:"/kakaoPay.do",
        type:"post",
        dataType:"text",
        data:{
            thema_code: reserve.thema_code,
            time_code: reserve.time_code,
            reserve_pay : reserve.reserve_pay,
            play_date: reserve.play_date
        },
        success:function(resp){
            console.log("결제창 띄우기");
        },
        done: function(resp){
            if(resp.status === 500){
                alert("카카오페이결제를 실패하였습니다.")
            } else{
                //  // alert(resp.tid); //결제 고유 번호
                // var box = resp.next_redirect_pc_url;
                // //window.open(box); // 새창 열기
                // location.href = box;
            }
        }
    })
    
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

