<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript"> 
  // 입력 값 검사후 서버로 전송 
  function inputCheck(){
	  var f=document.frm; // <FORM>태그 객체 
    if(f.id.value ==""){ 
    	alert("아이디를 입력해 주세요."); 
      f.id.focus(); // 폼이름.input 태그명.커서 셋팅    
 
      return false;       // 프로그램 종료, 값을 돌려줌 
    } 
    if(f.passwd.value == ""){ 
      alert("비밀번호를 입력해 주세요."); 
      f.passwd.focus(); 
      return false; 
    } 
    if(f.repasswd.value == ""){ 
      alert("비밀번호를 확인해 주세요"); 
      f.repasswd.focus(); 
      return false; 
    } 
     
    //비밀번호가 일치하는지 검사 
    if(f.passwd.value != f.repasswd.value){ 
      alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요."); 
      f.repasswd.value="";
      f.repasswd.focus(); 
      return false; 
    } 
     
    if(f.mname.value == ""){ 
      alert("이름을 입력해 주세요."); 
      f.mname.focus(); 
      return false; 
    } 
 
    if(f.click.value==0){ 
        alert("아이디 중복체크를 해주세요"); 
        f.confirm.focus();  
        return false;
      }
    if(f.email.value==""){ 
		return true;
	}else{if(f.eclick.value==0){
    	alert("이메일 중복체크를 해주세요"); 
        f.emailclick.focus();  
        return false;
			}
      } 

    // Form onsubmit 이벤트일경우 
    // return false; 
     
    f.submit(); 
  } 
 
  // 중복 아이디를 검사합니다. 
  function idCheck(idv){
	  var f=document.frm; // <FORM>태그 객체 
    if(idv == ""){ 
      window.alert("아이디를 입력해 주세요."); 
      f.id.focus(); // 커서 이동 
    }else{
      url="./id_proc.jsp?id=" + idv;  // GET 
      wr = window.open(url,"아이디검색","width=500,height=300"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);// x, y //윈도우창을 x,y좌표로 움직이겠다.
    } 
  } 
 
  //중복 이메일을 검사합니다. 
  function emailCheck(email){ 
    if(email == ""){ 
      window.alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
    }else{ 
      url="./email_proc.jsp?email=" + email;  // GET 
      wr = window.open(url,"이메일검색","width=500,height=300"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y 
    } 
  } 
 
 
 
</script> 
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" />
<!-- *********************************************** -->
<div class='article_skin'>
<DIV align="center" style="color: #3366cc;font-weight: bold;font-size: 30px">회원가입</DIV>
<DIV align="right" style="color: #cc0000;font-weight: bold;margin-right: 180px">(*필수입력)</DIV>
 
<FORM name='frm' 
      method='POST' 
      action='./createProc.jsp'
      enctype='multipart/form-data'
      onsubmit="return inputCheck()">
      <input type="hidden" name="click" value=0>
      <input type="hidden" name="eclick" value=0> 
  <center>
  <TABLE class='table'>
    <tr> 
       <th align="left"> 사진</th> 
       <td ><input type='file' name='fname' style="border:none;width:313px;height: 30px;border-radius:3px"></td> 
     </tr> 
     <tr>  
       <th align="left">*아이디</th> 
       <td> 
           <input type="text" name="id" size="15" placeholder='userID'style="border:none;border:1px solid #d8d8d8;width:240px;height: 30px;border-radius:3px"> 
           <input id='white'type="button" name="confirm" value="중복확인"  
                  onclick="idCheck(document.frm.id.value)"style="border-radius:5px;font-size: 12px"> 
       </td> 
     </tr> 
    <tr>  
       <th align="left">*패스워드</th> 
       <td> <input type="password" name="passwd" size="15" style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"> </td> 
     </tr> 
     <tr>  
       <th align="left" width="100px">*패스워드 확인</th> 
       <td> <input type="password" name="repasswd" size="15" style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"> </td>  
     </tr> 
     <tr>  
       <th align="left">*이름</th> 
       <td> <input type="text" name="mname" size="15" style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"> </td> 
     </tr> 
     <tr>  
       <th align="left">전화번호</th> 
       <td><input type="text" name="tel" placeholder="010-XXXX-XXXX" style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"></td> 
       <td> </td> 
     </tr>           
     <tr>  
       <th align="left">이메일</th> 
       <td> 
           <input type="text" name="email" size="27"  placeholder='email@mail.com'style="border:none;border:1px solid #d8d8d8;width:240px;height: 30px;border-radius:3px"> 
           <input id='white'type="button" name="emailclick" value="중복확인"  
                   onclick="javascript:emailCheck(document.frm.email.value)"style="border-radius:5px;font-size: 12px"> 
        
       </td> 
     </tr> 
     <tr>   
       <th align="left">우편번호</th> 
       <td> <input type="text" id="sample6_postcode" name="zipcode" size="10" style="border:none;border:1px solid #d8d8d8;width:240px;height: 30px;border-radius:3px"> 
            <input id='white'type="button" name="btnPost" value="우편번호찾기"  
                  onclick="sample5_execDaumPostcode()"style="border-radius:5px;font-size: 10px"></td> 
     </tr> 
     <tr>   
       <th align="left">주소</th> 
       <td> 
       <input type="text" name="address1" size="45" id="sample5_address" placeholder="주소"style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"><br/> 
       <input type="text" name="address2" size="45" id="sample6_address2" placeholder="상세주소"style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"> 
<div id="map" name="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script src="//apis.daum.net/maps/maps3.js?apikey=b9b392452680977c474f8d914963d551&libraries=services"></script>
				<script>
				    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				        mapOption = {
				            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
				            level: 5 // 지도의 확대 레벨
				        };
				
				    //지도를 미리 생성
				    var map = new daum.maps.Map(mapContainer, mapOption);
				    //주소-좌표 변환 객체를 생성
				    var geocoder = new daum.maps.services.Geocoder();
				    //마커를 미리 생성
				    var marker = new daum.maps.Marker({
				        position: new daum.maps.LatLng(37.537187, 127.005476),
				        map: map
				    });
				
				    function sample5_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullAddr = data.address; // 최종 주소 변수
				                var extraAddr = ''; // 조합형 주소 변수
				                
				                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    fullAddr = data.roadAddress;
				
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    fullAddr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				                if(data.userSelectedType === 'R'){
				                    //법정동명이 있을 경우 추가한다.
				                    if(data.bname !== ''){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있을 경우 추가한다.
				                    if(data.buildingName !== ''){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				                }
				                  // 우편번호 정보를 해당 필드에 넣는다.
				                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
				             // 커서를 상세주소 필드로 이동한다.
				                document.getElementById('sample6_address2').focus();
				                // 주소 정보를 해당 필드에 넣는다.
				                document.getElementById("sample5_address").value = fullAddr;
				                // 주소로 좌표를 검색
				                geocoder.addr2coord(data.address, function(status, result) {
				                    // 정상적으로 검색이 완료됐으면
				                    if (status === daum.maps.services.Status.OK) {
				                        // 해당 주소에 대한 좌표를 받아서
				                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
				                        // 지도를 보여준다.
				                        mapContainer.style.display = "block";
				                        map.relayout();
				                        // 지도 중심을 변경한다.
				                        map.setCenter(coords);
				                        // 마커를 결과값으로 받은 위치로 옮긴다.
				                        marker.setPosition(coords)
				                    }
				                });
				            }
				        }).open();
				    }
</script>
       </td> 
     </tr> 
     <tr>   
       <th align="left">직업</th> 
       <td> 
           <select name='job'style="border:none;border:1px solid #d8d8d8;width:313px;height: 30px;border-radius:3px"> 
               <option value="0"selected>선택하세요.</option> 
               <option value="A01">회사원</option> 
               <option value="A03">전산관련직</option> 
               <option value="A05">연구전문직</option> 
               <option value="A07">각종학교학생</option> 
               <option value="A09">일반자영업</option> 
               <option value="A11">공무원</option> 
               <option value="A13">의료인</option> 
               <option value="A15">법조인</option> 
               <option value="A17">종교.언론/예술인</option> 
               <option value="A19">농업</option> 
               <option value="A23">축산업</option> 
               <option value="A25">수산업</option> 
               <option value="A27">광업</option> 
               <option value="A30">주부</option> 
               <option value="A32">무직</option> 
               <option value="A99">기타</option> 
             </select> 
         </td> 
     </tr>
  </TABLE>
  <br>
  <DIV>
    <input id='button' type='submit' value='회원가입'>
    <input id='button' type='reset' value='취소'>
  </DIV>
</FORM>
</center>
</div>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 