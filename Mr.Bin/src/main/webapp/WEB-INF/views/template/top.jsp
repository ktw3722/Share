<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%String root = request.getContextPath();
String id=(String)session.getAttribute("id");
String grade=(String)session.getAttribute("grade");
String mname=(String)session.getAttribute("mname");
%>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
    var checkFirst = false;
    var lastKeyword = '';
    var loopSendKeyword= false;
    
    function startSuggest(){
		if(checkFirst == false){
		//0.5초 후에 sendKeyword() 함수를 실행
		setTimeout("sendKeyword();",500);
		

		
		loopSendKeyword = true;
		}
		checkFirst = true;
    }
    
    //요청 전송
    function sendKeyword() {
        // log("키가 눌렸습니다.");
        if(loopSendKeyword == false) return;
        var keyword = document.search.keyword.value;
        if (keyword == '') {
            lastKeyword = '';
            $('#suggest').hide();  // suggest DIV 태그 감추기
        } else if (keyword != lastKeyword) { // 새로운 키워드 입력 여부 검사
            lastKeyword = keyword; // 새로운 키를 전역변수로 저장
            // 한글이나 특수문자를 UTF-8문자셋으로 변경
            var params = "keyword="+encodeURIComponent(keyword);
            // 요청 전송, 서블릿 주소 지정
            
      		/*sendRequest("< % = root % > / suggest", params, response, ' post ' ); */
			//이걸 jquery로 바꾸는 것임
      		$.post(
      			'<%=root%>/suggest',	
      			params,
      			function(data,textStatus){
      				response(data);
      			}
      			
      			
      			
      		);
		
			// 루트 빼면 루트 인식을 못함 -.- /suggest를 루트로 인식함...★
      		
      		
		}
		setTimeout("sendKeyword();", 500); //

	}

	// 결과 출력
	function response(resultText) {
	//	if (httpRequest.readyState == 4) {
		//	if (httpRequest.status == 200) {

				// 응답 문자열 추출
				//var resultText = httpRequest.responseText;

				//  3|자바001,자바002,자바003
				var result = resultText.split('|');

				// 갯수, 문자열을 정수로 변환
				var count = parseInt(result[0]);

				var keywordList = null;

				if (count > 0) {
					// ,를 구분한 1차원 배열 생성
					keywordList = result[1].split(',');

					var html = '';
					html += "등록된 쿼리 목록(선택하세요.)<br>";

					//  alert('keywordList.length: ' + keywordList.length);
					for (var i = 0; i < keywordList.length; i++) {

						//log("keywordList[i]: " + keywordList[i]); 

						// 특수 문자 표현: " --> \", \ --> \\            
						html += "<a href=\"javascript:select('"
								+ keywordList[i] + "')\">" + keywordList[i]
								+ "</a><br>";
						// alert(html);
					}

					// 목록을 출력할 DIV 태그
				

					// DIV 태그 값 저장
					// listView.innerHTML = html;
					$('#suggestList').html(html);
					
					// 목록을 가지고 있는 DIV 태그 출력
					$('#suggest').show();
				} else {
					$('#suggest').hide();
				}
			//} else {
				//alert("에러 발생: " + HttpRequest.status);
			//}
		//}
	}

	//검색된 함목을 클릭하면 검색어를 keyword 태그에 출력하고
	//검색 목록은 숨겨 버립니다.
	function select(selectedKeyword) {
		document.search.keyword.value = selectedKeyword;
		
		loopSendKeyword = false;
		checkFirst = false;

		$('#suggest').hide();
		

		//선택하는 순간 초기화
		    

	}

	function frmSend(f) {
		f.submit();
	}
</script>   
    

<!-- 	스타일시트 -->
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="//s1.daumcdn.net/cfs.tistory/custom/blog/212/2126867/skin/style.css?_T_=1463107578"> -->
<!-- 글씨 -->
<link rel="stylesheet"
	href="//s1.daumcdn.net/cfs.tistory/custom/blog/212/2126867/skin/images/font.css">
<!-- 메뉴움직이는거 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<!--<![endif]-->

<link rel="stylesheet"
	href="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/plugins/lightbox/assets/css/lightbox.min.css" />
<link rel="stylesheet" type="text/css"
	href="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/plugins/TistoryProfileLayer/style.css" />
<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/plugins/TistoryProfileLayer/profile.js"></script>
<style type="text/css">
.another_category {
	border: 1px solid #E5E5E5;
	padding: 10px 10px 5px;
	margin: 10px 0;
	clear: both;
}

.another_category h4 {
	font-size: 12px !important;
	margin: 0 !important;
	border-bottom: 1px solid #E5E5E5 !important;
	padding: 2px 0 6px !important;
}

