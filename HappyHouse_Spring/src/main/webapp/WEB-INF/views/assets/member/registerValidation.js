$(document).ready(function() {

	$("#registForm").on("submit", function() {
		if(!checkId){
			alert("아이디 중복체크 실패");
			return;
		}
		alert("회원 가입이 완료되었습니다.");
	});
	
	//password 유효성 검사
	var myInput = document.getElementById("pwd");
	var letter = document.getElementById("pwdletter");
	var number = document.getElementById("pwdnumber");
	var length = document.getElementById("pwdlength");

	console.log(myInput);
	myInput.onfocus = function() {
  		document.getElementById("pwdmessage").style.display = "block";
	}

	myInput.onblur = function() {
  		document.getElementById("pwdmessage").style.display = "none";
	}

	myInput.onkeyup = function() {
	// Validate lowercase letters
  		var lowerCaseLetters = /[a-z]/g;
  		if(myInput.value.match(lowerCaseLetters)) {
    		letter.classList.remove("invalid");
    		letter.classList.add("valid");
  		} else {
    		letter.classList.remove("valid");
    		letter.classList.add("invalid");
	}
	
	  // Validate numbers
	  var numbers = /[0-9]/g;
	  if(myInput.value.match(numbers)) {
	  		number.classList.remove("invalid");
	  		number.classList.add("valid");
	  } else {
	    	number.classList.remove("valid");
	    	number.classList.add("invalid");
	  }

		// Validate length
		if(myInput.value.length >= 8) {
	    	length.classList.remove("invalid");
			length.classList.add("valid");
		} else {
	    	length.classList.remove("valid");
			length.classList.add("invalid");
		}
	}
	
});