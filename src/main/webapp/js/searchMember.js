/**
 * 
 */

$(".searchId").on("click", function() {
	console.log("눌림?");
	$(".first-content").removeClass("show-hide");
	$(".second-content").addClass("show-hide");
	$(".searchId").css("background-color", "gray");
	$(".searchPw").css("background-color", "rgb(50,50,50)");
});

$(".searchPw").on("click", function() {
	$(".second-content").removeClass("show-hide");
	$(".first-content").addClass("show-hide");
	$(".searchPw").css("background-color", "gray");
	$(".searchId").css("background-color", "rgb(50,50,50)");
});

$(".searchId").click();

