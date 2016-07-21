<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,guest.*,java.text.SimpleDateFormat"%>
<%
String toDate = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
String root=request.getContextPath();
%>
<jsp:useBean id="dao" class="guest.GuestDAO" />
<jsp:useBean id="dto" class="guest.GuestDTO" />
<jsp:setProperty property="*" name="dto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<style>
.bgBlur:BEFORE {
  content: '';
  position: absolute;
  top: 0; left:0; right:0; bottom:0;
  background: inherit;
  z-index:-1;
  filter: blur(6px); 
  -webkit-filter: blur(6px); 
  -moz-filter: blur(6px);
  -o-filter: blur(6px);
  filter:url(#blur);
}
.bgBlur{
background-color: rgba( 255, 255, 255, 0.5 );
width: 83%;
border-radius:10px;
box-shadow:0 0 1em black;
}
.container {
	width: 80%;
	padding: 10px;
}
.talk_input {
	position: relative;
	margin-top: 20px;
	width: 80%;
	padding: 5px;
	border:1px solid #d8d8d8;
	height: 30px;
}
.talk_view {
	position: relative;
	width: 94%;
	height: 200px;
	padding: 5px;
	border:1px solid #d8d8d8;
	overflow-y: scroll;
}

</style>
<link rel="stylesheet" href="<%=root %>/css/skin.css">
<link rel="stylesheet" href="<%=root %>/css/loginbar.css">
<script type="text/javascript" src="./httpRequest.js"></script>
<script type="text/javascript">
function ecd(field){
	   return encodeURIComponent(field);
	}

// 텍스트에 박스에 입력한 대화내용을 서버에 전송한다.
function sendTalk(f) {
	var id = f.mname.value;
	if(id==''){
		alert("이름을 입력하세요")
		return false;
		}
    var obj = document.getElementById("talk_input");
    if(obj.value=='') {		
         alert("내용을 입력하세요")
         return false;
    }
         var param="content="+ecd(obj.value)+"&mname="+ecd(id)+"&wdate="+'<%=toDate%>';
         sendRequest("guestProc.jsp", param, viewrespon, "post");
        obj.value = ""; //텍스트필드 초기화
        obj.focus();  //커서를 텍스트필드에 위치한다.
    }
function viewrespon() {    
	//alert('httpRequest.readyState: ' + httpRequest.readyState + '\n\n httpRequest.status: ' + httpRequest.status);
    if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
        if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
            
        	var obj = document.getElementById("talk_view");
        	var origindate=obj.innerHTML.substring(obj.innerHTML.indexOf(">")+1,obj.innerHTML.indexOf("</"));
        	var newdate=httpRequest.responseText.substring(httpRequest.responseText.lastIndexOf("(")+1,
        				httpRequest.responseText.lastIndexOf("(")+11); 
        	// 서버로부터 전송된 문자열
            // div 태그의 값으로 responseText값을 할당합니다.
            if(newdate!=origindate){
            	obj.innerHTML =  "<div style='margin-bottom:10px;color:#0067ce;text-align: center;border:1px solid ;border-color:#eaeaea;box-shadow: 0px 0px 5px #888888'>"+newdate+"</div>"
            	+httpRequest.responseText.substring(0,httpRequest.responseText.lastIndexOf("("))
            	+"("+httpRequest.responseText.substring(httpRequest.responseText.lastIndexOf("(")+12)  +"<br>"+obj.innerHTML;
            }
            else{
            	obj.innerHTML =obj.innerHTML.substring(0, obj.innerHTML.indexOf("/d")+4)
            	+httpRequest.responseText.substring(0, httpRequest.responseText.indexOf("("))+"("
            	+httpRequest.responseText.substring(httpRequest.responseText.indexOf("(")+12, httpRequest.responseText.indexOf("(")+21)+"<br>"+obj.innerHTML.substring(obj.innerHTML.indexOf("/d")+5);
           
            }
        }else{
        	alert("error:"+httpRequest.status)
        }
    }
}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" flush="false" />
	<div class=article_skin>
		<center>
		<div class="bgBlur" style="background-image: url('../../image/돛단배.jpg')">
		<div class="container">
			<form style="text-align: left;">
			<div style="font-size: 30px;padding-left: 10px">GuestBook</div>
				<input style="border-radius:3px;width: 150px" class="talk_input"type="text" name="mname" id="mname" placeholder="이름을 입력하세요"><br>
				<input style="border-radius:3px" class="talk_input" type="text" name="talk_input" id="talk_input" 
				       onkeydown="javascript:if(event.keyCode==13){sendTalk(this.form);return false;}"
					   placeholder="내용을 입력하세요"> 
				<input id="white"type="button"
					name="talk_send" id="talk_send" value="입력"
					onclick="sendTalk(this.form)"
					style="margin-top: 20px"
					> <br>
				<br>
				<div id="talk_view" class="talk_view">
					<%
List list = dao.list();
String compareday="";
for(int i=0; i<list.size(); i++){
	dto = (GuestDTO)list.get(i);
	if(compareday==""){
		out.print("<div style='margin-bottom:10px;color:#0067ce;text-align: center;border:1px solid ;border-color:#eaeaea;box-shadow: 0px 0px 5px #888888'>"+dto.getWdate().substring(0,10)+"</div>");}
	else if(!compareday.equals(dto.getWdate().substring(0,10))){
		out.print("<div style='margin-top:10px;margin-bottom:10px;color:#0067ce;text-align: center;border:1px solid ;border-color:#eaeaea;box-shadow: 0px 0px 5px #888888'>"+dto.getWdate().substring(0,10)+"</div>");}
	
	out.print("<span style='font-weight: bold;'>"+(dto.getMname()+"</span>"+"-"+dto.getContent()+"("+dto.getWdate().substring(11)+")"+"<br>"));
	compareday = dto.getWdate().substring(0,10);}
%>
				</div>
			</form>
		</div>
		</div>
		</center>
	</div>
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>