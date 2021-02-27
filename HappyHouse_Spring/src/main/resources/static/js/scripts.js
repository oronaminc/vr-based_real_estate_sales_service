/*!
    * Start Bootstrap - Agency v6.0.2 (https://startbootstrap.com/template-overviews/agency)
    * Copyright 2013-2020 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
    */
		//	로그인
	$("#login").click(function() {
		let userid = $("#loginid").val();
		if (userid.length == 0) {
			alert("아이디를 입력해주세요.");
			return;
		}
		let userpass = $("#loginpwd").val();
		if (userpass.length == 0) {
			alert("비밀번호를 입력해주세요");
			return;
		}

		$.ajax({
			url: "assets/member/userlist.xml",
			type: "get",
			dataType: "xml",
			success: function(data) {
				var login = false;
				var username = '';
				$(data).find('user').each(function() {
					if (userid == $(this).attr("id") && userpass == $(this).find("password").text()) {
						username = $(this).find("username").text();
						login = true;
						return false; // break;  * return true; continue
					}
				});

				if (!login) {
					alert("아이디 또는 비밀번호가 틀렸습니다.");
				}
				else{
					$("#header_nav_confirmon_before").css("display", "none");
					$("#header_nav_confirmon").css("display", "block");
					$("#profile_msg").html("<b>" + username + "</b> 님 안녕하세요.").css("color", "white");
				}
			}
		});
	});

	//로그아웃
	$("#logout").click(function() {
		$("#header_nav_confirmoff").css("display", "block");
		$("#header_nav_confirmon").css("display", "none");
	});
	
	$("#forgotpwd").click(function(){
		let hintid = $("#hintid").val();
		if (hintid.length == 0) {
			alert("아이디를 입력해주세요.");
			return;
		}
		let hintemail = $("#hintemail").val();
		if (hintemail.length == 0) {
			alert("이메일을 입력해주세요");
			return;
		}

		$.ajax({
			url: "assets/member/userlist.xml",
			type: "get",
			dataType: "xml",
			success: function(data) {
				var login = false;
				var pwd = '';
				$(data).find('user').each(function() {
					if (hintid == $(this).attr("id") && hintemail == $(this).find("email").text()) {
						pwd = $(this).find("password").text();
						search = true;
						return false; // break;  * return true; continue
					}
				});

				if (!search) {
					alert("아이디와 이메일에 해당하는 비밀번호가 없습니다.");
				}
				else{
					alert("비밀번호는 " + pwd + " 입니다.");
				}
			}
		});
	});

    (function ($) {
    "use strict"; // Start of use strict

    // Smooth scrolling using jQuery easing
    $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
        if (
            location.pathname.replace(/^\//, "") ==
                this.pathname.replace(/^\//, "") &&
            location.hostname == this.hostname
        ) {
            var target = $(this.hash);
            target = target.length
                ? target
                : $("[name=" + this.hash.slice(1) + "]");
            if (target.length) {
                $("html, body").animate(
                    {
                        scrollTop: target.offset().top - 72,
                    },
                    1000,
                    "easeInOutExpo"
                );
                return false;
            }
        }
    });

    // Closes responsive menu when a scroll trigger link is clicked
    $(".js-scroll-trigger").click(function () {
        $(".navbar-collapse").collapse("hide");
    });

    // Activate scrollspy to add active class to navbar items on scroll
    $("body").scrollspy({
        target: "#mainNav",
        offset: 74,
    });

    // Collapse Navbar
    var navbarCollapse = function () {
        //if ($("#mainNav").offset().top > 100) {
            $("#mainNav").addClass("navbar-shrink");
        //} else {
        //    $("#mainNav").removeClass("navbar-shrink");
        //}
    };
    // Collapse now if page is not at top
    navbarCollapse();
    // Collapse the navbar when page is scrolled
    $(window).scroll(navbarCollapse);
})(jQuery); // End of use strict
