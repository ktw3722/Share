package spring.utility.mrbin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

import spring.model.bbs.ReplyDAO;
import spring.model.img.ImgReplyDAO;

public class Utility {
	/**
	  * 댓글 갯수 메소드
	  * @param bbsno 글번호
	  * @param rdao  댓글갯수가져올 rDAO
	  * @return 댓글갯수
	  */
	public static int rcount(int bbsno,ReplyDAO rdao){
        return rdao.rcount(bbsno);
   }
	/**
	 * 댓글 갯수 메소드
	 * @param bbsno 글번호
	 * @param rdao  댓글갯수가져올 rDAO
	 * @return 댓글갯수
	 */
	public static int imgcount(int imgno,ImgReplyDAO rdao){
		return rdao.rcount(imgno);
	}
	 /** 
	  * 댓글용 페이징 메소드
	  * @param totalRecord 전체 레코드수 
	  * @param nowPage     현재 페이지 
	  * @param recordPerPage 페이지당 레코드 수 
	  * @param url 이동할 페이지 
	  * @param bbsno 상위글번호
	  * @return 페이징 생성 문자열
	  */ 
	 public static String paging(int totalRecord, int nPage, int recordPerPage,String url,int bbsno,int imgno,int nowPage, String col, String word){ 
	   int pagePerBlock = 10; // 블럭당 페이지 수 
	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  
	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
	   int nowGrp = (int)(Math.ceil((double)nPage/pagePerBlock));    // 현재 그룹 
	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
	   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
	   StringBuffer str = new StringBuffer(); 
	    
	   str.append("<style type='text/css'>"); 
	    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
	    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
	    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
	    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
	    str.append("  .span_box_1{"); 
	    str.append("    text-align: center;"); 
	    str.append("    font-size: 20px;"); 
	    str.append("    border-radius:40px; ");
	    str.append("    border-color: #cccccc;"); 
	    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
	    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
	    str.append("  }"); 
	    str.append("  .span_box_2{");
	    str.append("    text-align: center;");    
	    str.append("    background-color: #44a2ff;"); 
	    str.append("    color: #ffffff;"); 
	    str.append("    font-size: 20px;"); 
	    str.append("    border-radius:40px; "); 
	    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
	    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
	    str.append("  }"); 
	    str.append("</style>"); 
	    str.append("<DIV id='paging'>"); 
//	     str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
	 
	   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
	   if (nowGrp >= 2){ 
	     str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&imgno="+imgno+"&nPage="+_nowPage+"'>이전</A></span>"); 
	   } 
	 
	   for(int i=startPage; i<=endPage; i++){ 
	     if (i > totalPage){ 
	       break; 
	     } 
	 
	     if (nPage == i){ 
	       str.append("<span class='span_box_2'>"+i+"</span>"); 
	     }else{ 
	       str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&imgno="+imgno+"&nPage="+i+"'>"+i+"</A></span>");   
	     } 
	   } 
	    
	   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
	   if (nowGrp < totalGrp){ 
	     str.append("<span class='span_box_1'><A href='./"+url+"?nowPage="+nowPage+"&col="+col+"&word="+word+"&bbsno="+bbsno+"&imgno="+imgno+"&nPage="+_nowPage+"'>다음</A></span>"); 
	   } 
	   str.append("</DIV>"); 
	    
	   return str.toString(); 
	 } 
//	댓글관련 유틸 끝
	public static void deleteFile(String upDir, String oldfile){
		File file = new File(upDir,oldfile);
		
		if(file.exists()){
			file.delete();
		}
	}
	/** 
	   * 직업 코드를 받아서 해당하는 값(레이블)을 리턴 
	   * @param key 
	   * @return 
	   */ 
	  public static String  getCodeValue(String key) { 
	    Hashtable codes = new Hashtable(); 

	    codes.put("A01", "회사원"); 
	    codes.put("A03", "전산관련직"); 
	    codes.put("A05", "연구전문직"); 
	    codes.put("A07", "각종학교학생"); 
	    codes.put("A09", "일반자영업"); 
	    codes.put("A11", "공무원"); 
	    codes.put("A13", "의료인"); 
	    codes.put("A15", "법조인"); 
	       codes.put("A17", "종교.언론/예술인"); 
	    codes.put("A19", "농업"); 
	    codes.put("A23", "축산업"); 
	    codes.put("A25", "수산업"); 
	    codes.put("A27", "광업"); 
	    codes.put("A30", "주부"); 
	    codes.put("A32", "무직"); 
	    codes.put("A99", "기타"); 
	     
	    Object value = codes.get(key); // A01 ~ A99가 추출 

	    return (String)(value); // 코드값에 해당하는 직업 리턴 
	  } 

	/**
	 * 오늘,어제,그제 날짜 가져오기
	 * 
	 * @return List- 날짜들 저장
	 */
	public static List<String> getDay() {
		List<String> list = new ArrayList<String>();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();// 추상클래스라서 new안함.날짜불러오기
		for (int j = 0; j < 3; j++) {
			list.add(sd.format(cal.getTime()));// 오늘 날짜
			cal.add(Calendar.DATE, -1);// 어제날짜
		}

		return list;
	}

	/**
	 * 등록날짜와 오늘,어제,그제날짜와 비교
	 * 
	 * @param wdate
	 *            - 등록날짜
	 * @return - true:오늘,어제,그제중 등록날짜와 같음 false:오늘,어제,그제 날짜가 등록날짜와 다 다름
	 */
	public static boolean compareDay(String wdate) {// wdate등록날짜
		boolean flag = false;
		List<String> list = getDay();
		if (wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) {
			flag = true;
		}

		return flag;
	}

	public static String nullCheck(String str) {
		if (str == null) {
			str = "";
		}
		return str;
	}
}
