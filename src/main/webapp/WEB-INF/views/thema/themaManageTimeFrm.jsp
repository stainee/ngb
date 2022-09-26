<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<link rel="icon" href="/img/logo2.png">
<link rel = "stylesheet" href = "/css/notosans.css">
<link rel = "stylesheet" href = "/css/themaManagerTimeFrm.css">

</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
	<div class="content-wrap">
	
    <div class="tap-wrap">
         <ul class="tap-ul">
         	<li><a href="/themaManageList.do" style="text-decoration-line: none; display:block;  width:100%;">테마관리</a></li>
         	<li><a href="/themaManageTimeFrm.do" style="text-decoration-line: none; display:block;  width:100%;">시간관리</a></li>
         </ul>
    </div>
    
     <div class="title-wrap">테마별 시간 관리</div>
    
    <div class="table-wrap">
        <table class="tbl tbl-hover notice-tbl" id="table">
            
        </table>
    </div>
</div>
<script>
	$(document).ready(function() {
	    $.ajax({
	       url : "/selectAllThemaList.do",
	       success : function(data) {
	    	   console.log(data);
	       var array1 = [];
	       var arrayTime1 = [];
	       var array2 = [];
	       for(let i=0;i<data.length;i++){
	          array1.push(data[i].themaCode);
	          array2.push(data[i].themaName);
	       }
	       
	
	 const themaCodeList = Array.from(new Set(array1));
	 const themaNameList = Array.from(new Set(array2));
	          //console.log(themaCodeList[0]);
	          
	          var html = "<tr class='tr-1'><th>테마코드</th><th>테마명</th><th>1타임</th><th>2타임</th><th>3타임</th><th>4타임</th><th>5타임</th><th>6타임</th><th>7타임</th><th>8타임</th><th>9타임</th><th>10타임</th><th>관리</th><th></th></tr>";
	             let record= 0; 
	          for (let i = 0; i < themaCodeList.length; i++) {
	             html += "<tr class='tr-3'>";
	             html += "<td>" + themaCodeList[i] + "</td>";
	             html += "<td>" + themaNameList[i] + "</td>";
	             //console.log(themaCodeList[i], themaNameList[i]);
	             //console.log(themaCodeList.length);
		         var roopTime = 0;
	             var roopCon = 0; 
	             
	             for (let j = record; j <= data.length; j++) {
	             	if (j == data.length || themaCodeList[i] != data[j].themaCode) {
	            		record += roopTime;
	 	            	for(let k=roopTime;k<10;k++){
		 	            	html += "<td><input type ='hidden' style = 'width:20px;' value ='0'>--</td>";	 	            		
			            	roopTime++;
	 	            	}		            	
	 	            }else{
	 	            	if(data[j].Time != undefined){
	 	                    html += "<td><input type ='hidden' style = 'width:20px;' value ="+data[j].TimeCode+">" + data[j].Time+ "</td>";
	 	                	roopTime++;
	 	                	roopCon = 1;	 	                    
             			}else{
             				for(let k=0;k<10;k++){
             					html += "<td><input type ='hidden' style = 'width:20px;' value ='0'>--</td>";
    			            	roopTime++;
             				}
             				record++;
             			}
		 	            	
		         	}            	
	             	if(roopTime==10){
	            		html += "<td class='manageBtn'><a href='/themaTimeAddFrm.do?themaCode="+themaCodeList[i]+"&themaName="+themaNameList[i]+"'>";
       		 		  	html += "<button class='update' style = 'cursor:pointer;'>수정</button>";
    		 		  	html += "</a>";
         			  	html += "<button class='delete' style = 'cursor:pointer; background-color:red;' onclick = 'deleteThemaTime(\""+themaCodeList[i]+"\");'>삭제</button></td>";  
         			  	break;
		         	}
	             	
	          	 }
	             //html += "<td>"+'df'+"</td>";
	             html += "</tr>";
	      	 }
	          $("#table").html(html);
	       },
	    }); //ajax끝
	 });//문서시작시 시작하는 함수
	 function deleteThemaTime(themaCodeList){
		 if(confirm("테마시간을 삭제하시겠습니까?")){
			 location.href="/deleteThemaTime.do?tmCode="+themaCodeList;
			 };
		 };
	 
	 
	const tabs=$(".tap-ul>li");
	tabs.on("click",function(){
		tabs.css("color","black").css("background-color","white");
		$(this).css("color","white").css("background-color","rgb(255,193,7)");
	});
	tabs.eq(1).click();
	
	const pageSelector = 2;
</script>
</body>
</html>