.another_category h4 a {
	font-weight: bold !important;
}

.another_category table {
	table-layout: fixed;
	border-collapse: collapse;
	width: 100% !important;
	margin-top: 10px !important;
}

* html .another_category table {
	width: auto !important;
}

*:first-child+html .another_category table {
	width: auto !important;
}

.another_category th, .another_category td {
	padding: 0 0 4px !important;
}

.another_category th {
	text-align: left;
	font-size: 12px !important;
	font-weight: normal;
	word-break: break-all;
	overflow: hidden;
	line-height: 1.5;
}

.another_category td {
	text-align: right;
	width: 80px;
	font-size: 11px;
}

.another_category th a {
	font-weight: normal;
	text-decoration: none;
	border: none !important;
}

.another_category th a.current {
	font-weight: bold;
	text-decoration: none !important;
	border-bottom: 1px solid !important;
}

.another_category th span {
	font-weight: normal;
	text-decoration: none;
	font: 10px Tahoma, Sans-serif;
	border: none !important;
}

.another_category_color_gray, .another_category_color_gray h4 {
	border-color: #E5E5E5 !important;
}

.another_category_color_gray * {
	color: #909090 !important;
}

.another_category_color_gray th a.current {
	border-color: #909090 !important;
}

.another_category_color_gray h4, .another_category_color_gray h4 a {
	color: #737373 !important;
}

.another_category_color_red, .another_category_color_red h4 {
	border-color: #F6D4D3 !important;
}

.another_category_color_red * {
	color: #E86869 !important;
}

.another_category_color_red th a.current {
	border-color: #E86869 !important;
}

.another_category_color_red h4, .another_category_color_red h4 a {
	color: #ED0908 !important;
}

.another_category_color_green, .another_category_color_green h4 {
	border-color: #CCE7C8 !important;
}

.another_category_color_green * {
	color: #64C05B !important;
}

.another_category_color_green th a.current {
	border-color: #64C05B !important;
}

.another_category_color_green h4, .another_category_color_green h4 a {
	color: #3EA731 !important;
}

.another_category_color_blue, .another_category_color_blue h4 {
	border-color: #C8DAF2 !important;
}

.another_category_color_blue * {
	color: #477FD6 !important;
}

.another_category_color_blue th a.current {
	border-color: #477FD6 !important;
}

.another_category_color_blue h4, .another_category_color_blue h4 a {
	color: #1960CA !important;
}

.another_category_color_violet, .another_category_color_violet h4 {
	border-color: #E1CEEC !important;
}

.another_category_color_violet * {
	color: #9D64C5 !important;
}

.another_category_color_violet th a.current {
	border-color: #9D64C5 !important;
}

.another_category_color_violet h4, .another_category_color_violet h4 a {
	color: #7E2CB5 !important;
}
</style>

<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/script/T.js"></script>
<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/script/EAF2.js"></script>
<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/script/common.js"></script>
<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/script/gallery.js"></script>
<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/script/flash.js"></script>
<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/script/sha256.js"></script>
<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/script/md5.min.js"></script>
<script type="text/javascript"
	src="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/script/swfobject.js"></script>

<link rel="stylesheet" type="text/css"
	href="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/style/dialog.css" />
<!-- 메뉴바 -->
<link rel="stylesheet" href="css/loginbar.css" />
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="//s1.daumcdn.net/cfs.tistory/resource/3979/blog/style/menubar.css" /> -->

