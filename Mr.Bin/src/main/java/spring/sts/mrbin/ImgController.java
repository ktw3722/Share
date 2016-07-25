package spring.sts.mrbin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;
import spring.model.img.ImgReplyDAO;
import spring.utility.mrbin.Paging;
import spring.utility.mrbin.Utility;

@Controller
public class ImgController {
	@Autowired
	private ImgDAO dao;
	
	@Autowired
	private ImgReplyDAO rdao;
	
	@RequestMapping("/img/list")
	public String list(HttpServletRequest request,Model model){
		String col=Utility.nullCheck(request.getParameter("col"));
		String word=Utility.nullCheck(request.getParameter("word"));
		
		if(col.equals("total")) word = "";

		int nowPage = 1;
		int recordPerPage = 3;

		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage-1)*recordPerPage)+1 ;
		int eno = nowPage * recordPerPage ;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);

		List<ImgDTO> list = dao.list(map);
		int total = dao.total(col,word);

		String paging = new Paging().paging2(total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("rdao", rdao);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "Mr.bini/img/list";
	}
}
