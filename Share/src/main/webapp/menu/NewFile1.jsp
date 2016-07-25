<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html{
background-color: #eeeeee;
height: 100%;
overflow-x: hidden;
}
body{
margin:0px;
padding: 2% 5%;
text-align: center;
}
#button {
	z-index:3;
	position: relative;
	margin-top: 200px;
	margin-left: -5.5%;
	width: 50px;
	height: 50px;
	background-image:
		url('${pageContext.request.contextPath}/image/menu.png');
	background-repeat: no-repeat;
	background-position: center;;
	background-color: #0db14b;
	text-indent: -9999px;
	cursor: pointer;
	box-shadow: 1px 1px 5px #aaaaaa;
}

#menu {
	z-index: 2;
	background-color: #e8e8e8;
	width: 250px;
	height: 100%;
	position: fixed;
	left: -100%;
	top: 0px;
	font: 28px/1.6 NanumBrushWeb;
}

#effect {
	width: 100%;
	height: 100%;
	position: fixed;
	left: -100%;
	top: 0px;
	z-index: 1
}

#content {
	position: relative; 
	width: 100%;
	height: 100%;
	margin: -250px 0px 0px 0px;
}


#carpool {
	margin: 1%;
	float: left;
	border: 0px solid;
	border-radius: 20px;
	background-color: #aac803;
	width: 20%;
	height: 40%;
	min-width: 320px;
	min-height: 500px
}

#bus {
	margin: 1%;
	float: left;
	border: 0px solid;
	border-radius: 20px;
	background-color: #fdb800;
	width: 20%;
	height: 40%;
	min-width: 320px;
	min-height: 500px
}

#ktx {
	margin: 1%;
	float: left;
	border: 0px solid;
	border-radius: 20px;
	background-color: #608efb;
	width: 20%;
	height: 40%;
	min-width: 320px;
	min-height: 500px
}

#carsharing {
	margin: 1%;
	float: left;
	border: 0px solid;
	border-radius: 20px;
	background-color: #f1665d;
	width: 20%;
	height: 40%;
	min-width: 320px;
	min-height: 500px
}

#carpool .circle_div {
	background-color: white;
	width: 30%;
	height: 30%;
	min-height: 240px;
	min-width: 240px;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	overflow: hidden;
	vertical-align: middle;
	margin: 30px auto 0px auto
}

#bus .circle_div {
	background-color: white;
	width: 30%;
	height: 30%;
	min-height: 240px;
	min-width: 240px;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	overflow: hidden;
	vertical-align: middle;
	margin: 30px auto 0px auto
}

#ktx .circle_div {
	background-color: white;
	width: 30%;
	height: 30%;
	min-height: 240px;
	min-width: 240px;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	overflow: hidden;
	vertical-align: middle;
	margin: 30px auto 0px auto
}

#carsharing .circle_div {
	background-color: white;
	width: 30%;
	height: 30%;
	min-height: 240px;
	min-width: 240px;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	overflow: hidden;
	vertical-align: middle;
	margin: 30px auto 0px auto
}

#food {
	text-align: center;
	vertical-align: middle;
	margin-left: 20px;
	float: left;
	clear: left;
	border: 0px solid;
	background-image: url("../image/맛집.png");
	background-repeat: no-repeat;
	background-position: center;
	width: 340px;
	height: 300px
}

#travel {
	text-align: center;
	float: left;
	border: 0px solid;
	background-image: url("../image/여행지.png");
	background-repeat: no-repeat;
	background-position: center;
	width: 340px;
	height: 300px;
}

#help {
	text-align: center;
	float: left;
	border: 0px solid;
	background-image: url("../image/고객센터.jpg");
	background-repeat: no-repeat;
	background-position: center;
	width: 340px;
	height: 300px
}

#research {
	text-align: center;
	margin-right: 20px;
	float: left;
	border: 0px solid;
	background-image: url("../image/설문조사.jpg");
	background-repeat: no-repeat;
	background-position: center;
	width: 340px;
	height: 300px
	}