<body id="tt-body-index">
<!-- 위쪽 서브바 -->
<div id="tistorytoolbarid"
		style="position: absolute; height: 20px; top: 4px; right: 0px; background-color: transparent; background-image: none; z-index: 11;">
		<div class="tistorytoolbar tt_menubar_login">
			<div class="tt_menubar_whiteBar">
				<div id="ttMenubarInnerWrap" class="tt_menubar_inner">
					<div class="tt_menubar_bg_toolbar"></div>
					<% if(id==null){%>
					<div class="tt_menubar_mainmenu">
						<a
							class="tt_menubar_link_tit tt_menubar_link_tit_daum tt_menubar_link_tit_eng"
							href="<%=root%>/Mr.bini/member/loginForm.jsp">로그인</a>
					</div>
					<div class="tt_menubar_bg_bar"></div>
					<div class="tt_menubar_mainmenu">
						<a class="tt_menubar_link_tit tt_menubar_link_tit_eng"
							href="<%=root%>/Mr.bini/member/agreement.jsp">회원가입</a>
					</div>
					<div class="tt_menubar_bg_bar"></div>
					<div class="tt_menubar_mainmenu">
						<a class="tt_menubar_link_tit tt_menubar_link_tit_eng"
							href="<%=root%>/Mr.bini/member/idFindForm.jsp">ID찾기</a>
					</div>
					<div class="tt_menubar_bg_bar"></div>
					<div class="tt_menubar_mainmenu">
						<a class="tt_menubar_link_tit tt_menubar_link_tit_eng"
							href="<%=root%>/Mr.bini/member/pwFindForm.jsp">PW찾기</a>
					</div>
					<%}else{ %>
					<div class="tt_menubar_logout">
						<div class="tt_menubar_link_tit"><%=mname %>님 안녕하세요?</div>
					</div>
					<div class="tt_menubar_bg_bar"></div>
					<div class="tt_menubar_logout">
						<a class="tt_menubar_link_tit"
						href="<%=root%>/Mr.bini/member/read.jsp">나의정보</a>
					</div>
					<div class="tt_menubar_bg_bar"></div>
					<div class="tt_menubar_logout">
						<a class="tt_menubar_link_tit"
						href="<%=root%>/Mr.bini/member/logout.jsp">로그아웃</a>
					</div>
					<%}%>
				</div>
			</div>
		</div>
	</div>

	<div id="dkWrap" class="wrap_skin">
		<!-- 카테고리버튼 클릭시 'navi_on' 클래스 부여 -->
		<div id="dkHead" role="banner" class="area_head">
			<h1 class="screen_out">Favorite</h1>
			<button type="button" class="btn_cate">
				<span class="ico_skin ico_cate">카테고리</span>
			</button>
