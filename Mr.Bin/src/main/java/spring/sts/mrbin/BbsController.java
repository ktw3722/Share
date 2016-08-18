package spring.sts.mrbin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDTO;
import spring.model.bbs.ReplyDAO;
import spring.model.bbs.ReplyDTO;
import spring.utility.mrbin.Paging;
import spring.utility.mrbin.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BbsController {
	@Autowired
	private BbsDAO dao;
	@Autowired
	private ReplyDAO rdao;
	
	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request,Model model){
		int nowPage=1;//현재페이지
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;//한페이지당 보여줄 레코드 개수
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno= nowPage*recordPerPage;
		//검색관련 변수 선언
		String col=Utility.nullCheck(request.getParameter("col"));
		String word=Utility.nullCheck(request.getParameter("word"));

		if(col.equals("total")) word="";

		Map map=new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col",col);
		map.put("word",word);
		List<BbsDTO> list=dao.list(map);
		int total=dao.total(col,word);
		String paging=new Paging().paging2(total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("rdao", rdao);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "/bbs/list";
	}
	@RequestMapping("/bbs/read")
	public String read(int nowPage, String col, String word,
			int bbsno, Model model, HttpServletRequest request,HttpSession session){
		/* 댓글 관련  시작 */
		String url = "read.jsp";
		int nPage = 1; //시작 페이지 번호는 1부터 

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

		int sno = ((nPage - 1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);

		List<ReplyDTO> list = rdao.list(map);

		int total = rdao.total(bbsno);
		int imgno=0;
		String paging = Utility.paging(total, nPage, recordPerPage, url, bbsno,imgno, nowPage, col, word);

		/* 댓글 관련 끝 */
		dao.increaseViewcnt(bbsno);
		BbsDTO dto = dao.read(bbsno);
		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");
		dto.setContent(content);
		String id = Utility.nullCheck((String) session.getAttribute("id"));
		boolean flag = dao.refnumCheck(bbsno);
		
		model.addAttribute("rdao",rdao);
		model.addAttribute("total",total);
		model.addAttribute("paging",paging);
		model.addAttribute("list",list);
		model.addAttribute("id",id);
		model.addAttribute("flag",flag);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("col",col);
		model.addAttribute("word",word);
		model.addAttribute("bbsno",bbsno);
		model.addAttribute("dto",dto);
		
		
		return "/bbs/read";
	}
}