</style>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	// 		카풀
	$("#carpool .circle_div").hover(
			function() {
				$("#carimg").hide()
				$("#carpool .circle_div").css("background-color",
						"rgba(0,0,0,0.4)")
				$(".text1").css("display", "block")
			}, function() {
				$("#carimg").show()
				$("#carpool .circle_div").css("background-color", "white")
				$(".text1").css("display", "none")
			});
	// 		전세버스
	$("#bus .circle_div").hover(function() {
		$("#busimg").hide()
		$("#bus .circle_div").css("background-color", "rgba(0,0,0,0.4)")
		$(".text2").css("display", "block")
	}, function() {
		$("#busimg").show()
		$("#bus .circle_div").css("background-color", "white")
		$(".text2").css("display", "none")
	});
	// 		KTX
	$("#ktx .circle_div").hover(function() {
		$("#ktximg").hide()
		$("#ktx .circle_div").css("background-color", "rgba(0,0,0,0.4)")
		$(".text3").css("display", "block")
	}, function() {
		$("#ktximg").show()
		$("#ktx .circle_div").css("background-color", "white")
		$(".text3").css("display", "none")
	});
	// 	    카쉐어링
	$("#carsharing .circle_div").hover(
			function() {
				$("#shareimg").hide()
				$("#carsharing .circle_div").css("background-color",
						"rgba(0,0,0,0.4)")
				$(".text4").css("display", "block")
			},
			function() {
				$("#shareimg").show()
				$("#carsharing .circle_div").css("background-color",
						"white")
				$(".text4").css("display", "none")
			});
	// 	    맛집
	$("#food").hover(function() {
		$("#foodimg").css("background-color", "rgba(0,0,0,0.4)")
	}, function() {
		$("#foodimg").css("background-color", "")
	});
	// 	    여행지
	$("#travel").hover(function() {
		$("#travelimg").css("background-color", "rgba(0,0,0,0.4)")
	}, function() {
		$("#travelimg").css("background-color", "")
	});
	// 	    고객센터
	$("#help").hover(function() {
		$("#helpimg").css("background-color", "rgba(0,0,0,0.4)")
	}, function() {
		$("#helpimg").css("background-color", "")
	});
	// 	    설문조사
	$("#research").hover(function() {
		$("#researchimg").css("background-color", "rgba(0,0,0,0.4)")
	}, function() {
		$("#researchimg").css("background-color", "")
	});
});




	$(function() {
		$("#button").toggle(function() {
			$("#effect").animate({
				left : '0'
			}, 500);
			$("#menu").animate({
				left : '0'
			}, 500);
			$("#content").animate({
				left : '250px'
			}, 500);
			$("#button").animate({
				left : '250px'
			}, 500).css({
				"background-image" : "url('../image/close.png')",
				"background-repeat" : "no-repeat",
				"background-position" : "center",
				"background-color" : "#0db14b"
			});
		}, function() {
			jQuery("#effect").animate({
				left : '-100%'
			}, 500);
			jQuery("#menu").animate({
				left : '-250px'
			}, 500);
			jQuery("#content").animate({
				left : '0'
			}, 500);
			jQuery("#button").animate({
				left : '0'
			}, 500).css({
				"background-image" : "url('../image/menu.png')",
				"background-repeat" : "no-repeat",
				"background-position" : "center",
				"background-color" : "#0db14b"
			});
		});
		$("#effect").click(function() {
			$("#button").trigger("click");
		})
	});