<!-- 			전체검색하는곳 -->
			<div class="area_search ">
            <button type="button" class="btn_search">
                <span class="ico_skin ico_search">검색하기</span>
            </button>		
	            <form name="search" action="<%=root%>/Mr.bini/bbs/list.jsp" method="post" class="frm_search box_search">
	                <fieldset>
	                    <legend class="screen_out">검색하기</legend>
	                    <label for="search" class="lab_search screen_out">Search</label>
	                    <input type="search" name="word" id="keyword" class="tf_search" placeholder="Search" value="" data-value="" onkeydown="startSuggest()">
	                    <input type="hidden" name="col" value="title">
	                    <span class="ico_skin ico_search"></span>
	                </fieldset>
					<div id="suggest" style="display:none; postion: absolute; left: 0px; top: 30px; color:#000000; background:#EAEAEA; width:500px">
    					<div id="suggestList"></div>
					</div>
	            </form>			
        </div>
			<div class="area_profile">
				<div class="tit_post">
					<a href="<%=root%>/index.jsp" " class="link_post">Favorite</a>
				</div>
				<span class="thumb_profile"> <img
					src="http://cfile29.uf.tistory.com/image/222EF63D57295FE714FD8A"
					class="img_profile" alt="프로필사진">
				</span> <span class="txt_profile">Mr.Bini</span>
			</div>
		</div>
		<hr class="hide">
		<div id="dkContent" class="cont_skin" role="main">
			<div id="cMain">
				<div id="mFeature" class="wrap_sub">
					<div class="cont_sub">
						<div class="inner_sub">
							<div class="area_sub">
								<div role="navigation" class="area_navi">
									<ul class="tt_category">
										<li><a class="link_tit" href="<%=root %>/bbs/list">게시판<span
												class="c_cnt">(0)</span></a></li>
										<li><a class="link_tit" href="<%=root %>/Mr.bini/guest/guest.jsp">방명록<span
												class="c_cnt">(0)</span></a></li>		
										<li><a class="link_tit" href="<%=root %>/img/list">이미지 게시판<span
												class="c_cnt">(0)</span></a></li>		
										<li><a class="link_tit" href="<%=root %>/Mr.bini/memo/list.jsp">메모장<span
												class="c_cnt">(0)</span></a></li>		
									</ul>
									<a href="/guestbook" class="link_guestbook">Guestbook</a>
								</div>
								<div class="wrap_etc">
									<div class="col_aside left_side">

										<!-- 공지사항 -->

										<div class="box_aside">
											<strong class="tit_aside">Notice</strong>
											<ul class="list_board">

											</ul>
										</div>


										<!-- 최근에 올라온 글 -->
										<div class="box_aside">
											<strong class="tit_aside">Recent Posts</strong>
											<ul class="list_board">

											</ul>
										</div>

										<!-- 최근에 달린 댓글 -->
										<div class="box_aside">
											<strong class="tit_aside">Recent Comments</strong>
											<ul class="list_board">

											</ul>
										</div>

										<!-- 링크 -->
										<div class="box_aside">
											<strong class="tit_aside">Link</strong>
											<ul class="list_board">

											</ul>
										</div>
														
									</div>


									<div class="col_aside right_side">

										<!-- 달력 -->
										<div class="box_aside box_calendar">
											<table class="tt-calendar" cellpadding="0" cellspacing="1"
												style="width: 100%; table-layout: fixed">
												<caption class="cal_month">
													<a href="/archive/201604" title="1개월 앞의 달력을 보여줍니다.">&laquo;</a>
													&nbsp; <a href="/archive/201605" title="현재 달의 달력을 보여줍니다.">2016/05</a>
													&nbsp; <a href="/archive/201606" title="1개월 뒤의 달력을 보여줍니다.">&raquo;</a>
												</caption>
												<thead>
													<tr>
														<th class="cal_week2">일</th>
														<th class="cal_week1">월</th>
														<th class="cal_week1">화</th>
														<th class="cal_week1">수</th>
														<th class="cal_week1">목</th>
														<th class="cal_week1">금</th>
														<th class="cal_week1">토</th>
													</tr>
												</thead>
												<tbody>
													<tr class="cal_week">
														<td class=" cal_day cal_day_sunday cal_day3">1</td>
														<td class=" cal_day cal_day3">2</td>
														<td class=" cal_day cal_day3">3</td>
														<td class=" cal_day cal_day3">4</td>
														<td class=" cal_day cal_day3">5</td>
														<td class=" cal_day cal_day3">6</td>
														<td class=" cal_day cal_day3">7</td>
													</tr>
													<tr class="cal_week">
														<td class=" cal_day cal_day_sunday cal_day3">8</td>
														<td class=" cal_day cal_day3">9</td>
														<td class=" cal_day cal_day3">10</td>
														<td class=" cal_day cal_day3">11</td>
														<td class=" cal_day cal_day3">12</td>
														<td class=" cal_day cal_day3">13</td>
														<td class=" cal_day cal_day3">14</td>
													</tr>
													<tr class="cal_week cal_current_week">
														<td class=" cal_day cal_day_sunday cal_day3">15</td>
														<td class=" cal_day cal_day4">16</td>
														<td class=" cal_day cal_day3">17</td>
														<td class=" cal_day cal_day3">18</td>
														<td class=" cal_day cal_day3">19</td>
														<td class=" cal_day cal_day3">20</td>
														<td class=" cal_day cal_day3">21</td>
													</tr>
													<tr class="cal_week">
														<td class=" cal_day cal_day_sunday cal_day3">22</td>
														<td class=" cal_day cal_day3">23</td>
														<td class=" cal_day cal_day3">24</td>
														<td class=" cal_day cal_day3">25</td>
														<td class=" cal_day cal_day3">26</td>
														<td class=" cal_day cal_day3">27</td>
														<td class=" cal_day cal_day3">28</td>
													</tr>
													<tr class="cal_week">
														<td class=" cal_day cal_day_sunday cal_day3">29</td>
														<td class=" cal_day cal_day3">30</td>
														<td class=" cal_day cal_day3">31</td>
														<td class="cal_day2">&nbsp;</td>
														<td class="cal_day2">&nbsp;</td>
														<td class="cal_day2">&nbsp;</td>
														<td class="cal_day2">&nbsp;</td>
													</tr>
												</tbody>
											</table>

										</div>

										<!-- 태그 클라우드 -->
										<div class="box_aside box_tag">
											<strong class="tit_aside">Tags</strong>
											<ul class="list_tag">

											</ul>
											<a href="/tag" class="link_more">more</a>
										</div>

										<!-- 글 보관함 -->
										<div class="box_aside box_archive">
											<strong class="tit_aside">Archives</strong>
											<ul class="list_keep">

											</ul>
										</div>

										<!-- 방문자수 -->
										<div class="box_aside box_visitor">
											<dl class="list_visitor">
												<dt>Today</dt>
												<dd>1</dd>
											</dl>
											<dl class="list_total">
												<dt>Total</dt>
												<dd>34</dd>
											</dl>
										</div>

									</div>
								</div>
							</div>
						</div>
						<button type="button" class="ico_skin btn_close">닫기</button>

						<strong class="screen_out">관리 메뉴</strong>
						<ul class="list_control">
							<li><a href="<%=root %>/Mr.bini/bbs/createForm.jsp" class="ico_skin link_write"
								title="글쓰기">글쓰기</a></li>
							<li><a href="<%=root %>/Mr.bini/memo/createForm.jsp" class="ico_skin link_memo"
								title="메모장">메모장</a></li>
							<li><a href="<%=root %>/Mr.bini/img/createForm.jsp"
								class="ico_skin link_rss" title="이미지 글쓰기">이미지 글쓰기</a></li>
							<li><a href="<%=root %>/Mr.bini/admin/list.jsp" class="ico_skin link_manage" title="관리">관리</a></li>
						</ul>
					</div>
				</div>