</script>
</head>
<body>
<div id="effect"></div>
	<div id="menu">
		<div style="padding-left: 40px;">
			<div id="logo" style="z-index: 10; margin-left: -20px">
				<img alt="logo"
					src="${pageContext.request.contextPath}/image/로고.png" width="200px">
			</div>
			<div>
				<a href="http://www.naver.com"
					style="text-decoration: none; color: #3c3c3c">네이버</a>
			</div>
			<div>
				<a href="http://www.google.co.kr"
					style="text-decoration: none; color: #3c3c3c">구글</a>
			</div>
			<div>
				<a href="http://www.daum.net"
					style="text-decoration: none; color: #3c3c3c">다음</a>
			</div>
		</div>
	</div>
	<div id="button"></div>
	<div id="content">
		<div id="logo" style="text-align: center; margin: 0px">
			<img alt="logo" src="${pageContext.request.contextPath}/image/로고.png" width="200px">
		</div>
		<div id="carpool">
			<div class="circle_div">
				<span
					class="text1"
					style="display: none; z-index: 9; position: relative; margin-left: 3.9%; margin-top: 34%; font-size: 50px; font-weight: bolder;; color: white; text-shadow: black 0px 0px 10px;">카풀</span><img
					id="carimg"
					style="margin: auto; width: 100%; height: 100%; min-width: 240px; min-height: 240px; border-radius: 30%;"
					src="${pageContext.request.contextPath}/image/카풀.png">
			</div>
			<form style="text-align: center;">

				<select name='kind1' id='kind1'
					style="border: none; border: 1px solid #d8d8d8; width: 40%; height: 35px">
					<option value="5">전체</option>
					<option value="1">정기 카풀</option>
					<option value="2">단기 카풀</option>
					<option value="3">여성전용 카풀</option>
					<option value="4">운전자</option>
				</select> <select name='kind2' id='kind2'
					style="border: none; border: 1px solid #d8d8d8; width: 40%; height: 35px">
					<option value="1">전체</option>
					<option value="2">타세요</option>
					<option value="3">태워주세요</option>
				</select>
				<div class="search_wrap">
					<div>
						<img src="${pageContext.request.contextPath}/image/ico_start.gif" title="출발지" alt="출발지" width="12px"
							height="20px"> 
							<input  name="src_key_1"
							value="" title="출발지를 입력해주세요" size="10" maxlength="100"
							style="border: none; border: 1px solid #d8d8d8; width: 40%; height: 35px">
						<img src="${pageContext.request.contextPath}/image/ico_arrival.gif" title="도착지" alt="도착지" width="12px"
							height="20px"> 
							<input  name="src_key_2"
							value="" title="도착지를 입력해주세요" size="10" maxlength="100"
							style="border: none; border: 1px solid #d8d8d8; width: 40%; height: 35px">
					</div>
				</div>
				<input type="submit" name="" value="검색" title="검색">

			</form>
		</div>
		<div id="bus">
			<div class="circle_div">
					<span
					class="text2"
					style="display: none;; z-index: 9; position: relative; margin-left: 0.6%; margin-top: 80px; font-size: 50px; font-weight: bolder;; color: white; text-shadow: black 0px 0px 10px;">전세버스</span><img
					id="busimg"
					style="margin: auto; width: 100%; height: 100%; min-width: 240px; min-height: 240px; object-fit: cover; border-radius: 30%;"
					src="${pageContext.request.contextPath}/image/버스.jpg">
			</div>
		</div>
		<div id="ktx">
			<div class="circle_div">
				<span
					class="text3"
					style="display: none;; z-index: 9; position: relative; margin-left: 3%; margin-top: 80px; font-size: 50px; font-weight: bolder;; color: white; text-shadow: black 0px 0px 10px;">KTX</span><img
					id="ktximg"
					style="margin: auto; width: 100%; height: 100%; min-width: 240px; min-height: 240px; object-fit: cover; border-radius: 30%;"
					src="${pageContext.request.contextPath}/image/기차.png">
			</div>
		</div>
		<div id="carsharing">
			<div class="circle_div">
				<span
					class="text4"
					style="display: none;; z-index: 9; position: relative; margin-left: 1.8%; margin-top: 35px; font-size: 50px; font-weight: bolder;; color: white; text-shadow: black 0px 0px 10px;">Car<br>Sharing
				</span><img id="shareimg"
					style="margin-top: 0px; width: 100%; height: 100%; min-width: 240px; min-height: 240px; object-fit: cover; border-radius: 50%;"
					src="${pageContext.request.contextPath}/image/sharing.gif">
			</div>
		</div>

		<div
			style="clear: left; text-align: center; margin: 20px 0px; font-size: 50px; font-weight: bolder; color: #3c3c3c">우리의
			커뮤니티</div>
		<div id="food">
			<div id="foodimg"
				style="padding-top: 120px; z-index: 3; width: 350px; height: 180px; font-size: 30px; font-weight: bolder; text-shadow: black 0px 0px 10px; color: white;">맛있는
				것 어때?</div>
		</div>
		<div id="travel">
			<div id="travelimg"
				style="padding-top: 120px; z-index: 3; width: 350px; height: 180px; font-size: 30px; font-weight: bolder; text-shadow: black 0px 0px 10px; color: white;">여기
				놀러갈래?</div>
		</div>
		<div id="help">
			<div id="helpimg"
				style="padding-top: 120px; z-index: 3; width: 350px; height: 180px; font-size: 30px; font-weight: bolder; text-shadow: black 0px 0px 10px; color: white;">도움이
				필요하세요?</div>
		</div>
		<div id="research">
			<div id="researchimg"
				style="padding-top: 120px; z-index: 3; width: 350px; height: 180px; font-size: 30px; font-weight: bolder; text-shadow: black 0px 0px 10px; color: white;">몇가지만
				물어볼께요~</div>
		</div>
	</div>
</body>
</html>